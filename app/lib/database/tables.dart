import 'package:agenda/pages/calendar.dart';
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

  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

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

  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

//Tabla de EVENTOS (Viajes)

enum WeekDays {
  NONE,      // 0
  MONDAY,    // 1
  TUESDAY,   // 2
  WEDNESDAY, // 3
  THURSDAY,  // 4
  FRIDAY,    // 5
  SATURDAY,  // 6
  SUNDAY     // 7
}

// Convertidor: List<WeekDays> <-> String ("1 2 3")
class WeekDaysConverter extends TypeConverter<List<WeekDays>, String> {
  const WeekDaysConverter();

  //[String] -> [List]
  @override
  List<WeekDays> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    
    return fromDb
        .split(' ')
        .where((element) => element.isNotEmpty) // Seguridad contra espacios dobles
        .map((numberString) {
          final index = int.tryParse(numberString);
          if (index != null && index >= 0 && index < WeekDays.values.length) {
            return WeekDays.values[index];
          }
          return WeekDays.NONE; // Fallback
        })
        .toList();
  }

  //[List] -> [String]
  @override
  String toSql(List<WeekDays> value) {
    if (value.isEmpty) return "";
    
    return value.map((day) => day.index.toString()).join(' ');
  }
}

enum EventTypes{
  NONE,
  EVENT,
  REMINDER,
  SCHOOL,
}
String eventTypeToString(EventTypes type){
  switch(type){
    case EventTypes.NONE: return "Error";
    case EventTypes.EVENT: return "Viaje";
    case EventTypes.SCHOOL: return "Recorrido";
    case EventTypes.REMINDER: return "Recordatorio";
  }
}
enum EventStates{
  NONE,
  REMOVED,
  DONE,
  PENDING,
  REPEATING,
  INCOMPLETE,
  HAPPENING
}
String eventStateToString(EventStates type){
  switch(type){
    case EventStates.NONE:        return "Error";
    case EventStates.REMOVED:     return "Borrado";
    case EventStates.DONE:        return "Finalizado";
    case EventStates.PENDING:     return "Pendiente";
    case EventStates.REPEATING:   return "Repitiendose";
    case EventStates.INCOMPLETE:  return "Icompleto";
    case EventStates.HAPPENING:  return "Ahora";
  }
}

class Events extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get contactName => text().nullable()();
  TextColumn get contact => text().nullable()();
  
  BoolColumn get repeat => boolean().withDefault(const Constant(false))();
  TextColumn get days => text().map(const WeekDaysConverter()).nullable()();

  DateTimeColumn get startDateTime => dateTime()();
  DateTimeColumn get endDateTime => dateTime()();
  DateTimeColumn get stopRepeatingDateTime => dateTime().nullable()();

  IntColumn get state => intEnum<EventStates>()();
  IntColumn get type => intEnum<EventTypes>()();
  BoolColumn get isTrip => boolean()();

  BoolColumn get isSynced => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

//Tabla de PARADAS 
// Un evento tiene muchas paradas.
class Stops extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  DateTimeColumn get start => dateTime().nullable()();
  
  // Relación: A qué evento pertenece esta parada
  TextColumn get eventId => text().references(Events, #id,onDelete: KeyAction.cascade)();
  
  // Para saber el orden de las paradas
  IntColumn get orderIndex => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

//Tablas Intermedias 

// Un Evento tiene muchos Choferes, y un Chofer muchos Eventos
class EventChoferes extends Table {
  TextColumn get eventId => text().references(Events, #id,onDelete: KeyAction.cascade)();
  TextColumn get choferId => text().references(Choferes, #id,onDelete: KeyAction.cascade)();
  
  @override
  Set<Column> get primaryKey => {eventId, choferId};
}

// Un Evento tiene muchos Colectivos
class EventColectivos extends Table {
  TextColumn get eventId => text().references(Events, #id,onDelete: KeyAction.cascade)();
  TextColumn get colectivoId => text().references(Colectivos, #id,onDelete: KeyAction.cascade)();
  
  @override
  Set<Column> get primaryKey => {eventId, colectivoId};
}
