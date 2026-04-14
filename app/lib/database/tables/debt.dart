import 'package:drift/drift.dart';
import 'recorridos.dart';
import 'users.dart';

class Debts extends Table{
  TextColumn get id=>text()();
  // Nullable references to handle polymorphism
  TextColumn get passengerId=>text().nullable().references(Passengers,#id,onDelete:KeyAction.cascade)();
  TextColumn get choferId=>text().nullable().references(Choferes,#id,onDelete:KeyAction.cascade)();
  
  DateTimeColumn get date=>dateTime()();
  TextColumn get description=>text().nullable()();
  IntColumn get totalAmount=>integer()();
  IntColumn get paidAmount=>integer().withDefault(const Constant(0))();
  BoolColumn get isSettled=>boolean().withDefault(const Constant(false))();
  BoolColumn get isSynced=>boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey=>{id};

  @override
  List<String> get customConstraints=>[
    'CHECK ((passenger_id IS NULL)!=(chofer_id IS NULL))'
  ];
}

