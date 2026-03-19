import 'package:flutter/material.dart';
import '../widgets/searchBar.dart';
import 'setting.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});
  static const Color mainColor=Colors.blueGrey;

  @override
  State<homePage> createState() => _homePageState();
}
class _homePageState extends State<homePage>{
  bool _showSettings=false;


  Widget build(BuildContext context) {
    return Scaffold(
        body:SafeArea(child: Column(
            children: [
              GestureDetector(
                onHorizontalDragEnd: (details) {
                  if(details.primaryVelocity!<0){
                    setState((){_showSettings=true;});
                  }else if(details.primaryVelocity!>0){
                    setState((){_showSettings=false;});
                  }
                },
                child:Row(children:[
                  Expanded(child:mySearchBar()),
                  AnimatedContainer(
                    duration:const Duration(seconds:3),
                    width:_showSettings?50.0:0.0,
                    child:IconButton(icon:Icon(Icons.settings),onPressed:(){
                      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>PantallaAjustes()));
                    }),
                  ),
                ]),
              ),
            ],
        ),),
    );
  }
}
