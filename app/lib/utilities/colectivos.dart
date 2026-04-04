import 'package:agenda/widgets/timeinputs.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' as drift; 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../database/app_database.dart';
import '../widgets/searchBar.dart';
import 'package:agenda/widgets/cards.dart';
import 'package:agenda/widgets/text.dart';
import '../utilities/syncService.dart';


// 1. EL WRAPPER (Maneja la Base de Datos)
Future<bool> showCreateModifiColectivo(BuildContext context,{Colectivo? bus})async{
  final result=await showModalBottomSheet<ColectivosCompanion?>(
    context:context,
    isScrollControlled:true,
    builder:(BuildContext context)=>_CreateColectivoSheet(bus: bus),
  );
  if(result==null)return false;
  final db=Provider.of<AppDatabase>(context,listen:false);
  try{
    await db.into(db.colectivos).insert(result,mode:drift.InsertMode.insertOrReplace);
    SyncService.pushUnsyncedData(db);
    return true;
  }catch(e){
    print("Error guardando colectivo en Drift: $e");
    return false;
  }
}

class _CreateColectivoSheet extends StatefulWidget {
  final Colectivo? bus;
  const _CreateColectivoSheet({this.bus});

  @override
  State<_CreateColectivoSheet> createState() => _CreateColectivoSheetState();
}

class _CreateColectivoSheetState extends State<_CreateColectivoSheet> {
  late final TextEditingController nameC;
  late final TextEditingController plateC;
  late final TextEditingController internC;
  late final TextEditingController capacityC;

  @override
  void initState() {
    super.initState();
    nameC = TextEditingController(text: widget.bus?.name ?? "");
    plateC = TextEditingController(text: widget.bus?.plate ?? "");
    internC = TextEditingController(text: widget.bus?.number?.toString() ?? "");
    capacityC = TextEditingController(text: widget.bus?.capacity.toString() ?? "");
  }

  @override
  void dispose() {
    nameC.dispose();
    plateC.dispose();
    internC.dispose();
    capacityC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.only(
          left: 15, right: 15, top: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text("Nombre"),
            TextField(controller: nameC, decoration: const InputDecoration(hintText: "A")),
            const SizedBox(height: 10),
            
            const Text("Patente"),
            TextField(controller: plateC, decoration: const InputDecoration(hintText: "AAA-000")),
            const SizedBox(height: 10),
            
            const Text("Interno"),
            TextField(
              controller: internC, 
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "NN")
            ),
            const SizedBox(height: 10),
            
            const Text("Capacidad"),
            TextField(
              controller: capacityC, 
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "32")
            ),
            const SizedBox(height: 40),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                child: const Text("Guardar"),
                onPressed: () {
                  if (plateC.text.isEmpty) return;
                  
                  final nuevo = ColectivosCompanion(
                    id: drift.Value(widget.bus?.id ?? const Uuid().v4()),
                    name: drift.Value(nameC.text),
                    plate: drift.Value(plateC.text.toUpperCase()),
                    number: drift.Value(int.tryParse(internC.text)),
                    capacity: drift.Value(int.tryParse(capacityC.text) ?? 0),
                    fuelAmount: drift.Value(widget.bus?.fuelAmount ?? "0"),
                    fuelDate: drift.Value(widget.bus?.fuelDate ?? DateTime.now()),
                    oilDate: drift.Value(widget.bus?.oilDate ?? DateTime.now()),
                    isSynced: const drift.Value(false),
                  );
                  // Le devolvemos el companion al Wrapper
                  Navigator.pop(context, nuevo);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
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
              final success=await showCreateModifiColectivo(context,bus:bus);
              if(success&&context.mounted){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content:Text("Colectivo actualizado"),backgroundColor:Colors.green),
                );
              }
              break;

            case 'fuel':
              inputFuelDialog(context,bus);
              break;

            case 'oil':
              inputOilDialog(context,bus);
              break;
            case 'vtv':
              DateTime? newDate=await getDate(context,null);
              if(newDate==null/*||newDate.isBefore(DateTime.now())*/)return;
              final db=Provider.of<AppDatabase>(context, listen: false);
              await (db.update(db.colectivos)
                ..where((tbl) => tbl.id.equals(bus.id)))
                .write(ColectivosCompanion(
                  vtv:drift.Value(newDate),isSynced:drift.Value(false)));
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
            value:'vtv',
            child:Row(children:[
              Icon(Icons.shield),
              SizedBox(width:8),
              Text('VTV')
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
            Expanded(child:Text((bus.name??"").isEmpty?bus.plate:bus.name!,
              style: TextStyle(
                fontSize:16,fontWeight:FontWeight.w600,
                color:bus.vtv.isBefore(DateTime.now().add(Duration(days:5)))?Colors.red:null,
              ))),
            pillText(bus.plate,mainColor),
            if(!hideOptions)
              SizedBox(width:20)
          ]),
          //dataLine("Patente: ${bus.plate}",mainColor),
          if(fullInfo&&bus.is_active)
            DataLine(text:"Gasoil: ${relativeDate(bus.fuelDate)} -> ${bus.fuelAmount}",mainColor:mainColor),
          if(bus.is_active)
            DataLine(text:"VTV: ${bus.vtv.year}-${bus.vtv.month}-${bus.vtv.day}",
              mainColor:mainColor,
              textColor:bus.vtv.isBefore(DateTime.now().add(Duration(days:5)))?Colors.red:null
            ),
          if(fullInfo&&bus.is_active)
            DataLine(text:"Aceite: ${relativeDate(bus.oilDate,montlhy:true)}",mainColor:mainColor),
          DataLine(text:"Capacidad: ${bus.capacity}",mainColor:mainColor),
          if(bus.number!=null)
            DataLine(text:"Interno: ${bus.number}",mainColor:mainColor),
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
          return (s.$1.name?.toUpperCase().contains(searchQuery.toUpperCase())??false)
            ||s.$1.plate.toUpperCase().contains(searchQuery.toUpperCase());
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
