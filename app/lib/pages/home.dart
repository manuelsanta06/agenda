import 'package:flutter/material.dart';
import 'package:agenda/widgets/buttons.dart';
import 'package:agenda/widgets/searchBar.dart';
import 'package:agenda/widgets/cards.dart';
import 'package:agenda/widgets/text.dart';

import 'package:agenda/utilities/events.dart';
import 'package:agenda/utilities/colectivos.dart';
import 'package:agenda/utilities/people.dart';
import 'package:agenda/utilities/recorridos.dart';


import 'package:provider/provider.dart';
import 'package:agenda/database/app_database.dart';
import 'setting.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});
  static const Color mainColor=Colors.blueGrey;

  @override
  State<homePage> createState() => _homePageState();
}
class _homePageState extends State<homePage>{
  final GlobalKey<ExpandableFabState> _fabKey = GlobalKey<ExpandableFabState>();
  String searchQuery="";
  bool _showSettings=false;


  @override
  Widget build(BuildContext context) {
    final deafDb=Provider.of<AppDatabase>(context, listen: false);
    return Scaffold(
        body:Stack(
          children:[
            SafeArea(child:ListView(
              children:[
                //GestureDetector(
                //  onHorizontalDragEnd:(details){
                //    if(details.primaryVelocity!<0){
                //      setState((){_showSettings=true;});
                //    }else if(details.primaryVelocity!>0){
                //      setState((){_showSettings=false;});
                //    }
                //  },
                //  child:Row(children:[
                //    Expanded(child:mySearchBar(onChanged:(value){setState((){searchQuery = value;});})),
                //    AnimatedContainer(
                //      duration:const Duration(milliseconds:200),
                //      width:_showSettings?50.0:0.0,
                //      child:IconButton(icon:Icon(Icons.settings),onPressed:(){
                //        Navigator.of(context).push(MaterialPageRoute(builder:(context)=>PantallaAjustes()));
                //      }),
                //    ),
                //  ]),
                //),
                StreamBuilder<(int, int)>(
                  stream:deafDb.watchVtvStatus(),
                  builder:(context,snapshot){
                    final (vencidas,porVencer)=snapshot.data??(0,0);
                    if (vencidas+porVencer==0)return const SizedBox.shrink();

                    return Column(children:[
                      if(vencidas>0)
                      BasicCard(
                        borderColor:Colors.red,
                        tonality:Colors.red,
                        child:Row(children:[
                          const Icon(Icons.info_outline,color:Colors.red),
                          const SizedBox(width:8),
                          Text("$vencidas VTV${vencidas>1?"s venceiron":"vencida"}.", 
                            style: TextStyle(color: Colors.orange.shade900)),
                        ]),
                      ),
                      if(porVencer>0&&vencidas>0)
                      const SizedBox(height:10),
                      if(porVencer>0)
                      BasicCard(
                        borderColor:Colors.orange,
                        tonality:Colors.orange,
                        child:Row(children:[
                          const Icon(Icons.info_outline,color:Colors.orange),
                          const SizedBox(width:8),
                          Text("$porVencer VTV${porVencer>1?"s":""} próxima${porVencer>1?"s":""} a vencer.", 
                            style: TextStyle(color: Colors.orange.shade900)),
                        ]),
                      ),
                    ]);
                  }
                )
              ],
            )),
            Positioned.fill(
              bottom:16.0,
              right:16.0,
              child:ExpandableFab(
              key:_fabKey,
                mainColor:homePage.mainColor,
                children:[
                  buildMiniFab(homePage.mainColor,
                    icon: Icons.school,
                    label: "Recorrido",
                    onPressed:()async{
                      _fabKey.currentState?.toggleMenu();
                      final newRecorrido=await showCreateRecorridoSheet(context,homePage.mainColor);
                      if(newRecorrido==null)return;
                      await deafDb.into(deafDb.recorridos).insert(newRecorrido);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(backgroundColor:Colors.green,content:Text("Recorrido guardado")),
                      );
                    },
                  ),
                  buildMiniFab(homePage.mainColor,
                    icon: Icons.schedule,
                    label: "Viaje",
                    onPressed:()async{
                      _fabKey.currentState?.toggleMenu();
                      final success=await showCreateTripSheet(
                        context,mainColor:homePage.mainColor,isTrip:true,startDate:DateTime.now()
                      );

                      if(success&&context.mounted){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content:Text("Viaje guardado"),backgroundColor:Colors.green,)
                        );
                      }
                    },
                  ),
                  buildMiniFab(homePage.mainColor,
                    icon: Icons.directions_bus,
                    label: "Colectivo",
                    onPressed:()async{
                      _fabKey.currentState?.toggleMenu();
                      if((await showCreateModifiColectivo(context,mainColor:homePage.mainColor))&&context.mounted){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content:Text("Colectivo guardado"),backgroundColor:Colors.green),
                        );
                      }
                    },
                  ),
                  buildMiniFab(homePage.mainColor,
                    icon: Icons.person,
                    label: "Chofer",
                    onPressed:()async{
                      _fabKey.currentState?.toggleMenu();
                      if((await showCreateModifiChofer(context,homePage.mainColor))&&context.mounted){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Chofer guardado"), backgroundColor: Colors.green),
                        );
                      }
                    },
                  ),
                ]
              )
            )
          ],
        )
    );
  }
}
