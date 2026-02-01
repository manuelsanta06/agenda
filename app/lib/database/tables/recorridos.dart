import 'package:drift/drift.dart';
import 'events.dart';
import 'users.dart';

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

//LOS HORARIOS/TURNOS
class RecorridoShifts extends Table {
  TextColumn get id => text()();
  
  TextColumn get recorridoId => text().references(Recorridos, #id, onDelete: KeyAction.cascade)();
  IntColumn get weekDay => intEnum<WeekDays>()(); 
  
  IntColumn get startTime => integer()(); 
  IntColumn get endTime => integer()();   

  TextColumn get shiftName => text()();

  Set<Column> get primaryKey => {id};
}

class ShiftChoferes extends Table {
  TextColumn get shiftId => text().references(RecorridoShifts, #id, onDelete: KeyAction.cascade)();
  TextColumn get choferId => text().references(Choferes, #id, onDelete: KeyAction.cascade)();
  
  @override
  Set<Column> get primaryKey => {shiftId, choferId};
}

class ShiftColectivos extends Table {
  TextColumn get shiftId => text().references(RecorridoShifts, #id, onDelete: KeyAction.cascade)();
  TextColumn get colectivoId => text().references(Colectivos, #id, onDelete: KeyAction.cascade)();
  
  @override
  Set<Column> get primaryKey => {shiftId, colectivoId};
}

//ENCARGADOS (Quien paga/El Padre)
class Encargados extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get phone => text().nullable()();
  
  RealColumn get balance => real().withDefault(const Constant(0.0))();
  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

//SUSCRIPCIONES(El Alumno/El Pasajero real)
class RecorridoSubscriptions extends Table {
  TextColumn get id => text()();
  
  TextColumn get recorridoId => text().references(Recorridos, #id, onDelete: KeyAction.cascade)();
  TextColumn get encargadoId => text().references(Encargados, #id, onDelete: KeyAction.cascade)();
  
  TextColumn get subscriptionName => text()();
  TextColumn get address => text().nullable()();

  IntColumn get customPrice => integer().nullable()();
  
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}
