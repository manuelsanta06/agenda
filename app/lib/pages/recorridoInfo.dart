import 'package:agenda/pages/recorridos.dart';
import 'package:agenda/utilities/encargados.dart';
import 'package:agenda/utilities/shifts.dart';

import '../widgets/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:agenda/database/app_database.dart';
import 'package:drift/drift.dart' as drift;
import '../widgets/cards.dart';
import 'package:provider/provider.dart';
import '../utilities/parsers.dart';

class recorridoInfo extends StatelessWidget{
  final Recorrido reco;
  final Color maincolor;
  String searchQuery="";
  
  recorridoInfo({
    super.key,
    required this.reco,
    required this.maincolor
  });

  void snack(BuildContext context,bool succes){
    if(succes){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor:Colors.green,duration:Duration(seconds:2),content: Text('Agregado')),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor:Colors.red,duration:Duration(seconds:2),content: Text('Cancelado')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:3,
      initialIndex:1,
      child:Scaffold(
        appBar:AppBar(
          backgroundColor:Theme.of(context).cardColor,
          elevation:0,
          leading:const BackButton(),
          
          //TITULO
          title:Row(
            children:[
              Expanded(
                child:Text(
                  reco.name,
                  style:const TextStyle(fontWeight:FontWeight.bold,fontSize:18),
                  overflow:TextOverflow.ellipsis,
                ),
              ),
              Container(
                padding:const EdgeInsets.symmetric(horizontal:10,vertical:4),
                decoration:BoxDecoration(
                  color:maincolor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: maincolor.withOpacity(0.5)),
                ),
                child: Text(
                  "\$${numberParser(reco.basePrice)}",
                  style: TextStyle(
                    color: maincolor, 
                    fontSize: 14, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),

          //BOTONES
          bottom: TabBar(
            labelColor: maincolor,
            unselectedLabelColor: Colors.grey,
            indicatorColor: maincolor,
            indicatorWeight: 3,
            tabs: const [
              Tab( text: "Horarios",  icon:Icon(Icons.access_time),),
              Tab( text: "Info",      icon:Icon(Icons.info_outline),),
              Tab( text: "Pasajeros", icon:Icon(Icons.groups),),
            ],
          ),
        ),

        //las paginas
        body: TabBarView(
          children: [
            _buildHorariosTab(context),
            _buildInfoTab(context),
            _buildPasajerosTab(context),
          ],
        ),
      ),
    );
  }


  Widget _buildHorariosTab(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    return StreamBuilder<List<RecorridoShift>>(
      stream:(db.select(db.recorridoShifts)..where((t)=>t.recorridoId.equals(reco.id))).watch(),
      builder:(context,snapshot){
        if(snapshot.hasError){return Center(
          child: SingleChildScrollView(child:Text("""perdon, pasale captura a manu
            Error: ${snapshot.error}
            Stacktrace:
            ${snapshot.stackTrace.toString()
              .split('\n').take(6).join('\n')}""", 
            style: TextStyle(color: Colors.red))
          ));
        }
        if(!snapshot.hasData)return const Center(child: CircularProgressIndicator());
        final shifts=snapshot.data!;
        //if(shifts.isEmpty)return const Center(child:Text("..."));
        return ListView(
          padding: const EdgeInsets.all(16),
          children:[
            ...List.generate(shifts.length,(index)=>shiftToCard(
              context,maincolor,shifts[index],
              ()async{await showCreateModifiShiftSheet(context,maincolor,reco.id,shiftEdit:shifts[index]);},
              ()async{
                //TODO: shift removing
              }
            )),
            Material(
              color: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side:const BorderSide(color:Color(0xFF94A3B8),width:2,),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap:()async=>snack(context,(await showCreateModifiShiftSheet(context,maincolor,reco.id))??false),
                child: Container(
                  width:double.infinity,
                  padding:const EdgeInsets.symmetric(vertical:7,horizontal:5),
                  alignment:Alignment.center,
                  child:const Text( "Agregar",
                    style: TextStyle(color: Color(0xFF94A3B8)),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildInfoTab(BuildContext context) {
    return ListView(
      padding:const EdgeInsets.all(16),
      children: [
        BasicCard(
          child: ListTile(
            title: const Text("Editar Nombre"),
            subtitle: Text(reco.name),
            trailing: Icon(Icons.edit, color: maincolor),
          ),
          onPressed:()async{
            final newVal=await quickChangeDialog(context,'nombre',def:reco.name);
            if(newVal==null)return;
            final deafDb=Provider.of<AppDatabase>(context,listen:false);
            await (deafDb.update(deafDb.recorridos)
              ..where((tbl)=>tbl.id.equals(reco.id)))
              .write(RecorridosCompanion(name:drift.Value(newVal),isSynced:drift.Value(false)));
          },
        ),
        const SizedBox(height: 10),
        BasicCard(
          child: ListTile(
            title: const Text("Editar Precio Base"),
            subtitle: Text("\$ ${reco.basePrice}"),
            trailing: Icon(Icons.attach_money, color: maincolor),
          ),
          onPressed:()async{
            final newVal=await quickChangeDialog(context,'precio',def:reco.basePrice.toString());
            if(newVal==null)return;
            final deafDb=Provider.of<AppDatabase>(context,listen:false);
            await (deafDb.update(deafDb.recorridos)
              ..where((tbl)=>tbl.id.equals(reco.id)))
              .write(RecorridosCompanion(basePrice:drift.Value(int.parse(newVal)),isSynced:drift.Value(false)));
          },
        ),
      ],
    );
  }

  Widget _buildPasajerosTab(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    return Scaffold(
      body:Column(children:[
        SizedBox(height:6),
        mySearchBar(onChanged:(value){searchQuery=value;}),
        Expanded(child:StreamBuilder<List<(Encargado, List<RecorridoSubscription>)>>(
          stream: (db.select(db.encargados).join([
            drift.innerJoin(
              db.recorridoSubscriptions, 
              db.recorridoSubscriptions.encargadoId.equalsExp(db.encargados.id)
            )]) ..where(db.recorridoSubscriptions.recorridoId.equals(reco.id))).watch()
            .map((rows){
              final grouped = <Encargado, List<RecorridoSubscription>>{};
              for (final row in rows){
                final encargado=row.readTable(db.encargados);
                final sub=row.readTable(db.recorridoSubscriptions);
                grouped.putIfAbsent(encargado,()=>[]);
                grouped[encargado]!.add(sub);
              }
              return grouped.entries.map((entry)=>(entry.key,entry.value)).toList();
            }),
          builder:(context,snapshot){
            if(snapshot.hasError){return Center(
              child: SingleChildScrollView(child:Text("""perdon, pasale captura a manu
                Error: ${snapshot.error}
                Stacktrace:
                ${snapshot.stackTrace.toString()
                  .split('\n').take(6).join('\n')}""", 
                style: TextStyle(color: Colors.red))
              ));
            }
            if(!snapshot.hasData)return const Center(child: CircularProgressIndicator());
            final List<(Encargado,List<RecorridoSubscription>)> allData=snapshot.data!;
            //if(allData.isEmpty)return Center(child:Text("..."));
            final filtered=allData.where((s){
              return s.$1.name.contains(searchQuery)||
                (s.$1.phone?.contains(searchQuery)??false)||
                s.$2.any((sub)=>sub.subscriptionName.contains(searchQuery));
            }).toList();
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount:filtered.length+1,
              itemBuilder:(context,index){
                if(index==filtered.length){return Material(
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side:const BorderSide(color:Color(0xFF94A3B8),width:2,),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap:()async=>snack(context,(await showCreateModifiEncargadoSheet(context,maincolor,reco.id,searchQuery))??false),
                    child: Container(
                      width:double.infinity,
                      padding:const EdgeInsets.symmetric(vertical:7,horizontal:5),
                      alignment:Alignment.center,
                      child:const Text( "Agregar",
                        style: TextStyle(color: Color(0xFF94A3B8)),
                      ),
                    ),
                  ),
                );}
                return encargadoToCard(
                  context,
                  recorridosPage.mainColor,
                  filtered[index].$1,
                  filtered[index].$2,
                  ()=>_editBalanceDialog(context,filtered[index].$1,filtered[index].$2),
                  ()=>showCreateModifiEncargadoSheet(
                    context,maincolor,reco.id,null,
                    encargadoEdit:filtered[index].$1,
                    subsEdit:filtered[index].$2
                  ),
                );
              },
            );
          },
        ))
      ]),
    );
  }

  void _editBalanceDialog(BuildContext context,Encargado enca,List<RecorridoSubscription> subs)async{
    final controller = TextEditingController();
    int monthlyCost=0;
    for(final tmp in subs)if(tmp.isActive)monthlyCost+=(tmp.customPrice??reco.basePrice);
    await showDialog<String?>(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Modificar Deuda"),
          content:Column(mainAxisSize:MainAxisSize.min,children:[
            BasicCard(
              tonality: enca.balance < 0 ? Colors.red : Colors.green,
              borderColor:enca.balance < 0 ? Colors.red : Colors.green,
              child:Column(children:[
                Text('SALDO ACTUAL',style:TextStyle(fontSize:12)),
                Text('\$'+numberParser(enca.balance.toInt()),style:TextStyle(
                  color:enca.balance<0?Colors.red:Colors.green, fontSize:20,
                )),
              ]),
            ),
            SizedBox(height:10),
            TextField(
              controller: controller,
              keyboardType:const TextInputType.numberWithOptions(decimal:true),
              decoration: InputDecoration(
                labelText:"Monto",
                prefixIcon:Icon(Icons.attach_money),
                border:OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.05),
                focusedBorder: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(12),
                  borderSide:BorderSide(color:maincolor,width:2),
                ),
              ),
            ),
            SizedBox(height:10),
            ElevatedButton(
              onPressed:()async{
                await _updateBalance(context,enca,monthlyCost);
                Navigator.of(context).pop();
              },
              style:ButtonStyle(
                backgroundColor:MaterialStateProperty.all(Colors.green.withAlpha(50)),
              ),
              child:Text("Pago total (\$+$monthlyCost)",style:TextStyle(color:Colors.green)),
            )
          ]),
          actions:[
            TextButton(
              child: const Text("Cancelar",style:TextStyle(color:Colors.red)),
              onPressed:()=>Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text("Aceptar",style:TextStyle(color:Colors.green)),
              onPressed:()async{
                await _updateBalance(context,enca,int.tryParse(controller.value.text)??0);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }

  Future<void> _updateBalance(BuildContext context,Encargado enca,int amount)async{
    if(amount==0)return;
    final deafDb=Provider.of<AppDatabase>(context,listen:false);
    await (deafDb.update(deafDb.encargados)
      ..where((tbl)=>tbl.id.equals(enca.id)))
      .write(EncargadosCompanion(balance:drift.Value(enca.balance+amount),isSynced:drift.Value(false)));
  }
}
