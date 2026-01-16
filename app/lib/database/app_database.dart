import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart'; 
export 'tables.dart'; 

part 'app_database.g.dart';

@DriftDatabase(tables: [
  Choferes, 
  Colectivos, 
  Events, 
  Stops, 
  EventChoferes, 
  EventColectivos
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

// Función para abrir la conexión de manera segura en Android/iOS/Linux
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // 1. looks for the place to put the files
    final dbFolder = await getApplicationDocumentsDirectory();
    // 2. Names the file
    final file = File(p.join(dbFolder.path, 'mi_base_de_datos.sqlite'));
    
    // 3. starts the database
    return NativeDatabase.createInBackground(file);
  });
}
