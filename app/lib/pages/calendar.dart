import 'package:flutter/material.dart';
import '../utilities/calendar.dart';
import '../widgets/searchBar.dart';
import '../widgets/buttons.dart';
import 'package:agenda/database/app_database.dart';
import 'package:drift/drift.dart' as drift; 
import 'package:provider/provider.dart';
import '../constants.dart' as constants;
import 'package:table_calendar/table_calendar.dart';



enum EventTypes{
  NONE,
  EVENT,
  JOURNEY
}





class calendarPage extends StatefulWidget {
  const calendarPage({super.key});
  static const Color mainColor=Colors.cyan;

  @override
  State<calendarPage> createState() => _calendarPageState();
}


class _calendarPageState extends State<calendarPage>{
  String searchQuery = "";

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
    if(newBoth==null)return;
    final (newEvent, newStops) = newBoth;
    if(newEvent == null||newStops==null) return;//unnecesary

    final db= Provider.of<AppDatabase>(context);

    try{
    await db.transaction(() async {
      await db.into(db.events).insert(newEvent);

      await db.batch((batch){
        batch.insertAll(db.stops, newStops);
      });
    });
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:Text('Algo salio mal. Viaje borrado'),
          backgroundColor:Colors.red,
        ),
      );
      print(e);
      return;
    }

    setState((){});
    // Confirmation snackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:Text('Viaje "${newEvent.name}" creado.'),
        backgroundColor:Colors.green,
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        fit:StackFit.expand,
        children:[
          // main page
          SafeArea(child:Column(children:[
            mySearchBar(onChanged:(value){setState((){searchQuery = value;});},),
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

            //Expanded(
            //  child: ListView.builder(
            //    itemCount: _selectedEvents.length,
            //    itemBuilder: (context, index) {
            //      final event = _selectedEvents[index];
            //      return _buildEventCard(event);
            //    },
            //  ),
            //),

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
                  onPressed:(){},//TODO
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

