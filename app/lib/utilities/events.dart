import 'package:agenda/database/app_database.dart';
import 'package:agenda/widgets/cards.dart';
import 'package:drift/drift.dart' as drift; 
import '../utilities/parsers.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../pages/eventInfo.dart';
import '../widgets/timeinputs.dart';
import '../widgets/eventDetails.dart';

Future<EventStates> getEventCompletitionState(AppDatabase db,Event eve)async{
  final colectivosCount = await (db.select(db.eventColectivos)
    ..where((tbl) => tbl.eventId.equals(eve.id))
  ).get().then((list) => list.length);

  final choferesCount = await (db.select(db.eventChoferes)
    ..where((tbl) => tbl.eventId.equals(eve.id))
  ).get().then((list) => list.length);
  return colectivosCount==0||choferesCount==0||choferesCount!=colectivosCount?
    EventStates.INCOMPLETE:
    EventStates.NONE;
}
EventStates getEventDateState(AppDatabase db,Event eve){
  if(eve.endDateTime==null)return EventStates.NONE;
  final now=DateTime.now();
  if(now.isAfter(eve.endDateTime))return EventStates.DONE;
  if(now.isAfter(eve.startDateTime)&&now.isBefore(eve.endDateTime))return EventStates.HAPPENING;
  return EventStates.PENDING;
}

Future<void> updateFullEventState(AppDatabase db,Event eve)async{
  EventStates newState=await getEventCompletitionState(db,eve);
  if(newState==EventStates.NONE)newState=getEventDateState(db,eve);

  await (db.update(db.events)
    ..where((tbl) => tbl.id.equals(eve.id))
  ).write(EventsCompanion(
    state: drift.Value(newState),
    isSynced: const drift.Value(false),
  ));
}

class EventCard extends StatelessWidget{
  final Event eve;
  final List<Stop> sto;
  final Color maincolor;
  final VoidCallback? onLongPressed;

  const EventCard({
    super.key,
    required this.eve,
    required this.sto,
    required this.maincolor,
    this.onLongPressed,
  });


  void _onClick(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(builder:(context)=>eventInfo(maincolor,eve:eve,sto:sto)),
    );
  }
  void _onLongClick(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute(builder:(context)=>eventInfo(maincolor,eve:eve,sto:sto)),
    );
  }

  @override
  Widget build(BuildContext context){
    Color? colo;
    if(eve.state==EventStates.REMOVED)colo=Colors.red.withValues(alpha:0.3);
    else if(eve.state==EventStates.INCOMPLETE)colo=Color.fromARGB(175,255,92,0);
    else if(eve.state==EventStates.DONE)colo=Color.fromARGB(175,0,255,0);
    return Container(
      margin: const EdgeInsets.symmetric(vertical:8, horizontal:10),
      child:BasicCard(
        tonality: colo,
        padding:const EdgeInsets.all(0),
        onPressed: ()=>_onClick(context),
        onLongPressed:()=>onLongPressed,
        child:Padding(padding:const EdgeInsets.all(14),child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
            Text( eve.name,
              style:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text( eventTypeToString(eve.type),
              style:TextStyle(
                color: maincolor,
                fontWeight: FontWeight.w900,
                fontSize: 10.0,
              ),
            ),
              
            if(eve.repeat)
            weekDaysDots(eve.days,maincolor),
            if(eve.type!=EventTypes.NONE||sto.isNotEmpty)
            stopsLineHorizontal(sto,eve.repeat,maincolor),

          ]
        )),
      ),
    );
  }
}


//Return a cuple EventsCompanion/StopsCompanion
class CreateTripSheet extends StatefulWidget {
  final bool isTrip;
  final Event? eve;
  final Color mainColor;
  DateTime startDate;

  CreateTripSheet({super.key,required this.mainColor ,this.eve, required this.isTrip,required this.startDate});

  @override
  State<CreateTripSheet> createState() => _CreateTripSheetState();
}

class _CreateTripSheetState extends State<CreateTripSheet> {
  final _nameC = TextEditingController();
  final _contactNameC = TextEditingController();
  final _contactC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Set<WeekDays> weekDays=<WeekDays>{WeekDays.MONDAY};
  bool repeat=false;

