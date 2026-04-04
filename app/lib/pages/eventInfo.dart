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
  final Event initialEvent;
  final List<Stop> sto;
  late Color defColor;

  eventInfo({
    required this.initialEvent,
    required this.sto,
    required this.defColor,
  });

  Color getMainColor(EventStates currentEvent){
    if(currentEvent==EventStates.REMOVED||currentEvent==EventStates.INCOMPLETE) {
      return const Color.fromARGB(175,255,92,0);
    }
    return defColor;
  }


  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);
    final deafDb=Provider.of<AppDatabase>(context, listen: false);

    return SafeArea(top:false,child:Scaffold(
      extendBodyBehindAppBar: true,
      body:StreamBuilder<Event>(
        stream:(deafDb.select(deafDb.events)..where((t) => t.id.equals(initialEvent.id))).watchSingle(),
        initialData:initialEvent,
        builder:(context, snapshot){
          if(snapshot.hasError||snapshot.data==null){
            return const Center(child: Text("El evento ya no existe"));
          }
          final eve=snapshot.data!;
          final maincolor=getMainColor(eve.state);

          return ListView(padding:const EdgeInsets.symmetric(horizontal:5),children:[
            //TOP card
            BasicCard(
              padding: const EdgeInsets.all(24),
              child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
                const SizedBox(height:10),
                Row(children:[
                  pillText(eventStateToString(eve.state),maincolor),
                  Expanded(child:Container()),
                  IconButton(
                    icon:Icon(Icons.edit),
                    onPressed:()async{
                      final success=await showCreateTripSheet(context,
                        isTrip:eve.isTrip,
                        mainColor:maincolor,
                        event:eve,stops:sto,
                        startDate:eve.startDateTime,
                      );
                      if(success&&context.mounted){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:Text("Viaje guardado correctamente"),backgroundColor:Colors.green,
                          ),
                        );
                      }
                    }
                  ),
                ]),
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
                
                Row(children:[
                  pillText('\$'+eve.price.toString(),maincolor,onTap:()async{
                    String? newVal=await quickChangeDialog(context,"precio",def:eve.price.toString());
                    if(newVal==null||newVal.isEmpty)return;
                    await (deafDb.update(deafDb.events)
                      ..where((tbl) => tbl.id.equals(eve.id)))
                      .write(EventsCompanion(price:drift.Value(int.tryParse(newVal)??eve.price),isSynced:drift.Value(false)));
                  }),
                  const SizedBox(width:10),
                  if(eve.repeat)
                  weekDaysDots(eve.days,maincolor)
                  else
                  Text(DateFormat('MMMM d','es_ES').format(eve.startDateTime))
                ]),
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
                      onTap:()async{
                        await launchUrl(Uri.parse("https://wa.me/${eve.contact}"),mode:LaunchMode.externalApplication);
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

            //DATA card
            const SizedBox(height:20),
            subtitleLine("Info",maincolor),
            BasicCard(
              child:eve.data.isNotEmpty?
                Text(eve.data):
                Center(child:Text("Agregar informacion",style:TextStyle(color:Colors.grey))),
              onPressed:()async{
                String? newVal=await quickChangeDialog(context,"informacion",def:eve.data,multiLine:true);
                if(newVal==null||newVal.isEmpty)return;
                await (deafDb.update(deafDb.events)
                  ..where((tbl) => tbl.id.equals(eve.id)))
                  .write(EventsCompanion(data:drift.Value(newVal),isSynced:drift.Value(false)));
              },
            ),

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
          ],);
        }
      )
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

