import 'package:agenda/pages/calendar.dart';
import 'package:flutter/material.dart';
import 'package:agenda/database/app_database.dart';
import 'package:drift/drift.dart' as drift; 
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../constants.dart' as constants;

Future<DateTime?> getDate(BuildContext context,DateTime? initialDate)async{
  return await showDatePicker(
    context: context,
    initialDate: initialDate??DateTime.now(),
    initialDatePickerMode: DatePickerMode.day,
    initialEntryMode: DatePickerEntryMode.calendar,
    firstDate: constants.firstDate,
    lastDate: constants.lastDay,
  );
}
Future<TimeOfDay?> getTime(BuildContext context)async{
  return await showTimePicker(
  context: context,
    initialTime: TimeOfDay(hour: 0,minute: 0),
    initialEntryMode: TimePickerEntryMode.dial,
    orientation: Orientation.portrait,
    builder: (BuildContext context, Widget? child) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: child!,
      );
    },
  );
}
Future<DateTime?> getDatetime(BuildContext context,DateTime? initialDate)async{
  final DateTime? date=await getDate(context,initialDate);
  if(date==null)return null;
  final TimeOfDay? time=await getTime(context);
  if(time==null)return null;
  return DateTime(date.year,date.month,date.day,time.hour,time.minute);
}



//Return a cuple EventsCompanion/StopsCompanion
class CreateTripSheet extends StatefulWidget {
  final bool isTrip;
  final Event? eve;
  final Color mainColor;
  DateTime? startDate;

  CreateTripSheet({super.key,required this.mainColor ,this.eve, required this.isTrip,this.startDate});

  @override
  State<CreateTripSheet> createState() => _CreateTripSheetState();
}

class _CreateTripSheetState extends State<CreateTripSheet> {
  final _nameC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Set<WeekDays> weekDays=<WeekDays>{WeekDays.MONDAY};
  bool repeat=false;

  late List<DateTime?> _stopDateTime;
  late List<TextEditingController> _stopControllers;
  @override
  void initState() {
    super.initState();
    _stopDateTime=[widget.startDate];
    _stopControllers=[TextEditingController()];
  }

  void _addStopField() {
    setState((){
      _stopControllers.add(TextEditingController());
      _stopDateTime.add(null);
    });
  }

  void _removeStopField(int index) {
    setState((){
      _stopControllers.removeAt(index);
      _stopDateTime.removeAt(index);
    });
  }

  void _getDateTime(int index)async{
     _stopDateTime[index]=await getDatetime(context,_stopDateTime[index])??_stopDateTime[index];
     setState((){});
  }

  void _onSave() {
    if (_formKey.currentState?.validate() ?? false) {
      final newTrip =EventsCompanion(
        id: drift.Value(widget.eve?.id?? Uuid().v4()),
        name: drift.Value(_nameC.text),
        repeat: drift.Value(repeat),
        isTrip: drift.Value(widget.isTrip),
        state: drift.Value(EventStates.DONE),
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
    //altura del 80% del dispositivo
    return FractionallySizedBox(
      heightFactor:0.8,
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

              // TODO: chofer-colectivo
              Row(),

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
                        //TIME PICKER
                        Container(
                          margin: EdgeInsets.only(right:5),
                          child:CircleAvatar(
                            backgroundColor: _stopDateTime[index]==null?Colors.red:Colors.green,
                            child:IconButton(
                              icon: const Icon(Icons.calendar_month),
                              onPressed:()=>_getDateTime(index),
                            ),
                          ),
                        ),
                        Expanded(child:TextFormField(
                          controller:_stopControllers[index],
                          decoration:InputDecoration(
                            labelText:widget.isTrip?'Parada ${index + 1}':"Lugar",
                            border:const OutlineInputBorder(),
                            prefixIcon:const Icon(Icons.location_on_outlined),
                          ),
                          validator:(value) {
                            if (index==0&&_stopDateTime[0]==null&&(value == null || value.isEmpty))
                              return 'Ingresa la parada';
                            return null;
                          },
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
                icon: Icon(Icons.add, color:widget.mainColor),
                label: Text("Añadir parada", style:TextStyle(color:widget.mainColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
