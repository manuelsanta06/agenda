import 'package:flutter/material.dart';
import '../widgets/searchBar.dart';

class colectivo{
    String domain="";
    String name="";
    int number=0;
    int fuel=0;

    colectivo({this.name="",this.domain="",this.number=0});

    Widget toWidget(){
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
            ),
        );
    }
}

List<colectivo> colectivos=[
    colectivo(name:"primero" ,domain:"primeroP" ,number: 1),
    colectivo(name:"segundo" ,domain:"segundoP" ,number: 2),
    colectivo(name:"tercero" ,domain:"terceroP" ,number: 3),
    colectivo(name:"cuarto" ,domain:"cuartoP" ,number: 4)
];

class colectivosPage extends StatelessWidget {
    const colectivosPage({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body:SafeArea(child: Column(
                children: [
                    mySearchBar(),
                ],
            ),),
        );
    }
}
