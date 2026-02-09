import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables/users.dart';
import 'tables/events.dart';
import 'tables/recorridos.dart';

export 'tables/events.dart';

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
  EventColectivos,
  Recorridos,
  RecorridoShifts,
  ShiftChoferes,
  ShiftColectivos,
  Encargados,
  RecorridoSubscriptions
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<(Colectivo, bool)>> getColectivosWithAvailability(
    DateTime start, 
    DateTime end, 
    String? excludedEventId,
    {String? onlyForEventId}
  )async{
    final busyQuery = select(eventColectivos).join([
      innerJoin(events, events.id.equalsExp(eventColectivos.eventId))
    ]);
    busyQuery.where(
      events.startDateTime.isSmallerThanValue(end) &
      events.endDateTime.isBiggerThanValue(start) &
      (excludedEventId != null ? events.id.equals(excludedEventId).not() : const Constant(true))
    );
    final busyIds = await busyQuery
        .map((row) => row.readTable(eventColectivos).colectivoId)
        .get();
    final busySet = busyIds.toSet();

    List<Colectivo> targetColectivos;

    if (onlyForEventId != null) {
      final query = select(colectivos).join([
        innerJoin(eventColectivos, eventColectivos.colectivoId.equalsExp(colectivos.id))
      ]);
      query.where(eventColectivos.eventId.equals(onlyForEventId));
      targetColectivos = await query.map((row) => row.readTable(colectivos)).get();
    } else {
      targetColectivos = await (select(colectivos)
        ..where((u) => u.is_active.equals(true))
        ..orderBy([(t) => OrderingTerm(expression: ((t.name.toString()).isEmpty) ? t.plate : t.name)])
      ).get();
    }

    final List<(Colectivo, bool)> result = targetColectivos.map((c) {
      return (c, busySet.contains(c.id));
    }).toList();

    result.sort((a, b) {
      if (a.$2 == b.$2) return 0;
      return a.$2 ? 1 : -1;
    });
    
    return result;
  }
  Stream<List<(Colectivo, bool)>> watchColectivosAvailability(
    DateTime start, 
    DateTime end, 
    String? excludedEventId,
    {String? onlyForEventId}) {
    final triggerQuery = select(eventColectivos).join([
      innerJoin(events, events.id.equalsExp(eventColectivos.eventId)),
      innerJoin(colectivos, colectivos.id.equalsExp(eventColectivos.colectivoId))
    ]);
    return triggerQuery.watch().asyncMap((_) async {
      return await getColectivosWithAvailability(
        start,end,excludedEventId,onlyForEventId:onlyForEventId
      );
    });
  }

  Future<List<(Chofere, bool)>> getChoferesWithAvailability(
    DateTime start, DateTime end, String? excludedEventId,{String? onlyForEventId}) async {
  
    final busyQuery = select(eventChoferes).join([
      innerJoin(events, events.id.equalsExp(eventChoferes.eventId))
    ]);
    busyQuery.where(
      events.startDateTime.isSmallerThanValue(end) &
      events.endDateTime.isBiggerThanValue(start) &
      (excludedEventId != null ? events.id.equals(excludedEventId).not() : const Constant(true))
    );
    final busyIds = await busyQuery
        .map((row) => row.readTable(eventChoferes).choferId)
        .get();
    final busySet = busyIds.toSet();

    List<Chofere> targetChoferes;

    if (onlyForEventId != null) {
      final query = select(choferes).join([
        innerJoin(eventChoferes, eventChoferes.choferId.equalsExp(choferes.id))
      ]);
      query.where(eventChoferes.eventId.equals(onlyForEventId));
      targetChoferes = await query.map((row) => row.readTable(choferes)).get();
    } else {
      targetChoferes = await (select(choferes)
        ..where((u) => u.is_active.equals(true))
        ..orderBy([(t) => OrderingTerm(expression: ((t.alias.toString()).isEmpty)?t.name:t.alias)])
      ).get();
    }

    final List<(Chofere, bool)> result = targetChoferes.map((c) {
      return (c, busySet.contains(c.id));
    }).toList();

    //sorting
    result.sort((a, b) {
      if (a.$2 == b.$2) return 0;
      return a.$2 ? 1 : -1;
    });
    return result;
  }
  Stream<List<(Chofere, bool)>> watchChoferesAvailability(
    DateTime start, 
    DateTime end, 
    String? excludedEventId, 
    {String? onlyForEventId}) {
    final triggerQuery=select(eventChoferes).join([
      innerJoin(events,events.id.equalsExp(eventChoferes.eventId)),
      innerJoin(choferes,choferes.id.equalsExp(eventChoferes.choferId))
    ]);
    return triggerQuery.watch().asyncMap((_)async{
      return await getChoferesWithAvailability(
        start,end,excludedEventId,onlyForEventId:onlyForEventId
      );
    });
  }

  Stream<List<EventWithStops>> watchEventsWithStops(DateTime day,bool school) {
    final startOfDay = DateTime(day.year, day.month, day.day);
    final endOfDay = startOfDay.add(const Duration(days: 1)).subtract(const Duration(milliseconds: 1));
    final weekdayIndex = day.weekday.toString();

    final query = select(events).join([
      leftOuterJoin(stops, stops.eventId.equalsExp(events.id)),
    ]);

    query.where(
      (school?events.type.equalsValue(EventTypes.SCHOOL):events.type.equalsValue(EventTypes.SCHOOL).not())&
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
