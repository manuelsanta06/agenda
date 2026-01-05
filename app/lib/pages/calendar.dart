import 'package:flutter/material.dart';
import '../widgets/searchBar.dart';
import '../widgets/buttons.dart';
import 'colectivos.dart';
import 'people.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uuid/uuid.dart';

enum WeekDays{
  NONE,
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY,
  SUNDAY,
}

enum EventTypes{
  NONE,
  EVENT,
  JOURNEY
}

class Stop{
  String name;
  DateTime? end;

  Stop({required this.name,this.end});
}

class Event{
  String name="";
  
  DateTime? start;
  DateTime? end;

  bool repeat=false;

  List<Stop> stops=[];
  List<WeekDays> days=[];
  List<Chofer> people=[];
  //List<Colectivo> buses=[];

  EventTypes  type=EventTypes.NONE;


  Event(){}

  @override
  String toString() => name;
}

final List<Event> events = [];



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
    final newTrip = await showModalBottomSheet<Event>(
      context:context,
      isScrollControlled:true,
      builder:(context) {
        return CreateTripSheet(isTrip:trip);
      },
    );

    if (newTrip != null) {
      setState((){events.add(newTrip);});
      // Confirmation snackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:Text('Viaje "${newTrip.name}" creado.'),
          backgroundColor:Colors.green,
        ),
      );
    }
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
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
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

            // 2. La lista de eventos (usando Expanded para llenar el resto de pantalla)
            //Expanded(
            //  child: ListView.builder(
            //    itemCount: _selectedEvents.length,
            //    itemBuilder: (context, index) {
            //      final event = _selectedEvents[index];
            //      return _buildEventCard(event); // Aquí diseñas la tarjeta del HTML
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




class CreateTripSheet extends StatefulWidget {
  final bool isTrip;
  const CreateTripSheet({super.key,required this.isTrip});

  @override
  State<CreateTripSheet> createState() => _CreateTripSheetState();
}

class _CreateTripSheetState extends State<CreateTripSheet> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Set<WeekDays> weekDays=<WeekDays>{WeekDays.MONDAY};
  bool repeat=false;

  final List<TextEditingController> _stopControllers = [
    TextEditingController(), // Parada inicial
  ];

  void _addStopField() {
    setState(() {
      _stopControllers.add(TextEditingController());
    });
  }

  void _removeStopField(int index) {
    setState(() {
      _stopControllers.removeAt(index);
    });
  }

  // TODO: hacer que el trip sea global
  void _onSave() {
    if (_formKey.currentState?.validate() ?? false) {
      final newTrip = Event()
          ..name = _nameController.text
          ..start = DateTime.now() // (Deberías añadir un DatePicker)
          ..stops = _stopControllers
          .map((controller) => Stop(name:controller.text))
          .where((stop) => stop.name.isNotEmpty) // Filtra paradas vacías
          .toList();

      // Devolvemos el nuevo viaje a la pantalla anterior
      Navigator.pop(context, newTrip);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    for (var controller in _stopControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Usamos la altura del 80% del dispositivo
    return FractionallySizedBox(
      heightFactor:0.8,
      child:Container(
        padding:const EdgeInsets.all(16.0),
        // Bordes redondeados
        decoration:const BoxDecoration(
          borderRadius:BorderRadius.vertical(top:Radius.circular(20)),
        ),
        child:Form(
          key:_formKey,
          child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
              // UPPER BAR
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                children:[
                  Expanded(child:TextFormField(
                    controller:_nameController,
                    decoration:const InputDecoration(
                      labelText:"Nombre",
                      fillColor:Colors.transparent,
                      //border:UnderlineInputBorder(),
                      //prefixIcon:Icon(Icons.label_outline),
                    ),
                    validator:(value) {
                      if (value == null || value.isEmpty)return 'Por favor, ingresa un nombre';
                      return null;
                    },
                  )),
                  ElevatedButton(
                    onPressed:_onSave,
                    style:ElevatedButton.styleFrom(
                      backgroundColor:calendarPage.mainColor,
                      foregroundColor:Colors.white,
                    ),
                    child:const Text("Guardar"),
                  ),
                ],
              ),
              const Divider(height:5),

              // TODO: chofer-colectivo
              Row(),

              // TODO: fecha y hora (pensar como)
              Row(
                children: [
                  Expanded(child: Text(
                    "Repetir?",
                    style:TextStyle(fontSize:16, fontWeight:repeat?FontWeight.bold:FontWeight.normal),
                  )),
                  Switch(
                    value: repeat,
                    activeThumbColor: Colors.white,
                    activeTrackColor:calendarPage.mainColor,
                    onChanged:(bool value){
                      setState(() {
                        repeat=value;
                      });
                    }
                  )
                ],
              ),
              if(repeat)
              SegmentedButton<WeekDays>(
                segments: const <ButtonSegment<WeekDays>>[
                  ButtonSegment<WeekDays>(value: WeekDays.MONDAY,label: Text("LU")),
                  ButtonSegment<WeekDays>(value: WeekDays.TUESDAY,label: Text("MA")),
                  ButtonSegment<WeekDays>(value: WeekDays.WEDNESDAY,label: Text("MI")),
                  ButtonSegment<WeekDays>(value: WeekDays.THURSDAY,label: Text("JU")),
                  ButtonSegment<WeekDays>(value: WeekDays.FRIDAY,label: Text("VI")),
                  ButtonSegment<WeekDays>(value: WeekDays.SATURDAY,label: Text("SA")),
                  ButtonSegment<WeekDays>(value: WeekDays.SUNDAY,label: Text("DO")),
                ],
                selected: weekDays,
                onSelectionChanged: (Set<WeekDays> newSelection) {
                  setState(() {
                    weekDays = newSelection;
                  });
                },
                multiSelectionEnabled: true,
                showSelectedIcon: false,
              ),

              // STOPS
              Text(
                widget.isTrip?"Paradas":"lugar",
                style:TextStyle(fontSize:16, fontWeight:FontWeight.bold),
              ),
              Expanded(child:ListView.builder(
                itemCount:_stopControllers.length,
                itemBuilder:(context, index) {
                  return Padding(
                    padding:const EdgeInsets.symmetric(vertical:4.0),
                    child:Row(
                      children:[
                        Expanded(child:TextFormField(
                          controller:_stopControllers[index],
                          decoration:InputDecoration(
                            labelText:widget.isTrip?'Parada ${index + 1}':"Parada",
                            border:const OutlineInputBorder(),
                            prefixIcon:const Icon(Icons.location_on_outlined),
                          ),
                        )),
                        // DELETE BUTTON
                        if (_stopControllers.length > 1)
                        IconButton(
                          icon:const Icon(Icons.remove_circle_outline, color:Colors.red),
                          onPressed:() => _removeStopField(index),
                        ),
                      ],
                    ),
                  );
                },
              )),
              if(widget.isTrip)
              TextButton.icon(
                onPressed:_addStopField,
                icon:const Icon(Icons.add, color:calendarPage.mainColor),
                label:const Text("Añadir parada", style:TextStyle(color:calendarPage.mainColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
