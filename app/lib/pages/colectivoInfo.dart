import 'package:agenda/utilities/events.dart';
import 'package:agenda/widgets/cards.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:agenda/database/app_database.dart';

import 'package:agenda/utilities/colectivos.dart';
import 'package:agenda/widgets/text.dart';
import 'package:agenda/utilities/settings.dart';

import 'package:agenda/widgets/errorWidgets.dart';
import 'package:agenda/widgets/searchBar.dart';

class colectivoInfo extends StatefulWidget{
  final Colectivo initialCol;
  final Color mainColor;

  const colectivoInfo({super.key,required this.initialCol,required this.mainColor});

  @override
  State<colectivoInfo> createState()=>_colectivoInfoState();
}

class _colectivoInfoState extends State<colectivoInfo>{
  bool recos=false;

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
