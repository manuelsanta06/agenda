import 'package:flutter/material.dart';
import '../widgets/searchBar.dart';

bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.day == now.day &&
        date.month == now.month &&
        date.year == now.year;
}
bool isYesterday(DateTime date) {
    var yesterday = DateTime.now().subtract(Duration(days: 1));
    return date.day == yesterday.day &&
        date.month == yesterday.month &&
        date.year == yesterday.year;
}

class fuelInfo{
    String? amount;
    DateTime? date;
    fuelInfo({this.amount, this.date});
}

//there HAS to be a plate, 
class colectivo{
    String plate;
    String name;
    int? number;
    fuelInfo fuel=fuelInfo();

    colectivo({this.name="",required this.plate,this.number}){
        plate=plate.toUpperCase();
    }
    
    Future<void> confirmDeleteDialog(BuildContext context, VoidCallback onDelete){
        return showDialog<void>(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: const Text("Eliminar colectivo?"),
                    content: Text("¿Seguro que queres eliminar '${name==""?plate:name}'?"),
                    actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context), // cancelar
                            child: const Text("Cancelar"),
                        ),
                        TextButton(
                            onPressed: () {
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        content:Text("'${name==""?plate:name}' Eliminado")));
                                onDelete(); // avisa a la pantalla
                            },
                            child: const Text("Eliminar", style: TextStyle(color: Colors.red)),
                        ),
                    ],
                );
            },
        );
    }

    Future<void> inputFuelDialog(BuildContext context, VoidCallback onChanged){
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
                                fuel.amount=controller.text;
                                fuel.date=DateTime.now();
                                onChanged();
                                Navigator.pop(context);
                            },
                            child: const Text("Aceptar"),
                        ),
                    ],
                );
            },
        );
    }

    Widget toWidget(BuildContext context, VoidCallback onChanged, VoidCallback onRemove){
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white12,
            ),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: InkWell( 
                onTap: (){inputFuelDialog(context,onChanged);},
                onSecondaryTap: ()=>confirmDeleteDialog(context,onRemove),
                onLongPress: ()=>confirmDeleteDialog(context,onRemove),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Text("Nombre: ${name.isEmpty?plate:name}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("Patente: $plate"),
                        if(number!=null)Text("Interno: $number"),
                        if(fuel.date!=null)
                            Text("Gasoil:  ${isToday(fuel.date!)?"Hoy":isYesterday(fuel.date!)?"Ayer"
                                :"Hace ${fuel.date!.difference(DateTime.now()).inDays} dias"} -> ${fuel.amount!}"),
                    ],
                ),
            ),
        );
    }
}

List<colectivo> colectivos=[                                                 
    colectivo(name:"primero" ,plate:"primeroP" ,number: 1),
    colectivo(name:"segundo" ,plate:"segundoP" ,number: 2),
    colectivo(name:"tercero" ,plate:"terceroP" ,number: 3),
    colectivo(name:"cuarto" ,plate:"cuartoP" ,number: 4),
    colectivo(name:"" ,plate:"LBA 074" ,number: 5),
];

class colectivosPage extends StatefulWidget {
  const colectivosPage({super.key});

  @override
  State<colectivosPage> createState() => _colectivosPageState();
}

class _colectivosPageState extends State<colectivosPage>{
    String searchQuery = "";

    void _showAddColectivoSheet() {
        final nameC = TextEditingController();
        final plateC = TextEditingController();
        final internC = TextEditingController();

        showModalBottomSheet<void>(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
                return AnimatedPadding(
                    duration: const Duration(milliseconds: 150),
                    padding: EdgeInsets.only(
                        left: 15,right: 15,
                        top: 15,bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: _buildAddColectivoSheet(nameC, plateC, internC),
                );
            },
        );
    }

    Widget _buildAddColectivoSheet(TextEditingController nameC,
        TextEditingController plateC,
        TextEditingController internC,){
        return Column(
            mainAxisSize: MainAxisSize.min,
            children:<Widget>[
                Text("Nombre"),
                const SizedBox(height: 8),
                TextField(decoration: InputDecoration(hintText: "A"),
                    controller: nameC,),

                const SizedBox(height: 16),
                Text("Patente"),
                const SizedBox(height: 8),
                TextField(decoration: InputDecoration(hintText: "AAA-000"),
                    controller: plateC,),

                const SizedBox(height: 16),
                Text("Interno"),
                const SizedBox(height: 8),
                TextField(decoration: InputDecoration(hintText: "NN"),
                    controller: internC,),
                const SizedBox(height: 50),

                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        child: Text("Guardar"),
                        onPressed:(){
                            if(plateC.text==""){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content:Text("No puede no haber patente")));
                                return;
                            }if(internC.text==""){
                                colectivos.add(colectivo(name:nameC.text,plate:plateC.text));
                            }else{
                                colectivos.add(colectivo(name: nameC.text,
                                    plate:plateC.text,
                                    number: int.parse(internC.text)));
                            }
                            Navigator.pop(context);
                            setState((){});
                        },
                    )
                ),
                const SizedBox(height: 30),
            ]
        );
    }

    @override
    Widget build(BuildContext context) {
        //filtering the busses
        final filtered;
        if(searchQuery!=""){
            filtered = colectivos.where((c) {
                return c.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
                    c.plate.toLowerCase().contains(searchQuery.toLowerCase()) ||
                    c.number.toString().contains(searchQuery);
                }).toList();
        }
        else{filtered=colectivos;}

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
                                    child: filtered[index].toWidget(context,
                                        (){setState((){});},
                                        (){setState((){colectivos.remove(filtered[index]);});},),
                                );
                            },
                        ),
                    ),
                ],
            ),),
            floatingActionButton: FloatingActionButton(
                onPressed:_showAddColectivoSheet,
                backgroundColor: Color.fromARGB(255, 252, 102, 1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                child:Icon(Icons.add),
            ),
        );
    }
}
