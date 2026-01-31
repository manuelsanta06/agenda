import 'package:drift/drift.dart';
import 'recorridos.dart';

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
    case EventStates.HAPPENING:   return "Ahora";
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

  TextColumn get recorridoId => text().nullable().references(Recorridos, #id)();

  @override
  Set<Column> get primaryKey => {id};
}

