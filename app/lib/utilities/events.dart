import 'package:agenda/database/app_database.dart';
import 'package:drift/drift.dart' as drift; 

Future<EventStates> getEventCompletitionState(AppDatabase db,Event eve)async{
  final colectivosCount = await (db.select(db.eventColectivos)
    ..where((tbl) => tbl.eventId.equals(eve.id))
  ).get().then((list) => list.length);

  final choferesCount = await (db.select(db.eventChoferes)
    ..where((tbl) => tbl.eventId.equals(eve.id))
  ).get().then((list) => list.length);
  return colectivosCount==0||choferesCount==0||choferesCount!=colectivosCount?
    EventStates.INCOMPLETE:
    EventStates.NONE;
}
EventStates getEventDateState(AppDatabase db,Event eve){
  if(eve.endDateTime==null)return EventStates.NONE;
  final now=DateTime.now();
  if(now.isAfter(eve.endDateTime))return EventStates.DONE;
  if(now.isAfter(eve.startDateTime)&&now.isBefore(eve.endDateTime))return EventStates.HAPPENING;
  return EventStates.PENDING;
}

Future<void> updateFullEventState(AppDatabase db,Event eve)async{
  EventStates newState=await getEventCompletitionState(db,eve);
  if(newState==EventStates.NONE)newState=getEventDateState(db,eve);

  await (db.update(db.events)
    ..where((tbl) => tbl.id.equals(eve.id))
  ).write(EventsCompanion(
    state: drift.Value(newState),
    isSynced: const drift.Value(false),
  ));
}