  late List<DateTime> _stopDateTime;
  late List<TextEditingController> _stopControllers;
  @override
  void initState() {
    super.initState();
    _stopDateTime=[DateTime(widget.startDate.year,widget.startDate.month,widget.startDate.day,0,0)];
    _stopControllers=[TextEditingController()];
    _addStopField();
    _addStopField();
  }

  void _addStopField() {
    setState((){
      _stopControllers.add(TextEditingController());
      _stopDateTime.add(DateTime(_stopDateTime[0].year,_stopDateTime[0].month,_stopDateTime[0].day,0,0));
    });
  }

  void _removeStopField(int index) {
    setState((){
      _stopControllers.removeAt(index);
      _stopDateTime.removeAt(index);
    });
  }

  void _getDateTime(int index)async{
    if(!repeat||index==0)
      _stopDateTime[index]=await getDatetime(context,_stopDateTime[index])??_stopDateTime[index];
    else{
      final tmp=await getTime(context);
      if(tmp==null)return;
      _stopDateTime[index]=DateTime(
        _stopDateTime.first!.year,
        _stopDateTime.first!.month,
        _stopDateTime.first!.day,
        tmp.hour,   // Usas la hora de TimeOfDay
        tmp.minute, // Usas los minutos de TimeOfDay
      );
    }
    setState((){});
  }

  void _onSave() {
    if (_formKey.currentState?.validate() ?? false) {
      final newTrip =EventsCompanion(
        id: drift.Value(widget.eve?.id?? Uuid().v4()),
        name: drift.Value(_nameC.text),
        contactName:drift.Value(_contactNameC.text),
        contact:drift.Value(phoneParser(_contactC.text)),
        days: drift.Value(weekDays.toList()),
        startDateTime: drift.Value(_stopDateTime.first),
        endDateTime: drift.Value(_stopDateTime.last),
        repeat: drift.Value(repeat),
        isTrip: drift.Value(widget.isTrip),
        state: drift.Value(EventStates.INCOMPLETE),
        isSynced: drift.Value(false),
        type: drift.Value(widget.isTrip?EventTypes.EVENT:EventTypes.REMINDER),
      );

      final List<StopsCompanion> newStops = [];
      int currentOrder = 0;
      for (int i=0;i<_stopControllers.length;i++) {
        if (_stopControllers[i].text.isEmpty) continue;
        newStops.add(StopsCompanion(
          id: drift.Value(const Uuid().v4()),
          name: drift.Value(_stopControllers[i].text),
          start: drift.Value(_stopDateTime[i]), 
          eventId: newTrip.id,
          orderIndex: drift.Value(currentOrder),
        ));
        currentOrder++;
      }
      //Return a cuple EventsCompanion/StopsCompanion
      Navigator.of(context).pop((newTrip, newStops));
    }
  }
  
  @override
  void dispose() {
    _nameC.dispose();
    for (var controller in _stopControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(top:false,child:FractionallySizedBox(
      heightFactor:0.9,
      child:Container(
        padding:const EdgeInsets.all(16.0),
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
                    controller:_nameC,
                    decoration:const InputDecoration(
                      labelText:"Nombre",
                      fillColor:Colors.transparent,
                      //border:UnderlineInputBorder(),
                      //prefixIcon:Icon(Icons.label_outline),
                    ),
                    validator:(value) {
                      if (value == null || value.isEmpty)return 'Ingresa un nombre';
                      return null;
                    },
                  )),
                  ElevatedButton(
                    onPressed:_onSave,
                    style:ElevatedButton.styleFrom(
                      backgroundColor:widget.mainColor,
                      foregroundColor:Colors.white,
                    ),
                    child:const Text("Guardar"),
                  ),
                ],
              ),
              const Divider(height:5),

              Row(
                children: [
                  Expanded(child: Text(
                    "Repetir?",
                    style:TextStyle(fontSize:16, fontWeight:repeat?FontWeight.bold:FontWeight.normal),
                  )),
                  Switch(
                    value: repeat,
                    activeThumbColor: Colors.white,
                    activeTrackColor:widget.mainColor,
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
              const SizedBox(height: 5),

              Row(children:[
                Expanded(child:TextFormField(
                  controller:_contactNameC,
                  textCapitalization: TextCapitalization.words,
                  decoration:InputDecoration(
                    labelText:"Persona",
                    border:const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: widget.mainColor, width: 2),
                    ),
                    prefixIcon:const Icon(Icons.person),
                  ),
                )),
                const SizedBox(width: 8),
                Expanded(child:TextFormField(
                  controller:_contactC,
                  keyboardType: TextInputType.phone,
                  decoration:InputDecoration(
                    labelText:"Contacto",
                    border:const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: widget.mainColor, width: 2),
                    ),
                    prefixIcon:const Icon(Icons.phone),
                  ),
                )),
              ]),
              const SizedBox(height: 5),

