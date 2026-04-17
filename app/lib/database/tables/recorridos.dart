import 'package:drift/drift.dart';

//EL RECORRIDO
class Recorridos extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()(); 
  BoolColumn get pinned => boolean().withDefault(const Constant(false))();
  IntColumn get basePrice => integer().withDefault(const Constant(0))();
  
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class Passengers extends Table{
  TextColumn get id=>text()();
  TextColumn get name=>text()();
  TextColumn get managerName=>text()();
  TextColumn get managerPhone=>text()();
  IntColumn get customPrice=>integer().withDefault(const Constant(-1))();
  TextColumn get recorridoId=>text().references(Recorridos,#id,onDelete:KeyAction.cascade)();
  BoolColumn get isActive=>boolean().withDefault(const Constant(true))();
  BoolColumn get isSynced=>boolean().withDefault(const Constant(false))();
  @override
  Set<Column> get primaryKey=>{id};
}

