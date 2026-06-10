import '../utilities/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart' as drift;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:agenda/database/app_database.dart';
import 'package:agenda/utilities/syncService.dart';
import 'package:agenda/widgets/cards.dart';

import 'package:drift_db_viewer/drift_db_viewer.dart';

void buckupDatabase(BuildContext context)async{
  try{
    var status=await Permission.storage.request();
    if(!status.isGranted){print("Permiso denegado");}

    final originalFile=File(
      p.join((await getApplicationDocumentsDirectory()).path,'mi_base_de_datos.sqlite'));

    if(await originalFile.exists()){
      const destPath='/storage/emulated/0/Download/Backup_Agenda.sqlite';
      final destFile=File(destPath);

      await originalFile.copy(destFile.path);

      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:Text('¡Copia guardada en Descargas!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }else{
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:Text('Error: No se encontró la base de datos local.'),
            backgroundColor:Colors.red,
          ),
        );
      }
    }
  }catch(e){
    if(context.mounted){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:Text('Error al copiar: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}

class PantallaAjustes extends StatelessWidget{
  const PantallaAjustes({super.key});

  @override
  Widget build(BuildContext context){
    final db=context.read<AppDatabase>();
    final deafDb=Provider.of<AppDatabase>(context, listen: false);
    final settings=context.watch<SettingsProvider>();

    return Scaffold(
      appBar:AppBar(title:const Text("Configuracion")),
      body:SingleChildScrollView(
        padding:const EdgeInsets.symmetric(vertical:10),
        child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,spacing:15,children:[
          SwitchListTile(
            title:const Text("Modo Oscuro"),
            value:settings.getValue("dark_mode"),
            onChanged:(bool newValue){settings.setValue("dark_mode",newValue);},
          ),
          BasicCard(
            child:const Text("FullSync"),
            onPressed:()async{
              var returned=await (SyncService.performFullSync(deafDb));
              if(returned.$1){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content:Text('Sincronizado correctamente'),backgroundColor:Colors.green),
                );
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content:Text('Error al sincronizar'),backgroundColor:Colors.red),
                );
                showDialog(
                  context:context,
                  builder:(ctx)=>AlertDialog(
                    content:SingleChildScrollView(
                      child:Text(returned.$2),
                    ),
                    actions:[
                      TextButton(onPressed:()=>Navigator.of(ctx).pop(),child:const Text('Cerrar'))
                    ],
                  ),
                );
              }
            },
          ),
          BasicCard(
            child:const Text("Resetear fechas de Sincronizacion"),
            onPressed:()async{
              final prefs=await SharedPreferences.getInstance();
              await prefs.remove('last_sync_catalog');
              await prefs.remove('last_sync_events');
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Fechas borradas.'),backgroundColor:Colors.green),
              );
            },
          ),
          BasicCard(
            child:const Text("isSynced=false en TODO"),
            onPressed:()async{
              try{
                await db.markAllAsUnsynced();
                
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Datos marcados como no sincronizados.')),
                );
              }catch(e){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content:Text('Error marcando como no sincronizado: $e'), backgroundColor: Colors.red),
                );
              }
            },
          ),
          BasicCard(
            child:const Text("Respaldar localmente base de datos"),
            onPressed:()=>buckupDatabase(context),
          ),
          BasicCard(
            child:const Text("Inspeccionar base de datos"),
            onPressed:(){
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>DriftDbViewer(deafDb)));
            },
          ),
          BasicCard(
            child:const Text("NUKE DATABASE",style:TextStyle(color:Colors.red)),
            onPressed:()async{
              db.nukeDatabase();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('base de datos nuked.'),backgroundColor:Colors.green),
              );
            },
          ),
        ]),
      ),
    );
  }
}
