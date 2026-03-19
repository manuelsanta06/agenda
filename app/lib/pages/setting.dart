import '../utilities/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:agenda/database/app_database.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';

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
    final settings=context.watch<SettingsProvider>();

    return Scaffold(
      appBar:AppBar(title:const Text("Configuracion")),
      body:ListView(
        children:[
          SwitchListTile(
            title:const Text("Modo Oscuro"),
            value:settings.getValue("dark_mode"),
            onChanged:(bool newValue){settings.setValue("dark_mode",newValue);},
          ),
          ListTile(
            title:const Text("Respaldar base de datos"),
            onTap:()=>buckupDatabase(context),
          ),
          ListTile(
            title:const Text("Inspeccionar base de datos"),
            onTap:(){
              final db = Provider.of<AppDatabase>(context, listen: false);
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>DriftDbViewer(db)));
            },
          ),
        ],
      ),
    );
  }
}
