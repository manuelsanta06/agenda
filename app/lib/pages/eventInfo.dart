import 'package:agenda/utilities/colectivos.dart';
import 'package:agenda/utilities/people.dart';
import 'package:agenda/utilities/events.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:agenda/database/app_database.dart';
import 'package:drift/drift.dart' as drift;
import '../widgets/cards.dart';
import 'package:agenda/widgets/text.dart';
import 'package:intl/intl.dart';
import '../widgets/eventDetails.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utilities/parsers.dart';


class eventInfo extends StatelessWidget{
  final Event eve;
  final List<Stop> sto;
  late Color maincolor;

  eventInfo(
    Color color,{
    super.key,
    required this.eve,
    required this.sto,
  }){
    if(eve.state==EventStates.REMOVED||eve.state==EventStates.INCOMPLETE)maincolor=Color.fromARGB(175,255,92,0);
    else maincolor=color;
  }

  //Future<void> _updateEvent(AppDatabase db)async{
  //  eve=(await ((db.select(db.events)..where((s)=>s.id.equals(eve.id))).get()))[0];
  //}


  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    final deafDb=Provider.of<AppDatabase>(context, listen: false);

    return SafeArea(top:false,child:Scaffold(
      extendBodyBehindAppBar: true,
      body:ListView(padding:const EdgeInsets.symmetric(horizontal:5),children:[

        //TOP card
        BasicCard(
          padding: const EdgeInsets.all(24),
          child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
            const SizedBox(height:10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: maincolor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                eventStateToString(eve.state),
                style: TextStyle(color: maincolor, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),

            const SizedBox(height:10),
            GestureDetector(
              onTap:()async{
                String? newVal=(await quickChangeDialog(context,"nombre",def:eve.name));
                if(newVal==null||newVal.isEmpty)return;
                await (deafDb.update(deafDb.events)
                  ..where((tbl) => tbl.id.equals(eve.id)))
                  .write(EventsCompanion(name:drift.Value(newVal),isSynced:drift.Value(false)));
              },
              child:Text(
                eve.name,
                style:TextStyle(fontSize:20, fontWeight:FontWeight.bold),
              ),
            ),
            
            if(eve.repeat)
            weekDaysDots(eve.days,maincolor)
            else
            Text(DateFormat('MMMM d','es_ES').format(eve.startDateTime))
          ]),
        ),
        
        //CONTACT INFO card
        const SizedBox(height:20),
        subtitleLine("Contacto",maincolor),
        BasicCard(child:Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              GestureDetector(
                child: Row(children:[
                  Icon(Icons.person),
                  SizedBox(width: 8),
                  Text(eve.contactName??"Agregar informacion"),
                ]),
                onTap:()async{
                    String? newVal=await quickChangeDialog(context,"nombre del contacto",def:eve.contactName.toString());
                    if(newVal==null||newVal.isEmpty)return;
                    await (deafDb.update(deafDb.events)
                      ..where((tbl) => tbl.id.equals(eve.id)))
                      .write(EventsCompanion(contactName:drift.Value(newVal),isSynced:drift.Value(false)));
                  },
              ),
              SizedBox(height:10),
              Row(children:[
                GestureDetector(
                  child:Icon(Icons.phone),
                  onTap: ()async{
                    await launchUrl(Uri.parse("https://wa.me/${eve.contact}"), mode: LaunchMode.externalApplication);
                  },
                ),
                SizedBox(width: 8),
                GestureDetector(
                  child:Text(eve.contact??"Agregar informacion"),
                  onTap:()async{
                    String? newVal=(await quickChangeDialog(context,"contacto",def:eve.contact.toString()));
                    if(newVal==null||newVal.isEmpty)return;
                    await (deafDb.update(deafDb.events)
                      ..where((tbl) => tbl.id.equals(eve.id)))
                      .write(EventsCompanion(contact:drift.Value(phoneParser(newVal)),isSynced:drift.Value(false)));
                  },
                )
              ]),
            ],
          )
        ],)),

        //CHOFERES card
        const SizedBox(height:20),
        subtitleLine("Choferes",maincolor),
        BasicCard(child:Column(children: [
          StreamBuilder(
            stream:db.watchChoferesAvailability(
              eve.startDateTime,eve.endDateTime,eve.id,
              onlyForEventId:eve.id
            ),
            builder:(context,snapshot){
              if(snapshot.hasError){
                return Center(
                  child: SingleChildScrollView(child:Text("""perdon, pasale captura a manu
                    Error: ${snapshot.error}
                    Stacktrace:
                    ${snapshot.stackTrace.toString()
                      .split('\n').take(6).join('\n')}""", 
                    style: TextStyle(color: Colors.red))
                ));
              }
              if(!snapshot.hasData)return const Center(child: CircularProgressIndicator());

              final listaChoferes = snapshot.data ?? [];
              if(listaChoferes.isEmpty){return Text(
                "No hay choferes asignados",
                style:TextStyle(color:Colors.grey)
              );}
              return Column(
                children:listaChoferes.map((sel){return choferToCard(
                  context,sel.$1,maincolor,
                  busy:sel.$2,
                  hideOptions:true,
                  onLongPress:()async{
                    await (db.delete(db.eventChoferes)
                      ..where((tbl)=>tbl.eventId.equals(eve.id)&tbl.choferId.equals(sel.$1.id))).go();
                    await updateFullEventState(deafDb,eve);
                  },
                );}).toList(),
              );

            },
          ),
          const SizedBox(height:20),
          _buildAddButton("Agregar chofer",()async{
            //final choferes=await((deafDb.select(deafDb.choferes)..where((u)=>u.is_active.equals(true))).get());
            final choferes=await deafDb.getChoferesWithAvailability(eve.startDateTime,eve.endDateTime,eve.id);
            final selection=await choferCardSelectionList(context,choferes,maincolor);
            if(selection==null)return;
            await deafDb.into(deafDb.eventChoferes).insert(EventChoferesCompanion(
              eventId: drift.Value(eve.id),
              choferId: drift.Value(selection.id),
            ));
            await updateFullEventState(deafDb,eve);
          })
        ])),

        //COLECTIVOS card
        const SizedBox(height:20),
        subtitleLine("Colectivos",maincolor),
        BasicCard(child:Column(children: [
          StreamBuilder(
            stream:db.watchColectivosAvailability(
              eve.startDateTime,eve.endDateTime,eve.id,
              onlyForEventId:eve.id
            ),
            builder:(context,snapshot){
              if(snapshot.hasError){
                return Center(
                  child: SingleChildScrollView(child:Text("""perdon, pasale captura a manu
                    Error: ${snapshot.error}
                    Stacktrace:
                    ${snapshot.stackTrace.toString()
                      .split('\n').take(6).join('\n')}""", 
                    style: TextStyle(color: Colors.red))
                ));
              }
              if(!snapshot.hasData)return const Center(child: CircularProgressIndicator());

              final listaColectivos = snapshot.data ?? [];
              if(listaColectivos.isEmpty){return Text(
                "No hay colectivos asignados",
                style:TextStyle(color:Colors.grey)
              );}
              return Column(
                children:listaColectivos.map((sel){return colectivoToCard(
                  context,sel.$1,maincolor,
                  fullInfo:false,
                  busy:sel.$2,
                  hideOptions:true,
                  onLongPress:()async{
                    await (db.delete(db.eventColectivos)
                      ..where((tbl)=>tbl.eventId.equals(eve.id)&tbl.colectivoId.equals(sel.$1.id))).go();
                    await updateFullEventState(deafDb,eve);
                  },
                );}).toList(),
              );
            },
          ),
          const SizedBox(height:20),
          _buildAddButton("Agregar colectivo",()async{
            final colectivos=await deafDb.getColectivosWithAvailability(eve.startDateTime,eve.endDateTime,eve.id);
            final selection=await colectivoCardSelectionList(context,colectivos,maincolor);
            if(selection==null)return;
            await deafDb.into(deafDb.eventColectivos).insert(EventColectivosCompanion(
              eventId: drift.Value(eve.id),
              colectivoId: drift.Value(selection.id),
            ));
            await updateFullEventState(deafDb,eve);
          }),
        ],)),


        const SizedBox(height:20),
        subtitleLine("Ruta",maincolor),
        if(sto.length>5)
        BasicCard(child:stopsLineVertical(sto,eve.repeat,maincolor))
        else
        BasicCard(child:stopsLineHorizontal(sto,eve.repeat,maincolor))
      ],),
    ));
  }



  Widget _buildAddButton(String label, AsyncCallback onPressed){
    return InkWell(
      onTap:onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, size: 18, color: Colors.grey.shade600),
            const SizedBox(width: 8),
            Text(label, style: TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

