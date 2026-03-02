import 'package:agenda/database/app_database.dart';
import 'package:agenda/widgets/cards.dart';
import 'package:drift/drift.dart' as drift;
import 'package:provider/provider.dart';
import '../utilities/parsers.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final stopwatch = Stopwatch()..start();
  EventStates newState=await getEventCompletitionState(db,eve);
  if(newState==EventStates.NONE)newState=getEventDateState(db,eve);
  print('myFunction executed in ${stopwatch.elapsedMilliseconds}ms');
  if(newState==EventStates.NONE||newState==eve.state)return;

  await (db.update(db.events)
    ..where((tbl) => tbl.id.equals(eve.id))
  ).write(EventsCompanion(
    state: drift.Value(newState),
    isSynced: const drift.Value(false),
  ));
  stopwatch.stop();
  print('myFunction executed in ${stopwatch.elapsedMilliseconds}ms');
}

class EventCard extends StatelessWidget{
  final Event eve;
  final List<Stop> sto;
  final Color maincolor;
  final VoidCallback? onLongPressed;
  final bool hideOptions;

  const EventCard({
    super.key,
    required this.eve,
    required this.sto,
    required this.maincolor,
    this.hideOptions=false,
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
        actionIcon:hideOptions?null:PopupMenuButton(
          icon:const Icon(Icons.more_vert),
          onSelected:(String result)async{
            switch (result){
              case 'edit':
                await showCreateTripSheet(context,
                  isTrip:eve.isTrip,
                  mainColor:maincolor,
                  event:eve,stops:sto,
                  startDate:eve.startDateTime,
                );
                break;
              case 'delete':
                await showDialog<void>(
                  context: context,
                  builder:(BuildContext context){
                    return AlertDialog(
                      title:Text("Eliminar evento?"),
                      content: Text("¿Seguro que queres eliminar '${eve.name}'?"),
                      actions: [
                        TextButton(
                          child: const Text("Cancelar"),
                          onPressed:()=> Navigator.pop(context),
                        ),
                        TextButton(
                          child:Text("Eliminar", style: TextStyle(color: Colors.red)),
                          onPressed:()async{
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:Text("'${eve.name}' Eliminado"),
                              backgroundColor:Colors.red,
                            ));
                            final db=Provider.of<AppDatabase>(context, listen: false);
                            await (db.update(db.events)
                              ..where((tbl)=>tbl.id.equals(eve.id)))
                              .write(EventsCompanion(
                                  isSynced:drift.Value(false),
                                  state:drift.Value(EventStates.REMOVED),
                              ));
                          },
                        ),
                      ],
                    );
                  },
                );
                break;
              case 'chat':
                await launchUrl(Uri.parse("https://wa.me/${eve.contact}"),mode:LaunchMode.externalApplication);
                break;
              default:
                return;
            }
          },
          itemBuilder:(BuildContext Context)=><PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value:'edit',
              child:Row(children:[
                Icon(Icons.edit),
                SizedBox(width:8),
                Text('Editar')
              ]),
            ),
            PopupMenuItem<String>(
              value:'chat',
              child:Row(children:[
                Icon(Icons.phone),
                SizedBox(width:8),
                Text('Chat')
              ]),
            ),
            PopupMenuItem<String>(
              value:'delete',
              child:Row(children:[
                Icon(Icons.delete, color: Colors.red), 
                SizedBox(width: 8), 
                Text('Borrar',style:TextStyle(color:Colors.red)),
              ]),
            ),
          ]
        ),
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

// Recuerda asegurarte de tener importado 'package:provider/provider.dart';