              // STOPS
              Text( widget.isTrip?"Paradas":"lugar",
                style:TextStyle(fontSize:16, fontWeight:FontWeight.bold),
              ),
              Expanded(child:ListView.builder(
                itemCount:_stopControllers.length,
                itemBuilder:(context, index) {
                  bool dated=!(((_stopDateTime[index]?.hour??0)==0)&&((_stopDateTime[index]?.minute??0)==0));
                  return Padding(
                    padding:const EdgeInsets.symmetric(vertical:4.0),
                    child:Row(
                      children:[
                        //TIME PICKER
                        Container(
                          width: 65,
                          height: 50,
                          margin: EdgeInsets.only(right:5),
                          child: Material(
                            color:(dated?widget.mainColor:Colors.red).withAlpha(50),
                            shape:RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(12),
                              side:BorderSide(color:dated?widget.mainColor:Colors.red,width:1.5)
                            ),
                            child:InkWell(
                              child:dated?
                                Column(mainAxisAlignment:MainAxisAlignment.center,children:[
                                  //TIME
                                  Text("${_stopDateTime[index].hour.toString().padLeft(2,'0')}:${_stopDateTime[index].minute.toString().padLeft(2,'0')}",
                                    style: TextStyle(
                                      color: widget.mainColor, 
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15,
                                      height: 1.0,
                                    ),
                                  ),
                                  //DATE
                                  Text("${_stopDateTime[index].day.toString().padLeft(2, '0')}/${_stopDateTime[index].month.toString().padLeft(2, '0')}", 
                                    style:TextStyle(
                                      color:widget.mainColor, 
                                      fontWeight:FontWeight.bold,
                                      fontSize:10,
                                    ),
                                  ),
                                ],)
                                :const Icon(Icons.calendar_month),
                              onTap:()=>_getDateTime(index),
                            ),
                          )
                        ),

                        //STOP NAME INPUT
                        Expanded(child:TextFormField(
                          controller:_stopControllers[index],
                          decoration:InputDecoration(
                            labelText:widget.isTrip?'Parada ${index + 1}':"Lugar",
                            //border:const OutlineInputBorder(),
                            border: OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: widget.mainColor, width: 2),
                            ),
                            prefixIcon:const Icon(Icons.location_on_outlined),
                          ),
                          validator:(value) {
                            if(_stopControllers.length<2)return "Minimo 2 paradas";
                            if ((index==0
                              &&((_stopDateTime[0].hour==0)
                              &&(_stopDateTime[0].minute==0)))
                              ||(index==(_stopControllers.length-1)
                              &&((_stopDateTime.last.hour==0)
                              &&(_stopDateTime.last.minute==0)))
                              ||(value == null || value.isEmpty))
                              return 'Completa la parada';
                            if(index==(_stopControllers.length-1)
                              &&(_stopDateTime.first.isAfter(_stopDateTime.last)))
                              return "Horarios invalidos";
                            return null;
                          },
                        )),
                        // DELETE BUTTON
                        if (_stopControllers.length>1&&index!=0)
                        IconButton(
                          icon:const Icon(Icons.remove_circle_outline, color:Colors.red),
                          onPressed:() => _removeStopField(index),
                        ),
                      ],
                    ),
                  );
                },
              )),
              //if(widget.isTrip||_stopControllers.length<3)
              TextButton.icon(
                onPressed:_addStopField,
                icon: Icon(Icons.add, color:widget.mainColor),
                label: Text("Añadir parada", style:TextStyle(color:widget.mainColor)),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
