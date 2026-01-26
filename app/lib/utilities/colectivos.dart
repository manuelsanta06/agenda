import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' as drift; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/app_database.dart';
import '../widgets/searchBar.dart';

bool isToday(DateTime date){
  final now = DateTime.now();
  return date.day == now.day &&
    date.month == now.month &&
    date.year == now.year;
}
bool isYesterday(DateTime date){
  var yesterday = DateTime.now().subtract(Duration(days: 1));
  return date.day == yesterday.day &&
    date.month == yesterday.month &&
    date.year == yesterday.year;
}

Future<ColectivosCompanion?> showAddColectivoSheet(BuildContext context,{Colectivo? bus})async{
  final nameC = TextEditingController(text: bus?.name??"");
  final plateC = TextEditingController(text: bus?.plate??"");
  final internC = TextEditingController(text: bus?.number?.toString() ?? "");

  return await showModalBottomSheet<ColectivosCompanion?>(
    context: context,
    isScrollControlled: true,
    builder:(BuildContext context){
      return AnimatedPadding(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.only(
          left: 15,right: 15,
          top: 15,bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children:<Widget>[
            Text("Nombre"),
            const SizedBox(height: 8),
            TextField(decoration: InputDecoration(hintText: "A"),
              controller: nameC,),

            const SizedBox(height: 16),
            Text("Patente"),
            const SizedBox(height: 8),
            TextField(decoration: InputDecoration(hintText: "AAA-000"),
              controller: plateC,),

            const SizedBox(height: 16),
            Text("Interno"),
            const SizedBox(height: 8),
            TextField(decoration: InputDecoration(hintText: "NN"),
              controller: internC,),
            const SizedBox(height: 50),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text("Guardar"),
                onPressed:(){
                  if(plateC.text.isEmpty)return;
                  final nuevo = ColectivosCompanion(
                    id: drift.Value(bus?.id?? Uuid().v4()),
                    name: drift.Value(nameC.text),
                    plate: drift.Value(plateC.text),
                    number: drift.Value(int.tryParse(internC.text)),
                    
                    fuelAmount: bus == null ? const drift.Value("0") : const drift.Value.absent(),
                    fuelDate: bus == null ? drift.Value(DateTime.now()) : const drift.Value.absent(),
                  );
                  Navigator.pop(context, nuevo);
                },
              )
            ),
            const SizedBox(height: 20),
          ]
        ),
      );
    },
  );
}

