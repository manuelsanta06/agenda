import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' as drift; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/app_database.dart';

bool isToday(DateTime date){
  final now = DateTime.now();
  return date.day == now.day &&
    date.month == now.month &&
    date.year == now.year;
}
bool isYesterday(DateTime date){
  var yesterday = DateTime.now().subtract(Duration(days: 1));
  return date.day == yesterday.day &&
    date.month == yesterday.month &&
    date.year == yesterday.year;
}

Future<ColectivosCompanion?> showAddColectivoSheet(BuildContext context,{Colectivo? bus})async{

  final nameC = TextEditingController(text: bus==null?"":bus.name);
  final plateC = TextEditingController(text: bus==null?"":bus.plate);
  final internC = TextEditingController(text: bus==null?"":bus.number.toString());

  return await showModalBottomSheet<ColectivosCompanion?>(
    context: context,
    isScrollControlled: true,
    builder:(BuildContext context){
      return AnimatedPadding(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.only(
          left: 15,right: 15,
          top: 15,bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
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
                  if(plateC.text.isEmpty)return;
                  final nuevo = ColectivosCompanion(
                    id: drift.Value(bus?.id?? Uuid().v4()),
                    name: drift.Value(nameC.text),
                    plate: drift.Value(plateC.text),
                    number: drift.Value(int.tryParse(internC.text)),
                    
                    fuelAmount: const drift.Value("0"), 
                    fuelDate:  drift.Value(DateTime.now()),
                  );
                  Navigator.pop(context, nuevo);
                },
              )
            ),
            const SizedBox(height: 20),
          ]
        ),
      );
    },
  );
}

Future<void> inputFuelDialog(BuildContext context, Colectivo bus){
  final controller = TextEditingController();
  return showDialog<void>(
    context: context,
    builder:(BuildContext context){
      return AlertDialog(
        title: const Text("Ingresar gasoil"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: "${bus.fuelAmount}",),
        ),
        actions: [
          TextButton(
            child: const Text("Cancelar"),
            onPressed:(){Navigator.pop(context);},
          ),
          TextButton(
            child: const Text("Aceptar"),
            onPressed:()async{
              final db=Provider.of<AppDatabase>(context, listen: false);
              await (db.update(db.colectivos)
                ..where((tbl) => tbl.id.equals(bus.id)))
                .write(ColectivosCompanion(
                  fuelAmount: drift.Value(controller.text),
                  fuelDate: drift.Value(DateTime.now()),
                ));
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}


Widget colectivoToCard(BuildContext context, Colectivo bus, Color mainColor){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white12,
      ),
      margin:const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding:const EdgeInsets.only(top: 5,bottom:5,left: 10,right:0),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          InkWell(
            onTap:(){inputFuelDialog(context, bus);},
            onLongPress:()=>showDialog<void>(
              context: context,
              builder:(BuildContext context){
                return AlertDialog(
                  title: const Text("Eliminar Colectivo?"),
                  content: Text("¿Seguro que queres eliminar '${bus.name==""?bus.plate:bus.name}'?"),
                  actions: [
                    TextButton(
                      child: const Text("Cancelar"),
                      onPressed:()=> Navigator.pop(context),
                    ),
                    TextButton(
                      child: const Text("Eliminar", style: TextStyle(color: Colors.red)),
                      onPressed:()async{
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:Text("'${bus.name==""?bus.plate:bus.name}' Eliminado")));
                        final db=Provider.of<AppDatabase>(context, listen: false);
                        await (db.update(db.colectivos)
                          ..where((tbl)=>tbl.id.equals(bus.id)))
                          .write(ColectivosCompanion(
                            is_active: drift.Value(false)
                          ));
                      },
                    ),
                  ],
                );
              },
            ),
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nombre: ${(bus.name ?? "").isEmpty?bus.plate:bus.name}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Patente: ${bus.plate}"),
                if(bus.number!=null)Text("Interno: ${bus.number}"),
                if(bus.fuelDate!=null)
                Text("Gasoil:  ${isToday(bus.fuelDate!)?"Hoy"
                  :isYesterday(bus.fuelDate!)?"Ayer"
                  :"Hace ${bus.fuelDate!.difference(DateTime.now()).inDays} dias"} -> ${bus.fuelAmount!}"),
              ],
            ),
          ),
          Positioned(
            top: -5,
            right: 0,
            child: IconButton(
              icon: Icon(Icons.edit, color: mainColor),
              onPressed:()async{
                final nuevo=await showAddColectivoSheet(context, bus: bus);
                if(nuevo==null)return;
                final db=Provider.of<AppDatabase>(context, listen: false);
                await (db.update(db.colectivos)
                  ..where((tbl) => tbl.id.equals(bus.id)))
                  .write(nuevo);
              },
            ),
          ),
        ],
      ),
    );
  }
