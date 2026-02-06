import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' as drift; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/app_database.dart';
import '../widgets/searchBar.dart';
import 'package:agenda/widgets/cards.dart';
import 'package:agenda/widgets/text.dart';


Future<ColectivosCompanion?> showAddColectivoSheet(BuildContext context,{Colectivo? bus})async{
  final nameC = TextEditingController(text: bus?.name??"");
  final plateC = TextEditingController(text: bus?.plate??"");
  final internC = TextEditingController(text: bus?.number?.toString()??"");
  final capacityC = TextEditingController(text: bus?.capacity.toString()??"");

  return await showModalBottomSheet<ColectivosCompanion?>(
    context: context,
    isScrollControlled: true,
    builder:(BuildContext context){
      return SafeArea(child:AnimatedPadding(
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

            const SizedBox(height: 10),
            Text("Patente"),
            const SizedBox(height: 8),
            TextField(decoration: InputDecoration(hintText: "AAA-000"),
              controller: plateC,),

            const SizedBox(height: 10),
            Text("Interno"),
            const SizedBox(height: 8),
            TextField(decoration: InputDecoration(hintText: "NN"),
              keyboardType: TextInputType.number,
              controller: internC,),

            const SizedBox(height: 10),
            Text("Capacidad"),
            const SizedBox(height: 8),
            TextField(decoration: InputDecoration(hintText: "32"),
              keyboardType: TextInputType.number,
              controller: capacityC,),
            const SizedBox(height: 40),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: Text("Guardar"),
                onPressed:(){
                  if(plateC.text.isEmpty)return;
                  final nuevo = ColectivosCompanion(
                    id: drift.Value(bus?.id?? Uuid().v4()),
                    name: drift.Value(nameC.text),
                    plate: drift.Value(plateC.text.toUpperCase()),
                    number: drift.Value(int.tryParse(internC.text)),
                    capacity:drift.Value(int.tryParse(capacityC.text)??0),
                    
                    fuelAmount:drift.Value(bus==null?"0":bus.fuelAmount),
                    fuelDate:drift.Value(bus==null?DateTime.now():bus.fuelDate),

                    oilDate:drift.Value(bus==null?DateTime.now():bus.oilDate),
                  );
                  Navigator.pop(context, nuevo);
                },
              )
            ),
            const SizedBox(height: 20),
          ]
        ),
      ));
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
            child: const Text("Cancelar",style:TextStyle(color:Colors.red)),
            onPressed:(){Navigator.pop(context);},
          ),
          TextButton(
            child: const Text("Aceptar",style:TextStyle(color:Colors.green)),
            onPressed:()async{
              final db=Provider.of<AppDatabase>(context, listen: false);
              await (db.update(db.colectivos)
                ..where((tbl) => tbl.id.equals(bus.id)))
                .write(ColectivosCompanion(
                  fuelAmount: drift.Value(controller.text),
                  fuelDate: drift.Value(DateTime.now()),
                  isSynced:drift.Value(false)
                ));
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

Future<void> inputOilDialog(BuildContext context, Colectivo bus){
  return showDialog<void>(
    context: context,
    builder:(BuildContext context){
      return AlertDialog(
        title: const Text("Actulizar cambio de aceite?"),
        actions: [
          TextButton(
            child: const Text("Cancelar",style:TextStyle(color:Colors.red)),
            onPressed:()=>Navigator.pop(context),
          ),
          TextButton(
            child: const Text("Aceptar",style:TextStyle(color:Colors.green)),
            onPressed:()async{
              final db=Provider.of<AppDatabase>(context, listen: false);
              await (db.update(db.colectivos)
                ..where((tbl) => tbl.id.equals(bus.id)))
                .write(ColectivosCompanion(
                  oilDate:drift.Value(DateTime.now()),
                  isSynced:drift.Value(false)
                ));
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

Future<void> removeColectivoDialog(BuildContext context,Colectivo bus,bool restaurar)async{
  return showDialog<void>(
    context: context,
    builder:(BuildContext context){
      return AlertDialog(
        title:Text("${restaurar?"Restaurar":"Eliminar"} Colectivo?"),
        content: Text("¿Seguro que queres ${restaurar?"restaurar":"eliminar"} '${bus.name==""?bus.plate:bus.name}'?"),
        actions: [
          TextButton(
            child: const Text("Cancelar"),
            onPressed:()=> Navigator.pop(context),
          ),
          TextButton(
            child:Text(restaurar?"Restaurar":"Eliminar", style: TextStyle(color: Colors.red)),
            onPressed:()async{
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:Text("'${bus.name==""?bus.plate:bus.name}' ${restaurar?"Restaurado":"Eliminado"}"),
                backgroundColor:restaurar?Colors.green:Colors.red,
              ));
              final db=Provider.of<AppDatabase>(context, listen: false);
              await (db.update(db.colectivos)
                ..where((tbl)=>tbl.id.equals(bus.id)))
                .write(ColectivosCompanion(
                  is_active: drift.Value(restaurar)
                ));
            },
          ),
        ],
      );
    },
  );
}


Widget colectivoToCard(
  BuildContext context,
  Colectivo bus,
  Color mainColor,{
  bool busy=false,
  bool hideOptions=false,
  bool fullInfo=true,
  VoidCallback? onPressed,
  VoidCallback? onLongPress,
}){
  return Container(
    margin:const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    child:BasicCard(
      padding:const EdgeInsets.all(14),
      actionIcon:hideOptions?null:PopupMenuButton(
        icon:const Icon(Icons.more_vert),
        onSelected:(String result)async{
          switch (result) {
            case 'edit':
              final nuevo=await showAddColectivoSheet(context,bus: bus);
              if(nuevo==null)return;
              final db=Provider.of<AppDatabase>(context, listen: false);
              await (db.update(db.colectivos)
                ..where((tbl) => tbl.id.equals(bus.id)))
                .write(nuevo);
              break;

            case 'fuel':
              inputFuelDialog(context,bus);
              break;

            case 'oil':
              inputOilDialog(context,bus);
              break;
            case 'delete':
              removeColectivoDialog(context,bus,!(bus.is_active));
              break;

            default:
              return;
          }
        },
        itemBuilder:(BuildContext Context)=><PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value:'edit',
            child:Row(children:[
              Icon(Icons.edit),
              SizedBox(width:8),
              Text('Editar')
            ]),
          ),
          PopupMenuItem<String>(
            value:'fuel',
            child:Row(children:[
              Icon(Icons.ev_station),
              SizedBox(width:8),
              Text('Gasoil')
            ]),
          ),
          PopupMenuItem<String>(
            value:'oil',
            child:Row(children:[
              Icon(Icons.water_drop),
              SizedBox(width:8),
              Text('Aceite')
            ]),
          ),
          PopupMenuItem<String>(
            value: 'delete',
            child: Row(
              children:bus.is_active? ([
                Icon(Icons.delete, color: Colors.red), 
                SizedBox(width: 8), 
                Text('Borrar',style:TextStyle(color:Colors.red)),
              ]):([
                Icon(Icons.restore_from_trash,color: Colors.green),
                SizedBox(width: 8), 
                Text('Restaurar',style:TextStyle(color:Colors.green))
              ]),
            ),
          )
        ],
      ),
      onPressed:onPressed,
      onLongPressed:onLongPress,
      tonality:bus.is_active&&!busy?null:Colors.red,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Row(children:[
            Expanded(child:Text("Nombre: ${(bus.name??"").isEmpty?bus.plate:bus.name}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
            pillText(bus.plate,mainColor),
          ]),
          //dataLine("Patente: ${bus.plate}",mainColor),
          dataLine("Capacidad: ${bus.capacity}", mainColor),
          if(bus.number!=null)dataLine("Interno: ${bus.number}",mainColor),
          if(fullInfo&&bus.is_active)
          dataLine("Gasoil: ${relativeDate(bus.fuelDate)} -> ${bus.fuelAmount}",mainColor),
          if(fullInfo&&bus.is_active)
          dataLine("Aceite: ${relativeDate(bus.oilDate,montlhy:true)}",mainColor),
        ],
      ),
    )
  );
}

Future<Colectivo?> colectivoCardSelectionList(BuildContext context,List<(Colectivo,bool)> buses,Color maincolor)async{
  String searchQuery="";
  return await showModalBottomSheet<Colectivo>(
    context:context,
    isScrollControlled: true,
    constraints:BoxConstraints(maxHeight:MediaQuery.of(context).size.height*0.8),
    builder:(BuildContext context){
      return StatefulBuilder(builder:(BuildContext context,StateSetter setStateModal){
        final filtered=buses.where((s){
          return (s.$1.name?.contains(searchQuery)??false)
            ||s.$1.plate.contains(searchQuery);
        }).toList();
        return Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),child:Column(
          mainAxisSize:MainAxisSize.min,
          children:[
            const SizedBox(height:10),
            mySearchBar(onChanged:(value)=>setStateModal((){searchQuery=value;})),
            const SizedBox(height:10),
            Flexible(child:ListView.builder(
              shrinkWrap: true,
              itemCount:filtered.length,
              itemBuilder:(context,index){
                return Container(
                  margin: EdgeInsets.symmetric(horizontal:15),
                  child:colectivoToCard(
                    context,filtered[index].$1,maincolor,
                    busy:filtered[index].$2,
                    fullInfo:false,
                    hideOptions:true,
                    onPressed:()=>Navigator.of(context).pop(filtered[index].$1),
                  )
                );
              },
            ))
          ]
        ));
      });
    },
  );
}