Future<void> inputFuelDialog(BuildContext context, Colectivo bus){
  final controller = TextEditingController();
  return showDialog<void>(
    context: context,
    builder:(BuildContext context){
      return AlertDialog(
        title: const Text("Ingresar gasoil"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "${bus.fuelAmount}",),
        ),
        actions: [
          TextButton(
            child: const Text("Cancelar"),
            onPressed:(){Navigator.pop(context);},
          ),
          TextButton(
            child: const Text("Aceptar"),
            onPressed:()async{
              final db=Provider.of<AppDatabase>(context, listen: false);
              await (db.update(db.colectivos)
                ..where((tbl) => tbl.id.equals(bus.id)))
                .write(ColectivosCompanion(
                  fuelAmount: drift.Value(controller.text),
                  fuelDate: drift.Value(DateTime.now()),
                ));
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

Future<void> removeColectivoDialog(BuildContext context,Colectivo bus,bool restaurar)async{
  return showDialog<void>(
    context: context,
    builder:(BuildContext context){
      return AlertDialog(
        title:Text("${restaurar?"Restaurar":"Eliminar"} Colectivo?"),
        content: Text("¿Seguro que queres ${restaurar?"restaurar":"eliminar"} '${bus.name==""?bus.plate:bus.name}'?"),
        actions: [
          TextButton(
            child: const Text("Cancelar"),
            onPressed:()=> Navigator.pop(context),
          ),
          TextButton(
            child:Text(restaurar?"Restaurar":"Eliminar", style: TextStyle(color: Colors.red)),
            onPressed:()async{
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:Text("'${bus.name==""?bus.plate:bus.name}' ${restaurar?"Restaurado":"Eliminado"}"),
                backgroundColor:Colors.red,
              ));
              final db=Provider.of<AppDatabase>(context, listen: false);
              await (db.update(db.colectivos)
                ..where((tbl)=>tbl.id.equals(bus.id)))
                .write(ColectivosCompanion(
                  is_active: drift.Value(restaurar)
                ));
            },
          ),
        ],
      );
    },
  );
}

Widget colectivoToCard(
  BuildContext context,
  Colectivo bus,
  Color mainColor,{
  bool busy=false,
  VoidCallback? onPressed,
  VoidCallback? onLongPress,
}){
  return Container(
    width: double.infinity,
    margin:const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    padding:const EdgeInsets.only(top: 5,bottom:5,left: 10,right:0),
    child:Material(
      clipBehavior:Clip.hardEdge,
      borderRadius:BorderRadius.circular(10),
      color:bus.is_active&&!busy?Colors.white12:Colors.red.withValues(alpha:0.3),
      child:Stack(
        fit: StackFit.passthrough,
        children: [
          InkWell(
            //borderRadius: BorderRadius.circular(10),
            onTap:onPressed,
            onLongPress:onLongPress,
            
            child: Padding(padding:const EdgeInsets.all(14),child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nombre: ${(bus.name ?? "").isEmpty?bus.plate:bus.name}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Patente: ${bus.plate}"),
                if(bus.number!=null)Text("Interno: ${bus.number}"),
                if(bus.fuelDate!=null&&bus.is_active)
                Text("Gasoil: ${isToday(bus.fuelDate!)?"Hoy"
                  :isYesterday(bus.fuelDate!)?"Ayer"
                  :"Hace ${bus.fuelDate!.difference(DateTime.now()).inDays} dias"} -> ${bus.fuelAmount!}"),
              ],
            )),
          ),
          Positioned(
            top: -5,
            right: 0,
            child: IconButton(
              icon: Icon(Icons.edit, color: mainColor),
              onPressed:()async{
                final nuevo=await showAddColectivoSheet(context, bus: bus);
                if(nuevo==null)return;
                final db=Provider.of<AppDatabase>(context, listen: false);
                await (db.update(db.colectivos)
                  ..where((tbl) => tbl.id.equals(bus.id)))
                  .write(nuevo);
              },
            ),
          ),
        ],
      )
    )
  );
}

Future<Colectivo?> colectivoCardSelectionList(BuildContext context,List<(Colectivo,bool)> buses,Color maincolor)async{
  String searchQuery="";
  return await showModalBottomSheet<Colectivo>(
    context:context,
    isScrollControlled: true,
    constraints:BoxConstraints(maxHeight:MediaQuery.of(context).size.height*0.8),
    builder:(BuildContext context){
      return StatefulBuilder(builder:(BuildContext context,StateSetter setStateModal){
        final filtered=buses.where((s){
          return (s.$1.name?.contains(searchQuery)??false)
            ||s.$1.plate.contains(searchQuery);
        }).toList();
        return Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),child:Column(
          mainAxisSize:MainAxisSize.min,
          children:[
            const SizedBox(height:10),
            mySearchBar(onChanged:(value)=>setStateModal((){searchQuery=value;})),
            const SizedBox(height:10),
            Flexible(child:ListView.builder(
              shrinkWrap: true,
              itemCount:filtered.length,
              itemBuilder:(context,index){
                return Container(
                  margin: EdgeInsets.symmetric(horizontal:15),
                  child:colectivoToCard(
                    context,filtered[index].$1,maincolor,
                    busy:filtered[index].$2,
                    onPressed:()=>Navigator.of(context).pop(filtered[index].$1),
                  )
                );
              },
            ))
          ]
        ));
      });
    },
  );
}
