import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart'; 
export 'tables.dart'; 

part 'app_database.g.dart';


class EventWithStops {
  final Event event;
  final List<Stop> stops;
  EventWithStops({required this.event, required this.stops});
}

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

  Stream<List<EventWithStops>> watchEventsWithStops(DateTime day) {
    final startOfDay = DateTime(day.year, day.month, day.day);
    final endOfDay = startOfDay.add(const Duration(days: 1)).subtract(const Duration(milliseconds: 1));
    final weekdayIndex = day.weekday.toString();

    final query = select(events).join([
      leftOuterJoin(stops, stops.eventId.equalsExp(events.id)),
    ]);

    query.where(
      (events.repeat.equals(false)&events.startDateTime.isBetweenValues(startOfDay, endOfDay)) |
      (events.repeat.equals(true)&events.startDateTime.isSmallerOrEqualValue(endOfDay)&events.days.cast<String>().like('%$weekdayIndex%'))
    );

    query.orderBy([
      OrderingTerm.asc(events.startDateTime),
      OrderingTerm.asc(stops.orderIndex),
    ]);

    return query.watch().map((rows) {
      final groupedData = <String, EventWithStops>{};

      for (final row in rows) {
        final event = row.readTable(events);
        final stop = row.readTableOrNull(stops);

        final item = groupedData.putIfAbsent(
          event.id, 
          () => EventWithStops(event: event, stops: [])
        );

        if (stop != null) {
          item.stops.add(stop);
        }
      }

      return groupedData.values.toList();
    });
  }
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