Future<bool> showCreateTripSheet(BuildContext context,{
  Event? event,
  List<Stop>? stops,
  required Color mainColor,
  required bool isTrip,
  required DateTime startDate,
})async{
  assert(
    (event==null&&stops==null)||(event!=null&&stops!=null),
    "Both parameters [event] and [stops] should be used or none"
  );
  final result=await showModalBottomSheet<(EventsCompanion,List<StopsCompanion>,List<String>)>(
    context:context,
    isScrollControlled:true,
    builder:(context)=>_CreateTripSheet(
      mainColor: mainColor,
      eve: event,
      sto: stops,
      isTrip: isTrip,
      startDate: startDate,
    ),
  );

  if(result==null)return false;

  final (eventCompanion,stopsCompanions,toDeleteIds)=result;
  final db=Provider.of<AppDatabase>(context,listen:false);

  await db.transaction(() async {
    //GUARDAR O ACTUALIZAR EL EVENTO
    final existingEvent=await(db.select(db.events)
      ..where((t)=>t.id.equals(eventCompanion.id.value))
    ).getSingleOrNull();
    
    if(existingEvent!=null){
      await(db.update(db.events)
        ..where((t)=>t.id.equals(eventCompanion.id.value))
      ).write(eventCompanion);
    }else{
      await db.into(db.events).insert(eventCompanion);
    }
    //BORRAR LAS PARADAS ELIMINADAS
    if(toDeleteIds.isNotEmpty){
      await(db.delete(db.stops)
        ..where((t)=>t.id.isIn(toDeleteIds))
      ).go();
    }
    //GUARDAR O ACTUALIZAR LAS PARADAS
    for (final stopCompanion in stopsCompanions) {
       final existingStop=await(db.select(db.stops)
         ..where((t)=>t.id.equals(stopCompanion.id.value))
       ).getSingleOrNull();
       if (existingStop != null) {
         await(db.update(db.stops)
           ..where((t)=>t.id.equals(stopCompanion.id.value))
         ).write(stopCompanion);
       }else{
         await db.into(db.stops).insert(stopCompanion);
       }
    }
  });
  return true; 
}

class TempStop{
  String? originalId;
  TextEditingController nameC=TextEditingController();
  DateTime stopDate;
  TempStop({this.originalId, required this.stopDate});
}

//Return a cuple EventsCompanion/StopsCompanion
class _CreateTripSheet extends StatefulWidget {
  final bool isTrip;
  final Event? eve;
  final List<Stop>? sto;
  final Color mainColor;
  DateTime startDate;

  _CreateTripSheet({
    super.key,
    required this.mainColor ,
    this.eve,
    this.sto,
    required this.isTrip,
    required this.startDate
  });

  @override
  State<_CreateTripSheet> createState() => _CreateTripSheetState();
}

class _CreateTripSheetState extends State<_CreateTripSheet> {
  final _nameC = TextEditingController();
  final _contactNameC = TextEditingController();
  final _contactC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Set<WeekDays> weekDays=<WeekDays>{WeekDays.MONDAY};
  bool repeat=false;

  late List<TempStop> _tempStops=[];
  final List<String> _toDeleteIds = [];
  @override
  void initState() {
    super.initState();


    if(widget.eve==null){
      //_stopDateTime=[DateTime(widget.startDate.year,widget.startDate.month,widget.startDate.day,0,0)];
      //_stopControllers=[TextEditingController()];
      _addStopField();
      _addStopField();
      return;
    }
    repeat=widget.eve?.repeat??false;
    if(repeat)weekDays=widget.eve!.days!.toSet();
    _nameC.text=widget.eve?.name??"";
    _contactNameC.text=widget.eve?.contactName??"";
    _contactC.text=widget.eve?.contact??"";

    //_stopControllers=[];
    //_stopDateTime=[];
    for(int i=0; i<widget.sto!.length; i++){
      final temp = TempStop(
        originalId: widget.sto![i].id,
        stopDate:widget.sto![i].start??
          DateTime(widget.startDate.year,widget.startDate.month,widget.startDate.day,0,0)
      );
      temp.nameC.text = widget.sto![i].name;
      _tempStops.add(temp);
    }
  }

  void _addStopField() {
    setState((){
      DateTime newDate;
      if(_tempStops.isNotEmpty){
        newDate=DateTime(_tempStops.last.stopDate.year,_tempStops.last.stopDate.month,_tempStops.last.stopDate.day,0,0);
      }else{
        newDate=DateTime(widget.startDate.year,widget.startDate.month,widget.startDate.day,0,0);
      }
      _tempStops.add(TempStop(stopDate: newDate));
    });
  }

  void _removeStopField(int index) {
    setState((){
      final removed = _tempStops.removeAt(index);
      if (removed.originalId!=null){
        _toDeleteIds.add(removed.originalId!);
      }
    });
  }

