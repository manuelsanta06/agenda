import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart' as drift;
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
  AppDatabase():super(_openConnection());

  @override
  int get schemaVersion=>2;

  @override
  MigrationStrategy get migration{
    return MigrationStrategy(
      onCreate:(Migrator m)async{
        await m.createAll();
      },
      onUpgrade:(Migrator m,int from,int to)async{
        if(from<2){
          await m.addColumn(recorridoShifts, recorridoShifts.isSynced);
        }
      },
      beforeOpen:(details)async{
        await customStatement('PRAGMA foreign_keys=ON');
      },
    );
  }

  Future<void> markAsSynced(Map<String, dynamic> sentPayload) async {
    await transaction(()async{
      //Choferes
      final choferIds = (sentPayload['choferes'] as List)
          .map((e) => e['id'] as String).toList();
      if (choferIds.isNotEmpty) {
        await (update(choferes)..where((t) => t.id.isIn(choferIds)))
            .write(const ChoferesCompanion(isSynced:Value(true)));
      }

      //Colectivos
      final colectivoIds = (sentPayload['colectivos'] as List)
          .map((e) => e['id'] as String).toList();
      if (colectivoIds.isNotEmpty) {
        await (update(colectivos)..where((t) => t.id.isIn(colectivoIds)))
            .write(const ColectivosCompanion(isSynced:Value(true)));
      }

      //Recorridos
      final recorridoIds = (sentPayload['recorridos'] as List)
          .map((e) => e['id'] as String).toList();
      if (recorridoIds.isNotEmpty) {
        await (update(recorridos)..where((t) => t.id.isIn(recorridoIds)))
            .write(const RecorridosCompanion(isSynced:Value(true)));
      }

      //Encargados
      final encargadoIds = (sentPayload['encargados'] as List)
          .map((e) => e['id'] as String).toList();
      if (encargadoIds.isNotEmpty) {
        await (update(encargados)..where((t) => t.id.isIn(encargadoIds)))
            .write(const EncargadosCompanion(isSynced:Value(true)));
      }

      //Events
      final eventIds = (sentPayload['events'] as List)
          .map((e) => e['id'] as String).toList();
      if (eventIds.isNotEmpty) {
        await (update(events)..where((t) => t.id.isIn(eventIds)))
            .write(const EventsCompanion(isSynced:Value(true)));
      }

      //Recorrido Shifts
      final shiftIds = (sentPayload['recorrido_shifts'] as List)
          .map((e) => e['id'] as String).toList();
      if (shiftIds.isNotEmpty) {
        await (update(recorridoShifts)..where((t) => t.id.isIn(shiftIds)))
            .write(const RecorridoShiftsCompanion(isSynced:Value(true)));
      }
    });
  }

  Future<Map<String,dynamic>> getUnsyncedPayload()async{
    final unsyncedChoferes  =await(select(choferes)..where((t)=>t.isSynced.equals(false))).get();
    final unsyncedColectivos=await(select(colectivos)..where((t)=>t.isSynced.equals(false))).get();
    final unsyncedRecorridos=await(select(recorridos)..where((t)=>t.isSynced.equals(false))).get();
    final unsyncedEncargados=await(select(encargados)..where((t)=>t.isSynced.equals(false))).get();
    final unsyncedEvents    =await(select(events)..where((t)=>t.isSynced.equals(false))).get();
    final unsyncedShifts    =await(select(recorridoShifts)..where((t)=>t.isSynced.equals(false))).get();

    //look fordependant tables
    
    //events dependencies
    final eventIds=unsyncedEvents.map((e)=>e.id).toList();
    final eventStops=eventIds.isEmpty?<Stop>[]:
        await (select(stops)..where((t)=>t.eventId.isIn(eventIds))).get();
    final eventChoferesList=eventIds.isEmpty?<EventChofere>[]:
        await (select(eventChoferes)..where((t)=>t.eventId.isIn(eventIds))).get();
    final eventColectivosList=eventIds.isEmpty?<EventColectivo>[]:
        await (select(eventColectivos)..where((t)=>t.eventId.isIn(eventIds))).get();

    //recorridoShifts dependencies
    final shiftIds=unsyncedShifts.map((s)=>s.id).toList();
    final shiftChoferesList=shiftIds.isEmpty?<ShiftChofere>[]:
        await (select(shiftChoferes)..where((t)=>t.shiftId.isIn(shiftIds))).get();
    final shiftColectivosList=shiftIds.isEmpty?<ShiftColectivo>[]:
        await (select(shiftColectivos)..where((t)=>t.shiftId.isIn(shiftIds))).get();

    //rncargados dependencies
    final encargadoIds=unsyncedEncargados.map((e)=>e.id).toList();
    final recSubscriptions=encargadoIds.isEmpty?<RecorridoSubscription>[]:
        await (select(recorridoSubscriptions)..where((t)=>t.encargadoId.isIn(encargadoIds))).get();


    return{
      "choferes": unsyncedChoferes.map((c)=>{
        "id": c.id,
        "dni": c.dni,
        "name": c.name,
        "surname": c.surname,
        "alias": c.alias,
        "mobile_number": c.mobileNumber,
        "picture_path": c.picturePath,
        "balance": c.balance,
        "is_active": c.is_active,
      }).toList(),

      "colectivos": unsyncedColectivos.map((c)=>{
        "id": c.id,
        "plate": c.plate,
        "name": c.name,
        "number": c.number,
        "capacity": c.capacity,
        "fuel_amount": c.fuelAmount,
        "fuel_date": c.fuelDate.toIso8601String(),
        "oil_date": c.oilDate.toIso8601String(),
        "is_active": c.is_active,
      }).toList(),

      "recorridos": unsyncedRecorridos.map((r)=>{
        "id": r.id,
        "name": r.name,
        "base_price": r.basePrice,
        "is_active": r.isActive,
      }).toList(),

      "encargados": unsyncedEncargados.map((e)=>{
        "id": e.id,
        "name": e.name,
        "phone": e.phone,
        "balance": e.balance,
      }).toList(),

      "events": unsyncedEvents.map((e)=>{
        "id": e.id,
        "name": e.name,
        "contact_name": e.contactName,
        "contact": e.contact,
        "repeat": e.repeat,
        "days": const WeekDaysConverter().toSql(e.days??[]), 
        "start_date_time": e.startDateTime.toIso8601String(),
        "end_date_time": e.endDateTime.toIso8601String(),
        "stop_repeating_date_time": e.stopRepeatingDateTime?.toIso8601String(),
        "state": e.state.index,
        "type": e.type.index,
        "is_trip": e.isTrip,
        "recorrido_id": e.recorridoId,
      }).toList(),

      "stops": eventStops.map((s)=>{
        "id": s.id,
        "name": s.name,
        "start": s.start?.toIso8601String(),
        "event_id": s.eventId,
        "order_index": s.orderIndex,
      }).toList(),

      "recorrido_shifts": unsyncedShifts.map((s)=>{
        "id": s.id,
        "recorrido_id": s.recorridoId,
        "week_day": s.weekDay,
        "start_time": s.startTime.toIso8601String(),
        "end_time": s.endTime.toIso8601String(),
        "shift_name": s.shiftName,
        "is_active": s.isActive,
      }).toList(),

      "recorrido_subscriptions": recSubscriptions.map((s)=>{
        "id": s.id,
        "recorrido_id": s.recorridoId,
        "encargado_id": s.encargadoId,
        "subscription_name": s.subscriptionName,
        "address": s.address,
        "custom_price": s.customPrice,
        "is_active": s.isActive,
      }).toList(),

      "event_choferes": eventChoferesList.map((ec)=>{
        "event_id": ec.eventId,
        "chofer_id": ec.choferId,
      }).toList(),

      "event_colectivos": eventColectivosList.map((ec)=>{
        "event_id": ec.eventId,
        "colectivo_id": ec.colectivoId,
      }).toList(),

      "shift_choferes": shiftChoferesList.map((sc)=>{
        "shift_id": sc.shiftId,
        "chofer_id": sc.choferId,
      }).toList(),

      "shift_colectivos": shiftColectivosList.map((sc)=>{
        "shift_id": sc.shiftId,
        "colectivo_id": sc.colectivoId,
      }).toList(),
    };
  }

  Future<void> processCatalogSync(Map<String, dynamic> json) async {
    await transaction(() async {
      //TABLAS PRINCIPALES(Insert or Replace)
      //CHOFERES
      final choferesList = json['choferes'] as List<dynamic>? ?? [];
      for(var c in choferesList){
        await into(choferes).insert(
          ChoferesCompanion(
            id: drift.Value(c['id']),
            dni: drift.Value(c['dni']),
            name: drift.Value(c['name']),
            surname: drift.Value(c['surname']),
            alias: drift.Value(c['alias']),
            mobileNumber: drift.Value(c['mobile_number']),
            picturePath: drift.Value(c['picture_path']),
            balance: drift.Value((c['balance'] as num?)?.toDouble() ?? 0.0),
            is_active: drift.Value(c['is_active'] ?? true),
            isSynced: const drift.Value(true),
          ),
          mode: drift.InsertMode.insertOrReplace,
        );
      }

      //COLECTIVOS
      final colectivosList = json['colectivos'] as List<dynamic>? ?? [];
      for(var c in colectivosList) {
        await into(colectivos).insert(
          ColectivosCompanion(
            id: drift.Value(c['id']),
            plate: drift.Value(c['plate']),
            name: drift.Value(c['name']),
            number: drift.Value(c['number']),
            capacity: drift.Value(c['capacity'] ?? 0),
            fuelAmount: drift.Value(c['fuel_amount'] ?? ''),
            fuelDate: drift.Value(DateTime.parse(c['fuel_date'])),
            oilDate: drift.Value(DateTime.parse(c['oil_date'])),
            is_active: drift.Value(c['is_active'] ?? true),
            isSynced: const drift.Value(true),
          ),
          mode: drift.InsertMode.insertOrReplace,
        );
      }

      //RECORRIDOS
      final recorridosList = json['recorridos'] as List<dynamic>? ?? [];
      for(var r in recorridosList) {
        await into(recorridos).insert(
          RecorridosCompanion(
            id: drift.Value(r['id']),
            name: drift.Value(r['name']),
            basePrice: drift.Value(r['base_price'] ?? 0),
            isActive: drift.Value(r['is_active'] ?? true),
            isSynced: const drift.Value(true),
          ),
          mode: drift.InsertMode.insertOrReplace,
        );
      }

      //ENCARGADOS
      final encargadosList = json['encargados'] as List<dynamic>? ?? [];
      final List<String> updatedEncargadoIds = [];
      
      for(var e in encargadosList) {
        updatedEncargadoIds.add(e['id']);
        await into(encargados).insert(
          EncargadosCompanion(
            id: drift.Value(e['id']),
            name: drift.Value(e['name']),
            phone: drift.Value(e['phone']),
            balance: drift.Value((e['balance'] as num?)?.toDouble() ?? 0.0),
            isSynced: const drift.Value(true),
          ),
          mode: drift.InsertMode.insertOrReplace,
        );
      }

      //RECORRIDO SHIFTS
      final shiftsList = json['recorrido_shifts'] as List<dynamic>? ?? [];
      final List<String> updatedShiftIds = [];

      for(var s in shiftsList) {
        updatedShiftIds.add(s['id']);
        await into(recorridoShifts).insert(
          RecorridoShiftsCompanion(
            id: drift.Value(s['id']),
            recorridoId: drift.Value(s['recorrido_id']),
            weekDay: drift.Value(const WeekDaysConverter().fromSql(s['week_day'])), 
            startTime: drift.Value(DateTime.parse(s['start_time'])),
            endTime: drift.Value(DateTime.parse(s['end_time'])),
            shiftName: drift.Value(s['shift_name']),
            isActive: drift.Value(s['is_active'] ?? true),
            isSynced: const drift.Value(true),
          ),
          mode: drift.InsertMode.insertOrReplace,
        );
      }

      //TABLAS INTERMEDIAS/DEPENDIENTES

      //RECORRIDO SUBSCRIPTIONS (Dependen de Encargados)
      if (updatedEncargadoIds.isNotEmpty) {
        //nuke
        await (delete(recorridoSubscriptions)..where((t) => t.encargadoId.isIn(updatedEncargadoIds))).go();
        
        final subsList = json['recorrido_subscriptions'] as List<dynamic>? ?? [];
        for(var sub in subsList) {
          await into(recorridoSubscriptions).insert(
            RecorridoSubscriptionsCompanion(
              id: drift.Value(sub['id']),
              recorridoId: drift.Value(sub['recorrido_id']),
              encargadoId: drift.Value(sub['encargado_id']),
              subscriptionName: drift.Value(sub['subscription_name']),
              address: drift.Value(sub['address']),
              customPrice: drift.Value(sub['custom_price']),
              isActive: drift.Value(sub['is_active'] ?? true),
            ),
            mode: drift.InsertMode.insertOrReplace,
          );
        }
      }

      //SHIFT CHOFERES & COLECTIVOS(Dependen de Recorrido Shifts)
      if (updatedShiftIds.isNotEmpty) {
        //nuke
        await (delete(shiftChoferes)..where((t) => t.shiftId.isIn(updatedShiftIds))).go();
        await (delete(shiftColectivos)..where((t) => t.shiftId.isIn(updatedShiftIds))).go();

        //Choferes
        final shiftChoferesList = json['shift_choferes'] as List<dynamic>? ?? [];
        for(var sc in shiftChoferesList) {
          await into(shiftChoferes).insert(
            ShiftChoferesCompanion(
              shiftId: drift.Value(sc['shift_id']),
              choferId: drift.Value(sc['chofer_id']),
            ),
            mode: drift.InsertMode.insertOrReplace,
          );
        }

        //Colectivos
        final shiftColectivosList = json['shift_colectivos'] as List<dynamic>? ?? [];
        for(var sc in shiftColectivosList) {
          await into(shiftColectivos).insert(
            ShiftColectivosCompanion(
              shiftId: drift.Value(sc['shift_id']),
              colectivoId: drift.Value(sc['colectivo_id']),
            ),
            mode: drift.InsertMode.insertOrReplace,
          );
        }
      }
    });
  }

  Future<void> processEventsSync(Map<String, dynamic> json) async {
    await transaction(()async{
      final eventsList = json['events'] as List<dynamic>? ?? [];
      final List<String> updatedEventIds = [];

      for (var e in eventsList) {
        updatedEventIds.add(e['id']);

        await into(events).insert(
          EventsCompanion(
            id: drift.Value(e['id']),
            name: drift.Value(e['name']),
            contactName: drift.Value(e['contact_name']),
            contact: drift.Value(e['contact']),
            repeat: drift.Value(e['repeat'] ?? false),
            days: drift.Value(const WeekDaysConverter().fromSql(e['days']??'')),
            startDateTime: drift.Value(DateTime.parse(e['start_date_time'])),
            endDateTime: drift.Value(DateTime.parse(e['end_date_time'])),
            stopRepeatingDateTime: drift.Value(e['stop_repeating_date_time'] != null 
                ? DateTime.parse(e['stop_repeating_date_time']) 
                : null),
            state: drift.Value(EventStates.values[e['state']]), 
            type: drift.Value(EventTypes.values[e['type']]),    
            isTrip: drift.Value(e['is_trip'] ?? false),
            recorridoId: drift.Value(e['recorrido_id']),
            isSynced: const drift.Value(true),
          ),
          mode: drift.InsertMode.insertOrReplace,
        );
      }

      if (updatedEventIds.isNotEmpty) {
        //nuke
        await (delete(stops)..where((t) => t.eventId.isIn(updatedEventIds))).go();
        await (delete(eventChoferes)..where((t) => t.eventId.isIn(updatedEventIds))).go();
        await (delete(eventColectivos)..where((t) => t.eventId.isIn(updatedEventIds))).go();

        //pave
        
        // Paradas (Stops)
        final stopsList = json['stops'] as List<dynamic>? ?? [];
        for (var s in stopsList) {
          await into(stops).insert(
            StopsCompanion(
              id: drift.Value(s['id']),
              name: drift.Value(s['name']),
              start: drift.Value(s['start'] != null ? DateTime.parse(s['start']) : null),
              eventId: drift.Value(s['event_id']),
              orderIndex: drift.Value(s['order_index']),
            ),
            mode: drift.InsertMode.insertOrReplace,
          );
        }

        // Event Choferes
        final eventChoferesList = json['event_choferes'] as List<dynamic>? ?? [];
        for (var ec in eventChoferesList) {
          await into(eventChoferes).insert(
            EventChoferesCompanion(
              eventId: drift.Value(ec['event_id']),
              choferId: drift.Value(ec['chofer_id']),
            ),
            mode: drift.InsertMode.insertOrReplace,
          );
        }

        // Event Colectivos
        final eventColectivosList = json['event_colectivos'] as List<dynamic>? ?? [];
        for (var ec in eventColectivosList) {
          await into(eventColectivos).insert(
            EventColectivosCompanion(
              eventId: drift.Value(ec['event_id']),
              colectivoId: drift.Value(ec['colectivo_id']),
            ),
            mode: drift.InsertMode.insertOrReplace,
          );
        }
      }
    });
  }

  Future<List<(Colectivo, bool)>> getColectivosWithAvailability(
    DateTime start, 
    DateTime end, 
    String? excludedEventId,
    {String? onlyForEventId}
  )async{
    final busyQuery=select(eventColectivos).join([
      innerJoin(events, events.id.equalsExp(eventColectivos.eventId))
    ]);
    busyQuery.where(
      events.startDateTime.isSmallerThanValue(end) &
      events.endDateTime.isBiggerThanValue(start) &
      (excludedEventId != null?events.id.equals(excludedEventId).not():const Constant(true))
    );
    final busyIds=await busyQuery
        .map((row)=>row.readTable(eventColectivos).colectivoId)
        .get();
    final busySet=busyIds.toSet();

    List<Colectivo> targetColectivos;

    if (onlyForEventId != null) {
      final query=select(colectivos).join([
        innerJoin(eventColectivos, eventColectivos.colectivoId.equalsExp(colectivos.id))
      ]);
      query.where(eventColectivos.eventId.equals(onlyForEventId));
      targetColectivos=await query.map((row)=>row.readTable(colectivos)).get();
    } else {
      targetColectivos=await (select(colectivos)
        ..where((u)=>u.is_active.equals(true))
        ..orderBy([(t)=>OrderingTerm(expression: ((t.name.toString()).isEmpty)?t.plate:t.name)])
      ).get();
    }

    final List<(Colectivo, bool)> result=targetColectivos.map((c) {
      return (c, busySet.contains(c.id));
    }).toList();

    result.sort((a, b) {
      if (a.$2 == b.$2) return 0;
      return a.$2?1:-1;
    });
    
    return result;
  }
  Stream<List<(Colectivo, bool)>> watchColectivosAvailability(
    DateTime start, 
    DateTime end, 
    String? excludedEventId,
    {String? onlyForEventId}) {
    final triggerQuery=select(eventColectivos).join([
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
  
    final busyQuery=select(eventChoferes).join([
      innerJoin(events, events.id.equalsExp(eventChoferes.eventId))
    ]);
    busyQuery.where(
      events.startDateTime.isSmallerThanValue(end) &
      events.endDateTime.isBiggerThanValue(start) &
      (excludedEventId != null?events.id.equals(excludedEventId).not():const Constant(true))
    );
    final busyIds=await busyQuery
        .map((row)=>row.readTable(eventChoferes).choferId)
        .get();
    final busySet=busyIds.toSet();

    List<Chofere> targetChoferes;

    if (onlyForEventId != null) {
      final query=select(choferes).join([
        innerJoin(eventChoferes, eventChoferes.choferId.equalsExp(choferes.id))
      ]);
      query.where(eventChoferes.eventId.equals(onlyForEventId));
      targetChoferes=await query.map((row)=>row.readTable(choferes)).get();
    } else {
      targetChoferes=await (select(choferes)
        ..where((u)=>u.is_active.equals(true))
        ..orderBy([(t)=>OrderingTerm(expression: ((t.alias.toString()).isEmpty)?t.name:t.alias)])
      ).get();
    }

    final List<(Chofere, bool)> result=targetChoferes.map((c) {
      return (c, busySet.contains(c.id));
    }).toList();

    //sorting
    result.sort((a, b) {
      if (a.$2 == b.$2) return 0;
      return a.$2?1:-1;
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
    final startOfDay=DateTime(day.year, day.month, day.day);
    final endOfDay=startOfDay.add(const Duration(days: 1)).subtract(const Duration(milliseconds: 1));
    final weekdayIndex=day.weekday.toString();

    final query=select(events).join([
      leftOuterJoin(stops, stops.eventId.equalsExp(events.id)),
    ]);

    query.where(
      (school?events.type.equalsValue(EventTypes.SCHOOL):events.type.equalsValue(EventTypes.SCHOOL).not())&
      (events.state.equalsValue(EventStates.REMOVED).not())&
      (events.repeat.equals(false)&events.startDateTime.isBetweenValues(startOfDay, endOfDay)) |
      (events.repeat.equals(true)&events.startDateTime.isSmallerOrEqualValue(endOfDay)&events.days.cast<String>().like('%$weekdayIndex%'))
    );

    query.orderBy([
      OrderingTerm.asc(events.startDateTime),
      OrderingTerm.asc(stops.orderIndex),
    ]);

    return query.watch().map((rows) {
      final groupedData=<String, EventWithStops>{};

      for(final row in rows) {
        final event=row.readTable(events);
        final stop=row.readTableOrNull(stops);

        final item=groupedData.putIfAbsent(
          event.id, 
          ()=>EventWithStops(event: event, stops: [])
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
    //looks forthe place to put the files
    final dbFolder=await getApplicationDocumentsDirectory();
    //Names the file
    final file=File(p.join(dbFolder.path, 'mi_base_de_datos.sqlite'));
    
    //starts the database
    return NativeDatabase.createInBackground(file);
  });
}
