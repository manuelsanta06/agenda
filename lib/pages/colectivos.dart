import 'package:flutter/material.dart';
import '../widgets/searchBar.dart';

class fuelInfo{
    String amount;
    DateTime date;
    fuelInfo({this.amount="NONE",required this.date});
}

class colectivo{
    String domain="";
    String name="";
    int number=0;
    fuelInfo fuel=fuelInfo(date: DateTime(2025));

    colectivo({this.name="",this.domain="",this.number=0});

    Future<void> inputFuelDialog(BuildContext context){
        final controller = TextEditingController();
        return showDialog<void>(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: const Text("Ingresar gasoil"),
                    content: TextField(
                        controller: controller,
                        decoration: InputDecoration(hintText: "${fuel.amount}",),
                    ),
                    actions: [
                        TextButton(
                            onPressed: () {print("fuel input canceled");Navigator.pop(context);},
                            child: const Text("Cancelar"),
                        ),
                        TextButton(
                            onPressed: () {
                                print("Texto ingresado: ${controller.text}");
                                Navigator.pop(context);
                            },
                            child: const Text("Aceptar"),
                        ),
                    ],
                );
            },
        );
    }

    Widget toWidget(BuildContext context){
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white12,
            ),
            child: InkWell( 
                onTap: (){inputFuelDialog(context);},
                onLongPress: (){},
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text("Nombre: $name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("Patente: $domain"),
                        Text("Interno: $number"),
                        Text("Gasoil: ${fuel.amount}"),
                    ],
                ),
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

class colectivosPage extends StatefulWidget {
  const colectivosPage({super.key});

  @override
  State<colectivosPage> createState() => _colectivosPageState();
}

class _colectivosPageState extends State<colectivosPage>{
    String searchQuery = "";

    @override
    Widget build(BuildContext context) {
        //filtering the busses
        final filtered = colectivos.where((c) {
            return c.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
                c.domain.toLowerCase().contains(searchQuery.toLowerCase()) ||
                c.number.toString().contains(searchQuery);
        }).toList();

        return Scaffold(
            body:SafeArea(child: Column(
                children: [
                    mySearchBar(onChanged: (value){setState((){searchQuery = value;});},),
                    Expanded(
                        child: ListView.builder(
                            itemCount: filtered.length,
                            itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: filtered[index].toWidget(context),
                                );
                            },
                        ),
                    ),
                ],
            ),),
            floatingActionButton: FloatingActionButton(
                onPressed: (){},
                backgroundColor: Color.fromARGB(255, 252, 102, 1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child:Icon(Icons.add),
            ),
        );
    }
}
