  void _getDateTime(BuildContext context,int index)async{
    if(!repeat||index==0){
      DateTime? selected=await getDatetime(context,_tempStops[index].stopDate);
      if(selected!=null){
        _tempStops[index].stopDate=selected;
      }
    }else{
      final tmp=await getTime(context);
      if(tmp==null)return;
      _tempStops[index].stopDate = DateTime(
        _tempStops.first.stopDate.year,
        _tempStops.first.stopDate.month,
        _tempStops.first.stopDate.day,
        tmp.hour,   
        tmp.minute, 
      );
    }
    setState((){});
  }

  void _onSave(BuildContext context){
    if (_formKey.currentState?.validate()??false) {
      final newTrip =EventsCompanion(
        id: drift.Value(widget.eve?.id??Uuid().v4()),
        name: drift.Value(_nameC.text),
        contactName:drift.Value(_contactNameC.text),
        contact:drift.Value(phoneParser(_contactC.text)),
        days: drift.Value(repeat?weekDays.toList():[]),
        startDateTime: drift.Value(_tempStops.first.stopDate),
        endDateTime: drift.Value(_tempStops.last.stopDate),
        repeat: drift.Value(repeat),
        isTrip: drift.Value(widget.isTrip),
        state: drift.Value(EventStates.INCOMPLETE),
        isSynced: drift.Value(false),
        type: drift.Value(widget.isTrip?EventTypes.EVENT:EventTypes.REMINDER),
      );

      final List<StopsCompanion> newStops = [];
      int currentOrder = 0;
      for(final temp in _tempStops){
        if(temp.nameC.text.isEmpty)continue;
        
        newStops.add(StopsCompanion(
          id: drift.Value(temp.originalId??const Uuid().v4()),
          name: drift.Value(temp.nameC.text),
          start: drift.Value(temp.stopDate), 
          eventId: newTrip.id,
          orderIndex: drift.Value(currentOrder++),
        ));
      }
      
      Navigator.of(context).pop((newTrip, newStops, _toDeleteIds));
    }
  }
  
  @override
  void dispose() {
    _nameC.dispose();
    _contactNameC.dispose();
    _contactC.dispose();
    for(var temp in _tempStops)temp.nameC.dispose();
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
                    onPressed:()=>_onSave(context),
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
                itemCount:_tempStops.length,
                itemBuilder:(context, index) {
                  bool dated=!(((_tempStops[index].stopDate?.hour??0)==0)&&((_tempStops[index].stopDate?.minute??0)==0));
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
                                  Text("${_tempStops[index].stopDate.hour.toString().padLeft(2,'0')}:${_tempStops[index].stopDate.minute.toString().padLeft(2,'0')}",
                                    style: TextStyle(
                                      color: widget.mainColor, 
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15,
                                      height: 1.0,
                                    ),
                                  ),
                                  //DATE
                                  Text("${_tempStops[index].stopDate.day.toString().padLeft(2, '0')}/${_tempStops[index].stopDate.month.toString().padLeft(2, '0')}", 
                                    style:TextStyle(
                                      color:widget.mainColor, 
                                      fontWeight:FontWeight.bold,
                                      fontSize:10,
                                    ),
                                  ),
                                ],)
                                :const Icon(Icons.calendar_month),
                              onTap:()=>_getDateTime(context,index),
                            ),
                          )
                        ),

                        //STOP NAME INPUT
                        Expanded(child:TextFormField(
                          controller:_tempStops[index].nameC,
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
                            if(_tempStops.length<2)return "Minimo 2 paradas";
                            if ((index==0
                              &&((_tempStops[0].stopDate.hour==0)
                              &&(_tempStops[0].stopDate.minute==0)))
                              ||(index==(_tempStops.length-1)
                              &&((_tempStops.last.stopDate.hour==0)
                              &&(_tempStops.last.stopDate.minute==0)))
                              ||(value == null || value.isEmpty))
                              return 'Completa la parada';
                            if(index==(_tempStops.length-1)
                              &&(_tempStops.first.stopDate.isAfter(_tempStops.last.stopDate)))
                              return "Horarios invalidos";
                            return null;
                          },
                        )),
                        // DELETE BUTTON
                        if (_tempStops.length>1&&index!=0)
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
