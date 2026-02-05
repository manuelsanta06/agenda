import 'package:flutter/material.dart';
import '../utilities/events.dart';
import '../widgets/searchBar.dart';
import '../widgets/buttons.dart';
import 'package:agenda/database/app_database.dart';
import 'package:drift/drift.dart' as drift; 
import 'package:provider/provider.dart';
import '../constants.dart' as constants;
import 'package:table_calendar/table_calendar.dart';

import 'package:drift_db_viewer/drift_db_viewer.dart';

class calendarPage extends StatefulWidget {
  const calendarPage({super.key});
  static const Color mainColor=Colors.cyan;

  void errorSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:Text('Algo salio mal. Viaje borrado'),
        duration: Duration(seconds: 5),
        backgroundColor:Colors.red,
      ),
    );
  }

  @override
  State<calendarPage> createState() => _calendarPageState();
}


class _calendarPageState extends State<calendarPage>{
  String searchQuery = "";
  bool recorridos=false;

  DateTime _focusedDay = DateTime.now(), _selectedDay=DateTime.now();
  CalendarFormat _calendarFormat=CalendarFormat.week;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showCreateTripSheet(bool trip) async {
    final (EventsCompanion, List<StopsCompanion>)? newBoth = await showModalBottomSheet(
      context:context,
      isScrollControlled:true,
      builder:(context) => CreateTripSheet(isTrip:trip,startDate:_selectedDay,mainColor:calendarPage.mainColor),
    );
    if(newBoth==null){return;}
    final (newEvent, newStops) = newBoth;
    if(newEvent==null||newStops==null){widget.errorSnackBar(context);return;}//unnecesary

    final db= Provider.of<AppDatabase>(context,listen: false);

    try{
      await db.transaction(() async {
        await db.into(db.events).insert(newEvent);

        await db.batch((batch){
          batch.insertAll(db.stops, newStops);
        });
      });
    }catch(e){
      widget.errorSnackBar(context);
      print("ERROR DB: $e");
      return;
    }

    setState((){});
    // Confirmation snackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:Text('Viaje "${newEvent.name.value}" creado.'),
        backgroundColor:Colors.green,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<AppDatabase>(context);

    return Scaffold(
      body:Stack(
        fit:StackFit.expand,
        children:[
          // main page
          SafeArea(child:Column(children:[
            mySearchBar(onChanged:(value){setState((){searchQuery = value;});},),
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 10),
              child:Row(children: [
                Expanded(child: Text(
                  "Recorridos",
                  style:TextStyle(fontSize:16, fontWeight:recorridos?FontWeight.bold:FontWeight.normal),
                )),
                Switch(
                  value: recorridos,
                  activeThumbColor: Colors.white,
                  activeTrackColor:calendarPage.mainColor,
                  onChanged:(bool value){
                    setState((){recorridos=value;});
                  }
                )
              ])
            ),

            TableCalendar(
              focusedDay: _focusedDay,
              firstDay: constants.firstDate,
              lastDay: constants.lastDay,
              locale: 'es_ES',
              daysOfWeekHeight: 20,
              availableCalendarFormats:{CalendarFormat.month:'Month',CalendarFormat.week:'Week'},
              
              //styling
              calendarFormat: _calendarFormat,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false, 
                titleCentered: true,
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: calendarPage.mainColor, 
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: calendarPage.mainColor.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),

              //functionality
              onFormatChanged:(format){
                setState((){_calendarFormat=format;});
              },
              selectedDayPredicate:(day){
                return isSameDay(_selectedDay,day);
              },

              onDaySelected: (selectedDay, focusedDay) {
                setState((){
                  _selectedDay=selectedDay;
                  _focusedDay=focusedDay;
                });
                // filtrar lista de viajes aca?
                // _cargarViajesDelDia(selectedDay);
              },

              onPageChanged:(focusedDay){_focusedDay=focusedDay;},
            ),

            const SizedBox(height: 8.0),

            Expanded(
              child:StreamBuilder<List<EventWithStops>>(
                stream: db.watchEventsWithStops(_selectedDay,recorridos),
                builder:(context, snapshot){
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

                  final fullList =snapshot.data??List<EventWithStops>.empty();

                  final filtered = searchQuery.isEmpty
                    ? fullList
                    : fullList.where((c){
                      return (c.event.name.toLowerCase().contains(searchQuery.toLowerCase()));
                    }).toList();
                  if(filtered.isEmpty)return const Center(child:Text("???"));

                  return ListView.builder(
                    itemCount: filtered.length,
                    itemBuilder:(context, index){
                      return EventCard(
                        eve:filtered[index].event,
                        sto:filtered[index].stops,
                        maincolor:calendarPage.mainColor,
                      );
                    },
                  );
                },
              )
            ),

          ],),),

          // Floatting buttons
          Positioned.fill(
            bottom:16.0,
            right:16.0,
            child:ExpandableFab(
              mainColor: calendarPage.mainColor,
              children: [
                buildMiniFab(
                  icon: Icons.school,
                  label: "Recorrido",
                  onPressed:(){
                    final db = Provider.of<AppDatabase>(context, listen: false);
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>DriftDbViewer(db)));
                  },//TODO
                ),
                buildMiniFab(
                  icon: Icons.directions_bus,
                  label: "Viaje",
                  onPressed: (){_showCreateTripSheet(true);},
                ),
                buildMiniFab(
                  icon: Icons.task_alt,
                  label: "Recordatorio",
                  onPressed:(){_showCreateTripSheet(false);},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

