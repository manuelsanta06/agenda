import 'package:agenda/widgets/eventDetails.dart';
import 'package:agenda/widgets/timeinputs.dart';

import '../widgets/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:agenda/database/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:uuid/uuid.dart';
import '../widgets/cards.dart';
import 'package:provider/provider.dart';
import '../utilities/parsers.dart';


Widget shiftToCard(
  BuildContext context,
  Color mainColor,
  RecorridoShift shift,{
  VoidCallback? onPressed,
  VoidCallback? onLongPressed
  }){
  return BasicCard(
    margin:const EdgeInsets.symmetric(vertical:10,horizontal:8),
    onPressed:onPressed,
    onLongPressed:onLongPressed,
    child:Column(crossAxisAlignment: CrossAxisAlignment.start,children:[
      Row(children:[
        Expanded(child:Text(shift.shiftName)),
        Container(
          padding:const EdgeInsets.symmetric(horizontal:10,vertical:4),
          decoration:BoxDecoration(
            color:mainColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: mainColor.withOpacity(0.5)),
          ),
          child:Text(
            "${(TimeOfDay.fromDateTime(shift.startTime)).format(context)} - ${(TimeOfDay.fromDateTime(shift.endTime)).format(context)}",
            style: TextStyle(
              color: mainColor,
              fontSize: 14, 
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ]),
      weekDaysDots(shift.weekDay,mainColor)
    ]),
  );
}

Future<bool?> showCreateModifiShiftSheet(
  BuildContext context,
  Color mainColor,
  String recoId,{
  RecorridoShift? shiftEdit,
})async{
  return showModalBottomSheet<bool>(
    context:context,
    isScrollControlled:true,
    useSafeArea: true,
    builder:(context)=>_ShiftForm(
      mainColor:mainColor,
      recoId:recoId,
      shiftEdit:shiftEdit,
    ),
  );
}

class _ShiftForm extends StatefulWidget{
  final Color mainColor;
  final String recoId;
  final RecorridoShift? shiftEdit;
  const _ShiftForm({
    required this.mainColor,
    required this.recoId,
    this.shiftEdit,
  });

  @override
  State<_ShiftForm> createState() => _CreateShiftFormState();
}
class _CreateShiftFormState extends State<_ShiftForm>{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameC=TextEditingController();
  late Set<WeekDays> weekDays=<WeekDays>{};
  DateTime? begin;
  DateTime? end;

  @override
  void initState(){
    super.initState();
    if(widget.shiftEdit!=null){
      nameC.text=widget.shiftEdit!.shiftName;
      weekDays=widget.shiftEdit!.weekDay.toSet();
      begin=widget.shiftEdit!.startTime;
      end=widget.shiftEdit!.endTime;
      return;
    }
    weekDays=<WeekDays>{WeekDays.MONDAY,WeekDays.TUESDAY,WeekDays.WEDNESDAY,WeekDays.THURSDAY,WeekDays.FRIDAY};
  }

  Future<void> _onSave()async{
    if(!(_formKey.currentState?.validate()??false))return;
    if(weekDays.isEmpty||begin==null||end==null||end!.isBefore(begin!))return;
    final db = Provider.of<AppDatabase>(context, listen: false);
    final companion=RecorridoShiftsCompanion(
      id:drift.Value(widget.shiftEdit==null?const Uuid().v4():widget.shiftEdit!.id),
      recorridoId:drift.Value(widget.recoId),
      shiftName:drift.Value(nameC.text),
      startTime:drift.Value(begin!),
      endTime:drift.Value(end!),
      weekDay:drift.Value(weekDays.toList()),
      isActive:drift.Value(true),
    );
    await db.transaction(()async{
      if(widget.shiftEdit!=null){
        await(db.update(db.recorridoShifts)
          ..where((s)=>db.recorridoShifts.id.equals(widget.shiftEdit!.id))).write(companion);
      }else{
        await(db.into(db.recorridoShifts).insert(companion));
      }
      await(db.update(db.recorridos)..where((s)=>s.id.equals(widget.recoId))).write(
        RecorridosCompanion(isSynced:drift.Value(false))
      );
    });
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context){
    final bottomInset=MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(child:Container(
      padding:EdgeInsets.fromLTRB(20,20,20,bottomInset+20),
      child:Form(key:_formKey,child:Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:[
          //TITULO
          Row(children:[
            Expanded(child:Text("Turno",
              style:TextStyle(fontSize:20,fontWeight:FontWeight.bold),
        )),
            ElevatedButton(
              onPressed:()async{await _onSave();},
              style:ElevatedButton.styleFrom(
                backgroundColor:widget.mainColor,
                foregroundColor:Colors.white,
              ),
              child:const Text("Guardar"),
            ),
          ]),
          const SizedBox(height: 20),
          TextFormField(
            controller: nameC,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText:"Nombre del turno",
              hintText: "Ej. Tarde",
              prefixIcon: Icon(Icons.timer,color:widget.mainColor),
              border: OutlineInputBorder(borderRadius:BorderRadius.circular(12)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color:widget.mainColor,width: 2),
              ),
            ),
            validator:(value){
              if (value==null||value.trim().isEmpty)return'El nombre es obligatorio';
              return null;
            },
          ),
          const SizedBox(height:10),
          Row(children:[
            Expanded(child:Text('Salida',textAlign:TextAlign.center)),
            Expanded(child:Text('Llegada',textAlign:TextAlign.center)),
          ]),
          Row(children:[
            Expanded(child:_clockButton(begin,(newTime){setState((){begin=newTime;});})),
            Expanded(child:_clockButton(end,(newTime){setState((){end=newTime;});})),
          ]),
          const SizedBox(height:10),
          Text('Dias',textAlign:TextAlign.center),
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
              setState((){weekDays=newSelection;});
            },
            multiSelectionEnabled: true,
            showSelectedIcon: false,
            style:ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected))return widget.mainColor.withAlpha(100);
                  return null;
                },
              ),
              foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected))return Colors.white;
                  return widget.mainColor;
                },
              ),
              side: MaterialStateProperty.resolveWith<BorderSide?>(
                (Set<MaterialState> states) {
                  return BorderSide(color:widget.mainColor);
                }
              )
            ),
          ),
        ]
      )),
    ));
  }
  Widget _clockButton(DateTime? time,Function(DateTime) onSucces){
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal:5),
      child: Material(
        color:(time!=null?widget.mainColor:Colors.red).withAlpha(50),
        shape:RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(12),
          side:BorderSide(color:time!=null?widget.mainColor:Colors.red,width:1.5)
        ),
        child:InkWell(
          child:time!=null?
            //TIME
            Center(child:Text("${time.hour.toString().padLeft(2,'0')}:${time.minute.toString().padLeft(2,'0')}",
              style: TextStyle(
                color: widget.mainColor, 
                fontWeight: FontWeight.w900,
                fontSize: 15,
                height: 1.0,
              ),
            ))
              //DATE
            :const Icon(Icons.calendar_month),
          onTap:()async{
            final tmp=await getTime(context);
            if(tmp==null)return;
            onSucces(DateTime(0,0,0,tmp.hour,tmp.minute));
          },
        ),
      )
    );
  }
}
