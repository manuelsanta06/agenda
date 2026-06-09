import 'package:agenda/utilities/events.dart';
import 'package:agenda/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:agenda/database/app_database.dart';

import 'package:agenda/utilities/colectivos.dart';

import 'package:agenda/widgets/errorWidgets.dart';
import 'package:agenda/widgets/text.dart';

import 'package:agenda/constants.dart';

class colectivoInfo extends StatefulWidget{
  final Colectivo initialCol;
  final Color mainColor;

  const colectivoInfo({super.key,required this.initialCol,required this.mainColor});

  @override
  State<colectivoInfo> createState()=>_colectivoInfoState();
}

class _colectivoInfoState extends State<colectivoInfo>{
  bool recos=false;

  bool _isEditingNotes=false;
  late TextEditingController _notesC;

  @override
  void initState(){
    super.initState();
    _notesC=TextEditingController();
  }

  @override
  void dispose(){
    _notesC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    final deafDb=Provider.of<AppDatabase>(context,listen:false);

    return Scaffold(body:SafeArea(child:StreamBuilder<ColectivoWithEvents>(
      stream:deafDb.watchColectivoWithEventsStops(
        colId:widget.initialCol.id,
        school:recos
      ),
      initialData:ColectivoWithEvents(col:widget.initialCol,eves:[]),
      builder:(context,snapshot){
        if(snapshot.hasError)
          return Center(child:Text("Error: ${snapshot.error}",style:const TextStyle(color:Colors.white)));
        if(!snapshot.hasData||snapshot.data==null)
          return const Center(child:CircularProgressIndicator());
          
        final col=snapshot.data!.col;
        final events=snapshot.data!.eves;

        final vtvExpired=col.vtv.isAfter(DateTime.now().add(const Duration(days:vtvAlert)));


        return ListView(padding:const EdgeInsets.symmetric(horizontal:5),children:[
          Center(child:pillText(col.plate,widget.mainColor,fontSize:25)),
          SizedBox(height:10),
          if(col.number!=null)
          Center(child:Text("Interno #${col.number}",
            style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:Colors.amber),
          )),
          if(col.name!=null)
          Center(child:Text(col.name??"",
            style:TextStyle(),
          )),
          SizedBox(height:20),

          subtitleLine("Ficha tecnica",widget.mainColor),
          Column(spacing:10,children:[
            Row(spacing:10,children:[
              Expanded(child:BasicCard(
                child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
                  Text(col.fuelAmount,style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:18,
                  )),
                  Text("Gasoil hace ${relativeDate(col.fuelDate)}",style:TextStyle(fontSize:12))
                ]),
                onPressed:()=>editColectivoFuel(context,col)
              )),
            ]),
            Row(spacing:10,children:[
              Expanded(child:BasicCard(
                tonality:vtvExpired?null:Colors.red,
                child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
                  Text("${col.vtv.day}/${col.vtv.month}/${col.vtv.year}",style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:18,
                    color:vtvExpired?Colors.red:Colors.amber
                  )),
                  Text("Vencimiento VTV",style:TextStyle(fontSize:12))
                ]),
                onPressed:()=>editColectivoVtv(context,col)
              )),
              Expanded(child:BasicCard(
                child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
                  Text(col.capacity.toString(),style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:18,
                  )),
                  Text("Capacidad maxima",style:TextStyle(fontSize:12))
                ]),
                onPressed:()async{
                  String? val=await quickChangeDialog(context,"Capacidad",def:col.capacity.toString());
                  if(val!=null&&int.tryParse(val)!=null&&context.mounted){
                    await updateColectivo(context,col.copyWith(
                      capacity:int.parse(val),
                    ));
                  }
                },
              )),
            ]),
            Row(spacing:10,children:[
              Expanded(child:BasicCard(
                child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
                  Text(relativeDate(col.oilDate,montlhy:true),style:TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize:18,
                    color:Colors.amber
                  )),
                  Text("Desde ultimo cambio de aceite",style:TextStyle(fontSize:12))
                ]),
                onPressed:()=>editColectivoOil(context,col)
              )),
            ]),
          ]),
          SizedBox(height:20),

          subtitleLine("Notas y observaciones",widget.mainColor),
          BasicCard(
            onPressed:_isEditingNotes?null:()=>setState((){
              _notesC.text=col.data;
              _isEditingNotes=true;
            }),
            child:_isEditingNotes?Column(
              crossAxisAlignment:CrossAxisAlignment.end,
              children:[
                TextField(
                  controller:_notesC,
                  maxLines:null,
                  autofocus:true,
                  textCapitalization:TextCapitalization.sentences,
                  decoration:const InputDecoration(
                    hintText:"Escribe tus observaciones aquí...",
                    border:InputBorder.none,
                  ),
                ),
                const SizedBox(height:10),
                Row(mainAxisAlignment:MainAxisAlignment.end,children:[
                  TextButton(
                    onPressed:()=>setState(()=>_isEditingNotes=false),
                    child:const Text("Cancelar",style:TextStyle(color:Colors.grey)),
                  ),
                  const SizedBox(width:8),
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor:widget.mainColor,
                      foregroundColor:Colors.black,
                    ),
                    onPressed:()async{
                      await updateColectivo(context,col.copyWith(
                        data:_notesC.text,
                        isSynced:false,
                      ));
                      setState(()=>_isEditingNotes=false);
                    },
                    child:const Text("Guardar"),
                  ),
                ])
              ],
            ):Container(
              width:double.infinity,
              padding:const EdgeInsets.symmetric(vertical:8),
              child:Text(
                col.data.isEmpty?"No hay observaciones.":col.data,
                style:TextStyle(
                  color:col.data.isEmpty?Colors.grey:Colors.white,
                  fontStyle:col.data.isEmpty?FontStyle.italic:FontStyle.normal,
                ),
              ),
            ),
          ),
          SizedBox(height:20),

          Row(children:[
            Expanded(child:subtitleLine("Viajes",widget.mainColor)),
            Text("Recorridos",
              style:TextStyle(
                fontSize:16,
                fontWeight:recos?FontWeight.bold:FontWeight.normal,
                color:Colors.white
              ),
            ),
            Switch(
              value:recos,
              activeThumbColor:Colors.white,
              activeTrackColor:widget.mainColor,
              onChanged:(bool value)=>setState(()=>recos=value),
            )
          ]),

          if(events.isEmpty)
          const Padding(
            padding:EdgeInsets.all(20),
            child:Center(child:Text("No hay viajes asignados",style:TextStyle(color:Colors.grey))),
          )
          else
          BasicCard(child:Column(children:events.map((sel){
            return EventCard(eve:sel.event,sto:sel.stops,maincolor:widget.mainColor);
          }).toList())),
        ]);
      }
    )));
  }
}
