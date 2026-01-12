import 'package:drift/drift.dart';

//Tabla de CHOFERES
class Choferes extends Table {
  TextColumn get id => text()(); 
  
  TextColumn get dni => text().nullable()();
  
  TextColumn get name => text().nullable()();
  TextColumn get surname => text().nullable()();
  TextColumn get alias => text().nullable()();
  TextColumn get mobileNumber => text().nullable()();
  TextColumn get picturePath => text().nullable()();

  BoolColumn get is_active => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

//Tabla de COLECTIVOS
class Colectivos extends Table {
  TextColumn get id => text()();
  
  TextColumn get plate => text().unique()();
  
  TextColumn get name => text().nullable()();
  IntColumn get number => integer().nullable()();
  
  TextColumn get fuelAmount => text().nullable()();
  DateTimeColumn get fuelDate => dateTime().nullable()();

  BoolColumn get is_active => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

//Tabla de EVENTOS (Viajes)
class Eventos extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().nullable()();
  
  DateTimeColumn get start => dateTime()();
  DateTimeColumn get end => dateTime().nullable()();
  BoolColumn get repeat => boolean().withDefault(const Constant(false))();

  TextColumn get days => text().nullable()();

  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

//Tabla de PARADAS 
// Un evento tiene muchas paradas.
class Paradas extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  
  // Relación: A qué evento pertenece esta parada
  TextColumn get eventId => text().references(Eventos, #id)();
  
  // Para saber el orden de las paradas
  IntColumn get orderIndex => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

//Tablas Intermedias 

// Un Evento tiene muchos Choferes, y un Chofer muchos Eventos
class EventoChoferes extends Table {
  TextColumn get eventId => text().references(Eventos, #id)();
  TextColumn get choferId => text().references(Choferes, #id)();
  
  @override
  Set<Column> get primaryKey => {eventId, choferId};
}

// Un Evento tiene muchos Colectivos
class EventoColectivos extends Table {
  TextColumn get eventId => text().references(Eventos, #id)();
  TextColumn get colectivoId => text().references(Colectivos, #id)();
  
  @override
  Set<Column> get primaryKey => {eventId, colectivoId};
}
