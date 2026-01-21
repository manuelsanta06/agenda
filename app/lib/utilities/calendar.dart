import 'package:agenda/pages/calendar.dart';
import 'package:flutter/material.dart';
import 'package:agenda/database/app_database.dart';
import 'package:drift/drift.dart' as drift; 
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../widgets/timeinputs.dart';

class EventCard extends StatelessWidget{
  final Event eve;
  final List<Stop> sto;
  final Color maincolor;

  const EventCard({
    super.key,
    required this.eve,
    required this.sto,
    required this.maincolor,
  });

  Widget weekDaysDots(){
    return Container(
      //alignment: Alignment.centerLeft,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:WeekDays.values.map((day){
          if(day==WeekDays.NONE)return Container();
          return Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (eve.days?.contains(day)??false)?maincolor:Colors.grey,
            ),
            alignment: Alignment.center,
            child: Text(
              getDayLetter(day), // Función auxiliar para la letra
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                // Si está activo: Letra blanca. Si no: Letra gris.
                color:Colors.white,
              ),
            ),
          );
        }).toList(),
      )
    );
  }

  Widget stopsLine(){
    final stopsToShow = sto.length > 4? 
      [sto.first, sto.last] 
      :sto;
    bool fillDot=true;
    final now=DateTime.now();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child:Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 2,
            color: Colors.grey.shade300,
            margin: const EdgeInsets.symmetric(horizontal: 10), 
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:stopsToShow.map((stop) {
              DateTime? stopDay;
              if((!eve.repeat)||stop.start==null)stopDay=stop.start;
              else{
                stopDay=DateTime(
                  now.year, 
                  now.month, 
                  now.day, 
                  stop.start!.hour, 
                  stop.start!.minute
                );
              }
              if(stopDay?.isAfter(DateTime.now())??false)fillDot=false;
              return stopToDot(stop,fillDot);
            }).toList(),
          ),
          if(sto.length > 4)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            color: Colors.white,
            child: Text(
              "+${sto.length - 2}", 
              style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)
            ),
          ),
        ],
      )
    );
  }
  Widget stopToDot(Stop stop, bool fillDot) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //time above the dot
        Text(
          stop.start != null 
            ? "${stop.start!.hour.toString().padLeft(2,'0')}:${stop.start!.minute.toString().padLeft(2,'0')}" 
            : "",
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w600,
          ),
        ),
        
        const SizedBox(height: 4),

        //the dot
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: fillDot ? maincolor : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: maincolor, 
              width: 2.5
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.white12,
                spreadRadius: 3,
              ),
            ],
          ),
        ),

        const SizedBox(height: 4),

        //stop name
        SizedBox(
          width: 60, 
          child: Text(
            stop.name,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child:Material(
        color: eve.state!=EventStates.REMOVED?Colors.white12:Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        clipBehavior: Clip.hardEdge,
        child:InkWell(
          onTap: (){},
          child:Padding(padding:const EdgeInsets.all(14),child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:[
              Text(
                eve.name,
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(
                switch(eve.type){
                  EventTypes.NONE=> "Error",
                  EventTypes.EVENT=> "Evento",
                  EventTypes.SCHOOL=> "Recorrido",
                  EventTypes.REMINDER=> "Recordatorio",
                },
                style:TextStyle(
                  color: maincolor,
                  fontWeight: FontWeight.w900,
                  fontSize: 10.0,
                ),
              ),
                
              if(eve.repeat)
              weekDaysDots(),
              if(eve.type!=EventTypes.NONE||sto.isNotEmpty)
              stopsLine(),

            ]
          )),
        )
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

  late List<DateTime?> _stopDateTime;
  late List<TextEditingController> _stopControllers;
  @override
  void initState() {
    super.initState();
    _stopDateTime=[DateTime(widget.startDate.year,widget.startDate.month,widget.startDate.day,0,0)];
    _stopControllers=[TextEditingController()];
  }

  void _addStopField() {
    setState((){
      _stopControllers.add(TextEditingController());
      _stopDateTime.add(DateTime(widget.startDate.year,widget.startDate.month,widget.startDate.day,0,0));
    });
  }

  void _removeStopField(int index) {
    setState((){
      _stopControllers.removeAt(index);
      _stopDateTime.removeAt(index);
    });
  }

  void _getDateTime(int index)async{
     if(!repeat||index==0)_stopDateTime[index]=await getDatetime(context,_stopDateTime[index])??_stopDateTime[index];
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
        contact:drift.Value(_contactC.text),
        days: drift.Value(weekDays.toList()),
        startDateTime: drift.Value(_stopDateTime.first!),
        endDateTime: drift.Value(null),
        repeat: drift.Value(repeat),
        isTrip: drift.Value(widget.isTrip),
        state: drift.Value(EventStates.PENDING),
        type: drift.Value(EventTypes.NONE),
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
              const SizedBox(height: 8),

              Row(children: [
                Expanded(child:TextFormField(
                  controller:_contactNameC,
                  textCapitalization: TextCapitalization.words,
                  decoration:InputDecoration(
                    labelText:"Persona",
                    border:const OutlineInputBorder(),
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
                    prefixIcon:const Icon(Icons.phone),
                  ),
                )),
              ]),

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
                            backgroundColor:(((_stopDateTime[index]?.hour??0)==0)
                              &&((_stopDateTime[index]?.minute??0)==0))?
                              Colors.red:Colors.green,
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
                            if (index==0
                              &&(((_stopDateTime[0]?.hour??0)==0)
                              &&((_stopDateTime[0]?.minute??0)==0))
                              &&(value == null || value.isEmpty))
                              return 'Ingresa la parada';
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
