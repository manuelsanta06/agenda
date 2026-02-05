// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ChoferesTable extends Choferes with TableInfo<$ChoferesTable, Chofere> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChoferesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dniMeta = const VerificationMeta('dni');
  @override
  late final GeneratedColumn<String> dni = GeneratedColumn<String>(
    'dni',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _surnameMeta = const VerificationMeta(
    'surname',
  );
  @override
  late final GeneratedColumn<String> surname = GeneratedColumn<String>(
    'surname',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _aliasMeta = const VerificationMeta('alias');
  @override
  late final GeneratedColumn<String> alias = GeneratedColumn<String>(
    'alias',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _mobileNumberMeta = const VerificationMeta(
    'mobileNumber',
  );
  @override
  late final GeneratedColumn<String> mobileNumber = GeneratedColumn<String>(
    'mobile_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _picturePathMeta = const VerificationMeta(
    'picturePath',
  );
  @override
  late final GeneratedColumn<String> picturePath = GeneratedColumn<String>(
    'picture_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _balanceMeta = const VerificationMeta(
    'balance',
  );
  @override
  late final GeneratedColumn<double> balance = GeneratedColumn<double>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _is_activeMeta = const VerificationMeta(
    'is_active',
  );
  @override
  late final GeneratedColumn<bool> is_active = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dni,
    name,
    surname,
    alias,
    mobileNumber,
    picturePath,
    balance,
    is_active,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'choferes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Chofere> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('dni')) {
      context.handle(
        _dniMeta,
        dni.isAcceptableOrUnknown(data['dni']!, _dniMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('surname')) {
      context.handle(
        _surnameMeta,
        surname.isAcceptableOrUnknown(data['surname']!, _surnameMeta),
      );
    }
    if (data.containsKey('alias')) {
      context.handle(
        _aliasMeta,
        alias.isAcceptableOrUnknown(data['alias']!, _aliasMeta),
      );
    }
    if (data.containsKey('mobile_number')) {
      context.handle(
        _mobileNumberMeta,
        mobileNumber.isAcceptableOrUnknown(
          data['mobile_number']!,
          _mobileNumberMeta,
        ),
      );
    }
    if (data.containsKey('picture_path')) {
      context.handle(
        _picturePathMeta,
        picturePath.isAcceptableOrUnknown(
          data['picture_path']!,
          _picturePathMeta,
        ),
      );
    }
    if (data.containsKey('balance')) {
      context.handle(
        _balanceMeta,
        balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _is_activeMeta,
        is_active.isAcceptableOrUnknown(data['is_active']!, _is_activeMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Chofere map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Chofere(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      dni: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dni'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      surname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}surname'],
      ),
      alias: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}alias'],
      ),
      mobileNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mobile_number'],
      ),
      picturePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}picture_path'],
      ),
      balance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}balance'],
      )!,
      is_active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $ChoferesTable createAlias(String alias) {
    return $ChoferesTable(attachedDatabase, alias);
  }
}

class Chofere extends DataClass implements Insertable<Chofere> {
  final String id;
  final String? dni;
  final String? name;
  final String? surname;
  final String? alias;
  final String? mobileNumber;
  final String? picturePath;
  final double balance;
  final bool is_active;
  final bool isSynced;
  const Chofere({
    required this.id,
    this.dni,
    this.name,
    this.surname,
    this.alias,
    this.mobileNumber,
    this.picturePath,
    required this.balance,
    required this.is_active,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || dni != null) {
      map['dni'] = Variable<String>(dni);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || surname != null) {
      map['surname'] = Variable<String>(surname);
    }
    if (!nullToAbsent || alias != null) {
      map['alias'] = Variable<String>(alias);
    }
    if (!nullToAbsent || mobileNumber != null) {
      map['mobile_number'] = Variable<String>(mobileNumber);
    }
    if (!nullToAbsent || picturePath != null) {
      map['picture_path'] = Variable<String>(picturePath);
    }
    map['balance'] = Variable<double>(balance);
    map['is_active'] = Variable<bool>(is_active);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  ChoferesCompanion toCompanion(bool nullToAbsent) {
    return ChoferesCompanion(
      id: Value(id),
      dni: dni == null && nullToAbsent ? const Value.absent() : Value(dni),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      surname: surname == null && nullToAbsent
          ? const Value.absent()
          : Value(surname),
      alias: alias == null && nullToAbsent
          ? const Value.absent()
          : Value(alias),
      mobileNumber: mobileNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(mobileNumber),
      picturePath: picturePath == null && nullToAbsent
          ? const Value.absent()
          : Value(picturePath),
      balance: Value(balance),
      is_active: Value(is_active),
      isSynced: Value(isSynced),
    );
  }

  factory Chofere.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chofere(
      id: serializer.fromJson<String>(json['id']),
      dni: serializer.fromJson<String?>(json['dni']),
      name: serializer.fromJson<String?>(json['name']),
      surname: serializer.fromJson<String?>(json['surname']),
      alias: serializer.fromJson<String?>(json['alias']),
      mobileNumber: serializer.fromJson<String?>(json['mobileNumber']),
      picturePath: serializer.fromJson<String?>(json['picturePath']),
      balance: serializer.fromJson<double>(json['balance']),
      is_active: serializer.fromJson<bool>(json['is_active']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'dni': serializer.toJson<String?>(dni),
      'name': serializer.toJson<String?>(name),
      'surname': serializer.toJson<String?>(surname),
      'alias': serializer.toJson<String?>(alias),
      'mobileNumber': serializer.toJson<String?>(mobileNumber),
      'picturePath': serializer.toJson<String?>(picturePath),
      'balance': serializer.toJson<double>(balance),
      'is_active': serializer.toJson<bool>(is_active),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Chofere copyWith({
    String? id,
    Value<String?> dni = const Value.absent(),
    Value<String?> name = const Value.absent(),
    Value<String?> surname = const Value.absent(),
    Value<String?> alias = const Value.absent(),
    Value<String?> mobileNumber = const Value.absent(),
    Value<String?> picturePath = const Value.absent(),
    double? balance,
    bool? is_active,
    bool? isSynced,
  }) => Chofere(
    id: id ?? this.id,
    dni: dni.present ? dni.value : this.dni,
    name: name.present ? name.value : this.name,
    surname: surname.present ? surname.value : this.surname,
    alias: alias.present ? alias.value : this.alias,
    mobileNumber: mobileNumber.present ? mobileNumber.value : this.mobileNumber,
    picturePath: picturePath.present ? picturePath.value : this.picturePath,
    balance: balance ?? this.balance,
    is_active: is_active ?? this.is_active,
    isSynced: isSynced ?? this.isSynced,
  );
  Chofere copyWithCompanion(ChoferesCompanion data) {
    return Chofere(
      id: data.id.present ? data.id.value : this.id,
      dni: data.dni.present ? data.dni.value : this.dni,
      name: data.name.present ? data.name.value : this.name,
      surname: data.surname.present ? data.surname.value : this.surname,
      alias: data.alias.present ? data.alias.value : this.alias,
      mobileNumber: data.mobileNumber.present
          ? data.mobileNumber.value
          : this.mobileNumber,
      picturePath: data.picturePath.present
          ? data.picturePath.value
          : this.picturePath,
      balance: data.balance.present ? data.balance.value : this.balance,
      is_active: data.is_active.present ? data.is_active.value : this.is_active,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Chofere(')
          ..write('id: $id, ')
          ..write('dni: $dni, ')
          ..write('name: $name, ')
          ..write('surname: $surname, ')
          ..write('alias: $alias, ')
          ..write('mobileNumber: $mobileNumber, ')
          ..write('picturePath: $picturePath, ')
          ..write('balance: $balance, ')
          ..write('is_active: $is_active, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dni,
    name,
    surname,
    alias,
    mobileNumber,
    picturePath,
    balance,
    is_active,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chofere &&
          other.id == this.id &&
          other.dni == this.dni &&
          other.name == this.name &&
          other.surname == this.surname &&
          other.alias == this.alias &&
          other.mobileNumber == this.mobileNumber &&
          other.picturePath == this.picturePath &&
          other.balance == this.balance &&
          other.is_active == this.is_active &&
          other.isSynced == this.isSynced);
}

class ChoferesCompanion extends UpdateCompanion<Chofere> {
  final Value<String> id;
  final Value<String?> dni;
  final Value<String?> name;
  final Value<String?> surname;
  final Value<String?> alias;
  final Value<String?> mobileNumber;
  final Value<String?> picturePath;
  final Value<double> balance;
  final Value<bool> is_active;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const ChoferesCompanion({
    this.id = const Value.absent(),
    this.dni = const Value.absent(),
    this.name = const Value.absent(),
    this.surname = const Value.absent(),
    this.alias = const Value.absent(),
    this.mobileNumber = const Value.absent(),
    this.picturePath = const Value.absent(),
    this.balance = const Value.absent(),
    this.is_active = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChoferesCompanion.insert({
    required String id,
    this.dni = const Value.absent(),
    this.name = const Value.absent(),
    this.surname = const Value.absent(),
    this.alias = const Value.absent(),
    this.mobileNumber = const Value.absent(),
    this.picturePath = const Value.absent(),
    this.balance = const Value.absent(),
    this.is_active = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<Chofere> custom({
    Expression<String>? id,
    Expression<String>? dni,
    Expression<String>? name,
    Expression<String>? surname,
    Expression<String>? alias,
    Expression<String>? mobileNumber,
    Expression<String>? picturePath,
    Expression<double>? balance,
    Expression<bool>? is_active,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dni != null) 'dni': dni,
      if (name != null) 'name': name,
      if (surname != null) 'surname': surname,
      if (alias != null) 'alias': alias,
      if (mobileNumber != null) 'mobile_number': mobileNumber,
      if (picturePath != null) 'picture_path': picturePath,
      if (balance != null) 'balance': balance,
      if (is_active != null) 'is_active': is_active,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChoferesCompanion copyWith({
    Value<String>? id,
    Value<String?>? dni,
    Value<String?>? name,
    Value<String?>? surname,
    Value<String?>? alias,
    Value<String?>? mobileNumber,
    Value<String?>? picturePath,
    Value<double>? balance,
    Value<bool>? is_active,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return ChoferesCompanion(
      id: id ?? this.id,
      dni: dni ?? this.dni,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      alias: alias ?? this.alias,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      picturePath: picturePath ?? this.picturePath,
      balance: balance ?? this.balance,
      is_active: is_active ?? this.is_active,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (dni.present) {
      map['dni'] = Variable<String>(dni.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (surname.present) {
      map['surname'] = Variable<String>(surname.value);
    }
    if (alias.present) {
      map['alias'] = Variable<String>(alias.value);
    }
    if (mobileNumber.present) {
      map['mobile_number'] = Variable<String>(mobileNumber.value);
    }
    if (picturePath.present) {
      map['picture_path'] = Variable<String>(picturePath.value);
    }
    if (balance.present) {
      map['balance'] = Variable<double>(balance.value);
    }
    if (is_active.present) {
      map['is_active'] = Variable<bool>(is_active.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChoferesCompanion(')
          ..write('id: $id, ')
          ..write('dni: $dni, ')
          ..write('name: $name, ')
          ..write('surname: $surname, ')
          ..write('alias: $alias, ')
          ..write('mobileNumber: $mobileNumber, ')
          ..write('picturePath: $picturePath, ')
          ..write('balance: $balance, ')
          ..write('is_active: $is_active, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ColectivosTable extends Colectivos
    with TableInfo<$ColectivosTable, Colectivo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ColectivosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _plateMeta = const VerificationMeta('plate');
  @override
  late final GeneratedColumn<String> plate = GeneratedColumn<String>(
    'plate',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
    'number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _capacityMeta = const VerificationMeta(
    'capacity',
  );
  @override
  late final GeneratedColumn<int> capacity = GeneratedColumn<int>(
    'capacity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _fuelAmountMeta = const VerificationMeta(
    'fuelAmount',
  );
  @override
  late final GeneratedColumn<String> fuelAmount = GeneratedColumn<String>(
    'fuel_amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fuelDateMeta = const VerificationMeta(
    'fuelDate',
  );
  @override
  late final GeneratedColumn<DateTime> fuelDate = GeneratedColumn<DateTime>(
    'fuel_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _oilDateMeta = const VerificationMeta(
    'oilDate',
  );
  @override
  late final GeneratedColumn<DateTime> oilDate = GeneratedColumn<DateTime>(
    'oil_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _is_activeMeta = const VerificationMeta(
    'is_active',
  );
  @override
  late final GeneratedColumn<bool> is_active = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    plate,
    name,
    number,
    capacity,
    fuelAmount,
    fuelDate,
    oilDate,
    is_active,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'colectivos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Colectivo> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('plate')) {
      context.handle(
        _plateMeta,
        plate.isAcceptableOrUnknown(data['plate']!, _plateMeta),
      );
    } else if (isInserting) {
      context.missing(_plateMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    }
    if (data.containsKey('capacity')) {
      context.handle(
        _capacityMeta,
        capacity.isAcceptableOrUnknown(data['capacity']!, _capacityMeta),
      );
    }
    if (data.containsKey('fuel_amount')) {
      context.handle(
        _fuelAmountMeta,
        fuelAmount.isAcceptableOrUnknown(data['fuel_amount']!, _fuelAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_fuelAmountMeta);
    }
    if (data.containsKey('fuel_date')) {
      context.handle(
        _fuelDateMeta,
        fuelDate.isAcceptableOrUnknown(data['fuel_date']!, _fuelDateMeta),
      );
    } else if (isInserting) {
      context.missing(_fuelDateMeta);
    }
    if (data.containsKey('oil_date')) {
      context.handle(
        _oilDateMeta,
        oilDate.isAcceptableOrUnknown(data['oil_date']!, _oilDateMeta),
      );
    } else if (isInserting) {
      context.missing(_oilDateMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _is_activeMeta,
        is_active.isAcceptableOrUnknown(data['is_active']!, _is_activeMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Colectivo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Colectivo(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      plate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}plate'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      ),
      capacity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}capacity'],
      )!,
      fuelAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fuel_amount'],
      )!,
      fuelDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fuel_date'],
      )!,
      oilDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}oil_date'],
      )!,
      is_active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $ColectivosTable createAlias(String alias) {
    return $ColectivosTable(attachedDatabase, alias);
  }
}

class Colectivo extends DataClass implements Insertable<Colectivo> {
  final String id;
  final String plate;
  final String? name;
  final int? number;
  final int capacity;
  final String fuelAmount;
  final DateTime fuelDate;
  final DateTime oilDate;
  final bool is_active;
  final bool isSynced;
  const Colectivo({
    required this.id,
    required this.plate,
    this.name,
    this.number,
    required this.capacity,
    required this.fuelAmount,
    required this.fuelDate,
    required this.oilDate,
    required this.is_active,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['plate'] = Variable<String>(plate);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<int>(number);
    }
    map['capacity'] = Variable<int>(capacity);
    map['fuel_amount'] = Variable<String>(fuelAmount);
    map['fuel_date'] = Variable<DateTime>(fuelDate);
    map['oil_date'] = Variable<DateTime>(oilDate);
    map['is_active'] = Variable<bool>(is_active);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  ColectivosCompanion toCompanion(bool nullToAbsent) {
    return ColectivosCompanion(
      id: Value(id),
      plate: Value(plate),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      number: number == null && nullToAbsent
          ? const Value.absent()
          : Value(number),
      capacity: Value(capacity),
      fuelAmount: Value(fuelAmount),
      fuelDate: Value(fuelDate),
      oilDate: Value(oilDate),
      is_active: Value(is_active),
      isSynced: Value(isSynced),
    );
  }

  factory Colectivo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Colectivo(
      id: serializer.fromJson<String>(json['id']),
      plate: serializer.fromJson<String>(json['plate']),
      name: serializer.fromJson<String?>(json['name']),
      number: serializer.fromJson<int?>(json['number']),
      capacity: serializer.fromJson<int>(json['capacity']),
      fuelAmount: serializer.fromJson<String>(json['fuelAmount']),
      fuelDate: serializer.fromJson<DateTime>(json['fuelDate']),
      oilDate: serializer.fromJson<DateTime>(json['oilDate']),
      is_active: serializer.fromJson<bool>(json['is_active']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'plate': serializer.toJson<String>(plate),
      'name': serializer.toJson<String?>(name),
      'number': serializer.toJson<int?>(number),
      'capacity': serializer.toJson<int>(capacity),
      'fuelAmount': serializer.toJson<String>(fuelAmount),
      'fuelDate': serializer.toJson<DateTime>(fuelDate),
      'oilDate': serializer.toJson<DateTime>(oilDate),
      'is_active': serializer.toJson<bool>(is_active),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Colectivo copyWith({
    String? id,
    String? plate,
    Value<String?> name = const Value.absent(),
    Value<int?> number = const Value.absent(),
    int? capacity,
    String? fuelAmount,
    DateTime? fuelDate,
    DateTime? oilDate,
    bool? is_active,
    bool? isSynced,
  }) => Colectivo(
    id: id ?? this.id,
    plate: plate ?? this.plate,
    name: name.present ? name.value : this.name,
    number: number.present ? number.value : this.number,
    capacity: capacity ?? this.capacity,
    fuelAmount: fuelAmount ?? this.fuelAmount,
    fuelDate: fuelDate ?? this.fuelDate,
    oilDate: oilDate ?? this.oilDate,
    is_active: is_active ?? this.is_active,
    isSynced: isSynced ?? this.isSynced,
  );
  Colectivo copyWithCompanion(ColectivosCompanion data) {
    return Colectivo(
      id: data.id.present ? data.id.value : this.id,
      plate: data.plate.present ? data.plate.value : this.plate,
      name: data.name.present ? data.name.value : this.name,
      number: data.number.present ? data.number.value : this.number,
      capacity: data.capacity.present ? data.capacity.value : this.capacity,
      fuelAmount: data.fuelAmount.present
          ? data.fuelAmount.value
          : this.fuelAmount,
      fuelDate: data.fuelDate.present ? data.fuelDate.value : this.fuelDate,
      oilDate: data.oilDate.present ? data.oilDate.value : this.oilDate,
      is_active: data.is_active.present ? data.is_active.value : this.is_active,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Colectivo(')
          ..write('id: $id, ')
          ..write('plate: $plate, ')
          ..write('name: $name, ')
          ..write('number: $number, ')
          ..write('capacity: $capacity, ')
          ..write('fuelAmount: $fuelAmount, ')
          ..write('fuelDate: $fuelDate, ')
          ..write('oilDate: $oilDate, ')
          ..write('is_active: $is_active, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    plate,
    name,
    number,
    capacity,
    fuelAmount,
    fuelDate,
    oilDate,
    is_active,
    isSynced,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Colectivo &&
          other.id == this.id &&
          other.plate == this.plate &&
          other.name == this.name &&
          other.number == this.number &&
          other.capacity == this.capacity &&
          other.fuelAmount == this.fuelAmount &&
          other.fuelDate == this.fuelDate &&
          other.oilDate == this.oilDate &&
          other.is_active == this.is_active &&
          other.isSynced == this.isSynced);
}

class ColectivosCompanion extends UpdateCompanion<Colectivo> {
  final Value<String> id;
  final Value<String> plate;
  final Value<String?> name;
  final Value<int?> number;
  final Value<int> capacity;
  final Value<String> fuelAmount;
  final Value<DateTime> fuelDate;
  final Value<DateTime> oilDate;
  final Value<bool> is_active;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const ColectivosCompanion({
    this.id = const Value.absent(),
    this.plate = const Value.absent(),
    this.name = const Value.absent(),
    this.number = const Value.absent(),
    this.capacity = const Value.absent(),
    this.fuelAmount = const Value.absent(),
    this.fuelDate = const Value.absent(),
    this.oilDate = const Value.absent(),
    this.is_active = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ColectivosCompanion.insert({
    required String id,
    required String plate,
    this.name = const Value.absent(),
    this.number = const Value.absent(),
    this.capacity = const Value.absent(),
    required String fuelAmount,
    required DateTime fuelDate,
    required DateTime oilDate,
    this.is_active = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       plate = Value(plate),
       fuelAmount = Value(fuelAmount),
       fuelDate = Value(fuelDate),
       oilDate = Value(oilDate);
  static Insertable<Colectivo> custom({
    Expression<String>? id,
    Expression<String>? plate,
    Expression<String>? name,
    Expression<int>? number,
    Expression<int>? capacity,
    Expression<String>? fuelAmount,
    Expression<DateTime>? fuelDate,
    Expression<DateTime>? oilDate,
    Expression<bool>? is_active,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (plate != null) 'plate': plate,
      if (name != null) 'name': name,
      if (number != null) 'number': number,
      if (capacity != null) 'capacity': capacity,
      if (fuelAmount != null) 'fuel_amount': fuelAmount,
      if (fuelDate != null) 'fuel_date': fuelDate,
      if (oilDate != null) 'oil_date': oilDate,
      if (is_active != null) 'is_active': is_active,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ColectivosCompanion copyWith({
    Value<String>? id,
    Value<String>? plate,
    Value<String?>? name,
    Value<int?>? number,
    Value<int>? capacity,
    Value<String>? fuelAmount,
    Value<DateTime>? fuelDate,
    Value<DateTime>? oilDate,
    Value<bool>? is_active,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return ColectivosCompanion(
      id: id ?? this.id,
      plate: plate ?? this.plate,
      name: name ?? this.name,
      number: number ?? this.number,
      capacity: capacity ?? this.capacity,
      fuelAmount: fuelAmount ?? this.fuelAmount,
      fuelDate: fuelDate ?? this.fuelDate,
      oilDate: oilDate ?? this.oilDate,
      is_active: is_active ?? this.is_active,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (plate.present) {
      map['plate'] = Variable<String>(plate.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (capacity.present) {
      map['capacity'] = Variable<int>(capacity.value);
    }
    if (fuelAmount.present) {
      map['fuel_amount'] = Variable<String>(fuelAmount.value);
    }
    if (fuelDate.present) {
      map['fuel_date'] = Variable<DateTime>(fuelDate.value);
    }
    if (oilDate.present) {
      map['oil_date'] = Variable<DateTime>(oilDate.value);
    }
    if (is_active.present) {
      map['is_active'] = Variable<bool>(is_active.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ColectivosCompanion(')
          ..write('id: $id, ')
          ..write('plate: $plate, ')
          ..write('name: $name, ')
          ..write('number: $number, ')
          ..write('capacity: $capacity, ')
          ..write('fuelAmount: $fuelAmount, ')
          ..write('fuelDate: $fuelDate, ')
          ..write('oilDate: $oilDate, ')
          ..write('is_active: $is_active, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecorridosTable extends Recorridos
    with TableInfo<$RecorridosTable, Recorrido> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecorridosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pinnedMeta = const VerificationMeta('pinned');
  @override
  late final GeneratedColumn<bool> pinned = GeneratedColumn<bool>(
    'pinned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pinned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _basePriceMeta = const VerificationMeta(
    'basePrice',
  );
  @override
  late final GeneratedColumn<int> basePrice = GeneratedColumn<int>(
    'base_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    pinned,
    basePrice,
    isActive,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recorridos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Recorrido> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('pinned')) {
      context.handle(
        _pinnedMeta,
        pinned.isAcceptableOrUnknown(data['pinned']!, _pinnedMeta),
      );
    }
    if (data.containsKey('base_price')) {
      context.handle(
        _basePriceMeta,
        basePrice.isAcceptableOrUnknown(data['base_price']!, _basePriceMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Recorrido map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Recorrido(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      pinned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pinned'],
      )!,
      basePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}base_price'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $RecorridosTable createAlias(String alias) {
    return $RecorridosTable(attachedDatabase, alias);
  }
}

class Recorrido extends DataClass implements Insertable<Recorrido> {
  final String id;
  final String name;
  final bool pinned;
  final int basePrice;
  final bool isActive;
  final bool isSynced;
  const Recorrido({
    required this.id,
    required this.name,
    required this.pinned,
    required this.basePrice,
    required this.isActive,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['pinned'] = Variable<bool>(pinned);
    map['base_price'] = Variable<int>(basePrice);
    map['is_active'] = Variable<bool>(isActive);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  RecorridosCompanion toCompanion(bool nullToAbsent) {
    return RecorridosCompanion(
      id: Value(id),
      name: Value(name),
      pinned: Value(pinned),
      basePrice: Value(basePrice),
      isActive: Value(isActive),
      isSynced: Value(isSynced),
    );
  }

  factory Recorrido.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Recorrido(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      pinned: serializer.fromJson<bool>(json['pinned']),
      basePrice: serializer.fromJson<int>(json['basePrice']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'pinned': serializer.toJson<bool>(pinned),
      'basePrice': serializer.toJson<int>(basePrice),
      'isActive': serializer.toJson<bool>(isActive),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Recorrido copyWith({
    String? id,
    String? name,
    bool? pinned,
    int? basePrice,
    bool? isActive,
    bool? isSynced,
  }) => Recorrido(
    id: id ?? this.id,
    name: name ?? this.name,
    pinned: pinned ?? this.pinned,
    basePrice: basePrice ?? this.basePrice,
    isActive: isActive ?? this.isActive,
    isSynced: isSynced ?? this.isSynced,
  );
  Recorrido copyWithCompanion(RecorridosCompanion data) {
    return Recorrido(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      pinned: data.pinned.present ? data.pinned.value : this.pinned,
      basePrice: data.basePrice.present ? data.basePrice.value : this.basePrice,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Recorrido(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pinned: $pinned, ')
          ..write('basePrice: $basePrice, ')
          ..write('isActive: $isActive, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, pinned, basePrice, isActive, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Recorrido &&
          other.id == this.id &&
          other.name == this.name &&
          other.pinned == this.pinned &&
          other.basePrice == this.basePrice &&
          other.isActive == this.isActive &&
          other.isSynced == this.isSynced);
}

class RecorridosCompanion extends UpdateCompanion<Recorrido> {
  final Value<String> id;
  final Value<String> name;
  final Value<bool> pinned;
  final Value<int> basePrice;
  final Value<bool> isActive;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const RecorridosCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.pinned = const Value.absent(),
    this.basePrice = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecorridosCompanion.insert({
    required String id,
    required String name,
    this.pinned = const Value.absent(),
    this.basePrice = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Recorrido> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<bool>? pinned,
    Expression<int>? basePrice,
    Expression<bool>? isActive,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (pinned != null) 'pinned': pinned,
      if (basePrice != null) 'base_price': basePrice,
      if (isActive != null) 'is_active': isActive,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecorridosCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<bool>? pinned,
    Value<int>? basePrice,
    Value<bool>? isActive,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return RecorridosCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      pinned: pinned ?? this.pinned,
      basePrice: basePrice ?? this.basePrice,
      isActive: isActive ?? this.isActive,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (pinned.present) {
      map['pinned'] = Variable<bool>(pinned.value);
    }
    if (basePrice.present) {
      map['base_price'] = Variable<int>(basePrice.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecorridosCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pinned: $pinned, ')
          ..write('basePrice: $basePrice, ')
          ..write('isActive: $isActive, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventsTable extends Events with TableInfo<$EventsTable, Event> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contactNameMeta = const VerificationMeta(
    'contactName',
  );
  @override
  late final GeneratedColumn<String> contactName = GeneratedColumn<String>(
    'contact_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contactMeta = const VerificationMeta(
    'contact',
  );
  @override
  late final GeneratedColumn<String> contact = GeneratedColumn<String>(
    'contact',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _repeatMeta = const VerificationMeta('repeat');
  @override
  late final GeneratedColumn<bool> repeat = GeneratedColumn<bool>(
    'repeat',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("repeat" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<WeekDays>?, String> days =
      GeneratedColumn<String>(
        'days',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<List<WeekDays>?>($EventsTable.$converterdaysn);
  static const VerificationMeta _startDateTimeMeta = const VerificationMeta(
    'startDateTime',
  );
  @override
  late final GeneratedColumn<DateTime> startDateTime =
      GeneratedColumn<DateTime>(
        'start_date_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _endDateTimeMeta = const VerificationMeta(
    'endDateTime',
  );
  @override
  late final GeneratedColumn<DateTime> endDateTime = GeneratedColumn<DateTime>(
    'end_date_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stopRepeatingDateTimeMeta =
      const VerificationMeta('stopRepeatingDateTime');
  @override
  late final GeneratedColumn<DateTime> stopRepeatingDateTime =
      GeneratedColumn<DateTime>(
        'stop_repeating_date_time',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  late final GeneratedColumnWithTypeConverter<EventStates, int> state =
      GeneratedColumn<int>(
        'state',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<EventStates>($EventsTable.$converterstate);
  @override
  late final GeneratedColumnWithTypeConverter<EventTypes, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<EventTypes>($EventsTable.$convertertype);
  static const VerificationMeta _isTripMeta = const VerificationMeta('isTrip');
  @override
  late final GeneratedColumn<bool> isTrip = GeneratedColumn<bool>(
    'is_trip',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_trip" IN (0, 1))',
    ),
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _recorridoIdMeta = const VerificationMeta(
    'recorridoId',
  );
  @override
  late final GeneratedColumn<String> recorridoId = GeneratedColumn<String>(
    'recorrido_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recorridos (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    contactName,
    contact,
    repeat,
    days,
    startDateTime,
    endDateTime,
    stopRepeatingDateTime,
    state,
    type,
    isTrip,
    isSynced,
    recorridoId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events';
  @override
  VerificationContext validateIntegrity(
    Insertable<Event> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('contact_name')) {
      context.handle(
        _contactNameMeta,
        contactName.isAcceptableOrUnknown(
          data['contact_name']!,
          _contactNameMeta,
        ),
      );
    }
    if (data.containsKey('contact')) {
      context.handle(
        _contactMeta,
        contact.isAcceptableOrUnknown(data['contact']!, _contactMeta),
      );
    }
    if (data.containsKey('repeat')) {
      context.handle(
        _repeatMeta,
        repeat.isAcceptableOrUnknown(data['repeat']!, _repeatMeta),
      );
    }
    if (data.containsKey('start_date_time')) {
      context.handle(
        _startDateTimeMeta,
        startDateTime.isAcceptableOrUnknown(
          data['start_date_time']!,
          _startDateTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_startDateTimeMeta);
    }
    if (data.containsKey('end_date_time')) {
      context.handle(
        _endDateTimeMeta,
        endDateTime.isAcceptableOrUnknown(
          data['end_date_time']!,
          _endDateTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_endDateTimeMeta);
    }
    if (data.containsKey('stop_repeating_date_time')) {
      context.handle(
        _stopRepeatingDateTimeMeta,
        stopRepeatingDateTime.isAcceptableOrUnknown(
          data['stop_repeating_date_time']!,
          _stopRepeatingDateTimeMeta,
        ),
      );
    }
    if (data.containsKey('is_trip')) {
      context.handle(
        _isTripMeta,
        isTrip.isAcceptableOrUnknown(data['is_trip']!, _isTripMeta),
      );
    } else if (isInserting) {
      context.missing(_isTripMeta);
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    if (data.containsKey('recorrido_id')) {
      context.handle(
        _recorridoIdMeta,
        recorridoId.isAcceptableOrUnknown(
          data['recorrido_id']!,
          _recorridoIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Event(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      contactName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact_name'],
      ),
      contact: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}contact'],
      ),
      repeat: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}repeat'],
      )!,
      days: $EventsTable.$converterdaysn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}days'],
        ),
      ),
      startDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_date_time'],
      )!,
      endDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_date_time'],
      )!,
      stopRepeatingDateTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}stop_repeating_date_time'],
      ),
      state: $EventsTable.$converterstate.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}state'],
        )!,
      ),
      type: $EventsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      isTrip: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_trip'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
      recorridoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorrido_id'],
      ),
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<WeekDays>, String> $converterdays =
      const WeekDaysConverter();
  static TypeConverter<List<WeekDays>?, String?> $converterdaysn =
      NullAwareTypeConverter.wrap($converterdays);
  static JsonTypeConverter2<EventStates, int, int> $converterstate =
      const EnumIndexConverter<EventStates>(EventStates.values);
  static JsonTypeConverter2<EventTypes, int, int> $convertertype =
      const EnumIndexConverter<EventTypes>(EventTypes.values);
}

class Event extends DataClass implements Insertable<Event> {
  final String id;
  final String name;
  final String? contactName;
  final String? contact;
  final bool repeat;
  final List<WeekDays>? days;
  final DateTime startDateTime;
  final DateTime endDateTime;
  final DateTime? stopRepeatingDateTime;
  final EventStates state;
  final EventTypes type;
  final bool isTrip;
  final bool isSynced;
  final String? recorridoId;
  const Event({
    required this.id,
    required this.name,
    this.contactName,
    this.contact,
    required this.repeat,
    this.days,
    required this.startDateTime,
    required this.endDateTime,
    this.stopRepeatingDateTime,
    required this.state,
    required this.type,
    required this.isTrip,
    required this.isSynced,
    this.recorridoId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || contactName != null) {
      map['contact_name'] = Variable<String>(contactName);
    }
    if (!nullToAbsent || contact != null) {
      map['contact'] = Variable<String>(contact);
    }
    map['repeat'] = Variable<bool>(repeat);
    if (!nullToAbsent || days != null) {
      map['days'] = Variable<String>($EventsTable.$converterdaysn.toSql(days));
    }
    map['start_date_time'] = Variable<DateTime>(startDateTime);
    map['end_date_time'] = Variable<DateTime>(endDateTime);
    if (!nullToAbsent || stopRepeatingDateTime != null) {
      map['stop_repeating_date_time'] = Variable<DateTime>(
        stopRepeatingDateTime,
      );
    }
    {
      map['state'] = Variable<int>($EventsTable.$converterstate.toSql(state));
    }
    {
      map['type'] = Variable<int>($EventsTable.$convertertype.toSql(type));
    }
    map['is_trip'] = Variable<bool>(isTrip);
    map['is_synced'] = Variable<bool>(isSynced);
    if (!nullToAbsent || recorridoId != null) {
      map['recorrido_id'] = Variable<String>(recorridoId);
    }
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      name: Value(name),
      contactName: contactName == null && nullToAbsent
          ? const Value.absent()
          : Value(contactName),
      contact: contact == null && nullToAbsent
          ? const Value.absent()
          : Value(contact),
      repeat: Value(repeat),
      days: days == null && nullToAbsent ? const Value.absent() : Value(days),
      startDateTime: Value(startDateTime),
      endDateTime: Value(endDateTime),
      stopRepeatingDateTime: stopRepeatingDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(stopRepeatingDateTime),
      state: Value(state),
      type: Value(type),
      isTrip: Value(isTrip),
      isSynced: Value(isSynced),
      recorridoId: recorridoId == null && nullToAbsent
          ? const Value.absent()
          : Value(recorridoId),
    );
  }

  factory Event.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      contactName: serializer.fromJson<String?>(json['contactName']),
      contact: serializer.fromJson<String?>(json['contact']),
      repeat: serializer.fromJson<bool>(json['repeat']),
      days: serializer.fromJson<List<WeekDays>?>(json['days']),
      startDateTime: serializer.fromJson<DateTime>(json['startDateTime']),
      endDateTime: serializer.fromJson<DateTime>(json['endDateTime']),
      stopRepeatingDateTime: serializer.fromJson<DateTime?>(
        json['stopRepeatingDateTime'],
      ),
      state: $EventsTable.$converterstate.fromJson(
        serializer.fromJson<int>(json['state']),
      ),
      type: $EventsTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      isTrip: serializer.fromJson<bool>(json['isTrip']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
      recorridoId: serializer.fromJson<String?>(json['recorridoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'contactName': serializer.toJson<String?>(contactName),
      'contact': serializer.toJson<String?>(contact),
      'repeat': serializer.toJson<bool>(repeat),
      'days': serializer.toJson<List<WeekDays>?>(days),
      'startDateTime': serializer.toJson<DateTime>(startDateTime),
      'endDateTime': serializer.toJson<DateTime>(endDateTime),
      'stopRepeatingDateTime': serializer.toJson<DateTime?>(
        stopRepeatingDateTime,
      ),
      'state': serializer.toJson<int>(
        $EventsTable.$converterstate.toJson(state),
      ),
      'type': serializer.toJson<int>($EventsTable.$convertertype.toJson(type)),
      'isTrip': serializer.toJson<bool>(isTrip),
      'isSynced': serializer.toJson<bool>(isSynced),
      'recorridoId': serializer.toJson<String?>(recorridoId),
    };
  }

  Event copyWith({
    String? id,
    String? name,
    Value<String?> contactName = const Value.absent(),
    Value<String?> contact = const Value.absent(),
    bool? repeat,
    Value<List<WeekDays>?> days = const Value.absent(),
    DateTime? startDateTime,
    DateTime? endDateTime,
    Value<DateTime?> stopRepeatingDateTime = const Value.absent(),
    EventStates? state,
    EventTypes? type,
    bool? isTrip,
    bool? isSynced,
    Value<String?> recorridoId = const Value.absent(),
  }) => Event(
    id: id ?? this.id,
    name: name ?? this.name,
    contactName: contactName.present ? contactName.value : this.contactName,
    contact: contact.present ? contact.value : this.contact,
    repeat: repeat ?? this.repeat,
    days: days.present ? days.value : this.days,
    startDateTime: startDateTime ?? this.startDateTime,
    endDateTime: endDateTime ?? this.endDateTime,
    stopRepeatingDateTime: stopRepeatingDateTime.present
        ? stopRepeatingDateTime.value
        : this.stopRepeatingDateTime,
    state: state ?? this.state,
    type: type ?? this.type,
    isTrip: isTrip ?? this.isTrip,
    isSynced: isSynced ?? this.isSynced,
    recorridoId: recorridoId.present ? recorridoId.value : this.recorridoId,
  );
  Event copyWithCompanion(EventsCompanion data) {
    return Event(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      contactName: data.contactName.present
          ? data.contactName.value
          : this.contactName,
      contact: data.contact.present ? data.contact.value : this.contact,
      repeat: data.repeat.present ? data.repeat.value : this.repeat,
      days: data.days.present ? data.days.value : this.days,
      startDateTime: data.startDateTime.present
          ? data.startDateTime.value
          : this.startDateTime,
      endDateTime: data.endDateTime.present
          ? data.endDateTime.value
          : this.endDateTime,
      stopRepeatingDateTime: data.stopRepeatingDateTime.present
          ? data.stopRepeatingDateTime.value
          : this.stopRepeatingDateTime,
      state: data.state.present ? data.state.value : this.state,
      type: data.type.present ? data.type.value : this.type,
      isTrip: data.isTrip.present ? data.isTrip.value : this.isTrip,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
      recorridoId: data.recorridoId.present
          ? data.recorridoId.value
          : this.recorridoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('contactName: $contactName, ')
          ..write('contact: $contact, ')
          ..write('repeat: $repeat, ')
          ..write('days: $days, ')
          ..write('startDateTime: $startDateTime, ')
          ..write('endDateTime: $endDateTime, ')
          ..write('stopRepeatingDateTime: $stopRepeatingDateTime, ')
          ..write('state: $state, ')
          ..write('type: $type, ')
          ..write('isTrip: $isTrip, ')
          ..write('isSynced: $isSynced, ')
          ..write('recorridoId: $recorridoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    contactName,
    contact,
    repeat,
    days,
    startDateTime,
    endDateTime,
    stopRepeatingDateTime,
    state,
    type,
    isTrip,
    isSynced,
    recorridoId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.name == this.name &&
          other.contactName == this.contactName &&
          other.contact == this.contact &&
          other.repeat == this.repeat &&
          other.days == this.days &&
          other.startDateTime == this.startDateTime &&
          other.endDateTime == this.endDateTime &&
          other.stopRepeatingDateTime == this.stopRepeatingDateTime &&
          other.state == this.state &&
          other.type == this.type &&
          other.isTrip == this.isTrip &&
          other.isSynced == this.isSynced &&
          other.recorridoId == this.recorridoId);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> contactName;
  final Value<String?> contact;
  final Value<bool> repeat;
  final Value<List<WeekDays>?> days;
  final Value<DateTime> startDateTime;
  final Value<DateTime> endDateTime;
  final Value<DateTime?> stopRepeatingDateTime;
  final Value<EventStates> state;
  final Value<EventTypes> type;
  final Value<bool> isTrip;
  final Value<bool> isSynced;
  final Value<String?> recorridoId;
  final Value<int> rowid;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.contactName = const Value.absent(),
    this.contact = const Value.absent(),
    this.repeat = const Value.absent(),
    this.days = const Value.absent(),
    this.startDateTime = const Value.absent(),
    this.endDateTime = const Value.absent(),
    this.stopRepeatingDateTime = const Value.absent(),
    this.state = const Value.absent(),
    this.type = const Value.absent(),
    this.isTrip = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.recorridoId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventsCompanion.insert({
    required String id,
    required String name,
    this.contactName = const Value.absent(),
    this.contact = const Value.absent(),
    this.repeat = const Value.absent(),
    this.days = const Value.absent(),
    required DateTime startDateTime,
    required DateTime endDateTime,
    this.stopRepeatingDateTime = const Value.absent(),
    required EventStates state,
    required EventTypes type,
    required bool isTrip,
    this.isSynced = const Value.absent(),
    this.recorridoId = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       startDateTime = Value(startDateTime),
       endDateTime = Value(endDateTime),
       state = Value(state),
       type = Value(type),
       isTrip = Value(isTrip);
  static Insertable<Event> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? contactName,
    Expression<String>? contact,
    Expression<bool>? repeat,
    Expression<String>? days,
    Expression<DateTime>? startDateTime,
    Expression<DateTime>? endDateTime,
    Expression<DateTime>? stopRepeatingDateTime,
    Expression<int>? state,
    Expression<int>? type,
    Expression<bool>? isTrip,
    Expression<bool>? isSynced,
    Expression<String>? recorridoId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (contactName != null) 'contact_name': contactName,
      if (contact != null) 'contact': contact,
      if (repeat != null) 'repeat': repeat,
      if (days != null) 'days': days,
      if (startDateTime != null) 'start_date_time': startDateTime,
      if (endDateTime != null) 'end_date_time': endDateTime,
      if (stopRepeatingDateTime != null)
        'stop_repeating_date_time': stopRepeatingDateTime,
      if (state != null) 'state': state,
      if (type != null) 'type': type,
      if (isTrip != null) 'is_trip': isTrip,
      if (isSynced != null) 'is_synced': isSynced,
      if (recorridoId != null) 'recorrido_id': recorridoId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? contactName,
    Value<String?>? contact,
    Value<bool>? repeat,
    Value<List<WeekDays>?>? days,
    Value<DateTime>? startDateTime,
    Value<DateTime>? endDateTime,
    Value<DateTime?>? stopRepeatingDateTime,
    Value<EventStates>? state,
    Value<EventTypes>? type,
    Value<bool>? isTrip,
    Value<bool>? isSynced,
    Value<String?>? recorridoId,
    Value<int>? rowid,
  }) {
    return EventsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      contactName: contactName ?? this.contactName,
      contact: contact ?? this.contact,
      repeat: repeat ?? this.repeat,
      days: days ?? this.days,
      startDateTime: startDateTime ?? this.startDateTime,
      endDateTime: endDateTime ?? this.endDateTime,
      stopRepeatingDateTime:
          stopRepeatingDateTime ?? this.stopRepeatingDateTime,
      state: state ?? this.state,
      type: type ?? this.type,
      isTrip: isTrip ?? this.isTrip,
      isSynced: isSynced ?? this.isSynced,
      recorridoId: recorridoId ?? this.recorridoId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (contactName.present) {
      map['contact_name'] = Variable<String>(contactName.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
    }
    if (repeat.present) {
      map['repeat'] = Variable<bool>(repeat.value);
    }
    if (days.present) {
      map['days'] = Variable<String>(
        $EventsTable.$converterdaysn.toSql(days.value),
      );
    }
    if (startDateTime.present) {
      map['start_date_time'] = Variable<DateTime>(startDateTime.value);
    }
    if (endDateTime.present) {
      map['end_date_time'] = Variable<DateTime>(endDateTime.value);
    }
    if (stopRepeatingDateTime.present) {
      map['stop_repeating_date_time'] = Variable<DateTime>(
        stopRepeatingDateTime.value,
      );
    }
    if (state.present) {
      map['state'] = Variable<int>(
        $EventsTable.$converterstate.toSql(state.value),
      );
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $EventsTable.$convertertype.toSql(type.value),
      );
    }
    if (isTrip.present) {
      map['is_trip'] = Variable<bool>(isTrip.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (recorridoId.present) {
      map['recorrido_id'] = Variable<String>(recorridoId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('contactName: $contactName, ')
          ..write('contact: $contact, ')
          ..write('repeat: $repeat, ')
          ..write('days: $days, ')
          ..write('startDateTime: $startDateTime, ')
          ..write('endDateTime: $endDateTime, ')
          ..write('stopRepeatingDateTime: $stopRepeatingDateTime, ')
          ..write('state: $state, ')
          ..write('type: $type, ')
          ..write('isTrip: $isTrip, ')
          ..write('isSynced: $isSynced, ')
          ..write('recorridoId: $recorridoId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StopsTable extends Stops with TableInfo<$StopsTable, Stop> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StopsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startMeta = const VerificationMeta('start');
  @override
  late final GeneratedColumn<DateTime> start = GeneratedColumn<DateTime>(
    'start',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, start, eventId, orderIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stops';
  @override
  VerificationContext validateIntegrity(
    Insertable<Stop> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('start')) {
      context.handle(
        _startMeta,
        start.isAcceptableOrUnknown(data['start']!, _startMeta),
      );
    }
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Stop map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Stop(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      start: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start'],
      ),
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_id'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
    );
  }

  @override
  $StopsTable createAlias(String alias) {
    return $StopsTable(attachedDatabase, alias);
  }
}

class Stop extends DataClass implements Insertable<Stop> {
  final String id;
  final String name;
  final DateTime? start;
  final String eventId;
  final int orderIndex;
  const Stop({
    required this.id,
    required this.name,
    this.start,
    required this.eventId,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<DateTime>(start);
    }
    map['event_id'] = Variable<String>(eventId);
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  StopsCompanion toCompanion(bool nullToAbsent) {
    return StopsCompanion(
      id: Value(id),
      name: Value(name),
      start: start == null && nullToAbsent
          ? const Value.absent()
          : Value(start),
      eventId: Value(eventId),
      orderIndex: Value(orderIndex),
    );
  }

  factory Stop.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Stop(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      start: serializer.fromJson<DateTime?>(json['start']),
      eventId: serializer.fromJson<String>(json['eventId']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'start': serializer.toJson<DateTime?>(start),
      'eventId': serializer.toJson<String>(eventId),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  Stop copyWith({
    String? id,
    String? name,
    Value<DateTime?> start = const Value.absent(),
    String? eventId,
    int? orderIndex,
  }) => Stop(
    id: id ?? this.id,
    name: name ?? this.name,
    start: start.present ? start.value : this.start,
    eventId: eventId ?? this.eventId,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  Stop copyWithCompanion(StopsCompanion data) {
    return Stop(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      start: data.start.present ? data.start.value : this.start,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Stop(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('start: $start, ')
          ..write('eventId: $eventId, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, start, eventId, orderIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Stop &&
          other.id == this.id &&
          other.name == this.name &&
          other.start == this.start &&
          other.eventId == this.eventId &&
          other.orderIndex == this.orderIndex);
}

class StopsCompanion extends UpdateCompanion<Stop> {
  final Value<String> id;
  final Value<String> name;
  final Value<DateTime?> start;
  final Value<String> eventId;
  final Value<int> orderIndex;
  final Value<int> rowid;
  const StopsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.start = const Value.absent(),
    this.eventId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StopsCompanion.insert({
    required String id,
    required String name,
    this.start = const Value.absent(),
    required String eventId,
    required int orderIndex,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       eventId = Value(eventId),
       orderIndex = Value(orderIndex);
  static Insertable<Stop> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? start,
    Expression<String>? eventId,
    Expression<int>? orderIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (start != null) 'start': start,
      if (eventId != null) 'event_id': eventId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StopsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<DateTime?>? start,
    Value<String>? eventId,
    Value<int>? orderIndex,
    Value<int>? rowid,
  }) {
    return StopsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      start: start ?? this.start,
      eventId: eventId ?? this.eventId,
      orderIndex: orderIndex ?? this.orderIndex,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StopsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('start: $start, ')
          ..write('eventId: $eventId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventChoferesTable extends EventChoferes
    with TableInfo<$EventChoferesTable, EventChofere> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventChoferesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _choferIdMeta = const VerificationMeta(
    'choferId',
  );
  @override
  late final GeneratedColumn<String> choferId = GeneratedColumn<String>(
    'chofer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES choferes (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [eventId, choferId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_choferes';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventChofere> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('chofer_id')) {
      context.handle(
        _choferIdMeta,
        choferId.isAcceptableOrUnknown(data['chofer_id']!, _choferIdMeta),
      );
    } else if (isInserting) {
      context.missing(_choferIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {eventId, choferId};
  @override
  EventChofere map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventChofere(
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_id'],
      )!,
      choferId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chofer_id'],
      )!,
    );
  }

  @override
  $EventChoferesTable createAlias(String alias) {
    return $EventChoferesTable(attachedDatabase, alias);
  }
}

class EventChofere extends DataClass implements Insertable<EventChofere> {
  final String eventId;
  final String choferId;
  const EventChofere({required this.eventId, required this.choferId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['event_id'] = Variable<String>(eventId);
    map['chofer_id'] = Variable<String>(choferId);
    return map;
  }

  EventChoferesCompanion toCompanion(bool nullToAbsent) {
    return EventChoferesCompanion(
      eventId: Value(eventId),
      choferId: Value(choferId),
    );
  }

  factory EventChofere.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventChofere(
      eventId: serializer.fromJson<String>(json['eventId']),
      choferId: serializer.fromJson<String>(json['choferId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'eventId': serializer.toJson<String>(eventId),
      'choferId': serializer.toJson<String>(choferId),
    };
  }

  EventChofere copyWith({String? eventId, String? choferId}) => EventChofere(
    eventId: eventId ?? this.eventId,
    choferId: choferId ?? this.choferId,
  );
  EventChofere copyWithCompanion(EventChoferesCompanion data) {
    return EventChofere(
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      choferId: data.choferId.present ? data.choferId.value : this.choferId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventChofere(')
          ..write('eventId: $eventId, ')
          ..write('choferId: $choferId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(eventId, choferId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventChofere &&
          other.eventId == this.eventId &&
          other.choferId == this.choferId);
}

class EventChoferesCompanion extends UpdateCompanion<EventChofere> {
  final Value<String> eventId;
  final Value<String> choferId;
  final Value<int> rowid;
  const EventChoferesCompanion({
    this.eventId = const Value.absent(),
    this.choferId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventChoferesCompanion.insert({
    required String eventId,
    required String choferId,
    this.rowid = const Value.absent(),
  }) : eventId = Value(eventId),
       choferId = Value(choferId);
  static Insertable<EventChofere> custom({
    Expression<String>? eventId,
    Expression<String>? choferId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (eventId != null) 'event_id': eventId,
      if (choferId != null) 'chofer_id': choferId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventChoferesCompanion copyWith({
    Value<String>? eventId,
    Value<String>? choferId,
    Value<int>? rowid,
  }) {
    return EventChoferesCompanion(
      eventId: eventId ?? this.eventId,
      choferId: choferId ?? this.choferId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (choferId.present) {
      map['chofer_id'] = Variable<String>(choferId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventChoferesCompanion(')
          ..write('eventId: $eventId, ')
          ..write('choferId: $choferId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventColectivosTable extends EventColectivos
    with TableInfo<$EventColectivosTable, EventColectivo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventColectivosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _eventIdMeta = const VerificationMeta(
    'eventId',
  );
  @override
  late final GeneratedColumn<String> eventId = GeneratedColumn<String>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _colectivoIdMeta = const VerificationMeta(
    'colectivoId',
  );
  @override
  late final GeneratedColumn<String> colectivoId = GeneratedColumn<String>(
    'colectivo_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES colectivos (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [eventId, colectivoId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_colectivos';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventColectivo> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIdMeta,
        eventId.isAcceptableOrUnknown(data['event_id']!, _eventIdMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIdMeta);
    }
    if (data.containsKey('colectivo_id')) {
      context.handle(
        _colectivoIdMeta,
        colectivoId.isAcceptableOrUnknown(
          data['colectivo_id']!,
          _colectivoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_colectivoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {eventId, colectivoId};
  @override
  EventColectivo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventColectivo(
      eventId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}event_id'],
      )!,
      colectivoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}colectivo_id'],
      )!,
    );
  }

  @override
  $EventColectivosTable createAlias(String alias) {
    return $EventColectivosTable(attachedDatabase, alias);
  }
}

class EventColectivo extends DataClass implements Insertable<EventColectivo> {
  final String eventId;
  final String colectivoId;
  const EventColectivo({required this.eventId, required this.colectivoId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['event_id'] = Variable<String>(eventId);
    map['colectivo_id'] = Variable<String>(colectivoId);
    return map;
  }

  EventColectivosCompanion toCompanion(bool nullToAbsent) {
    return EventColectivosCompanion(
      eventId: Value(eventId),
      colectivoId: Value(colectivoId),
    );
  }

  factory EventColectivo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventColectivo(
      eventId: serializer.fromJson<String>(json['eventId']),
      colectivoId: serializer.fromJson<String>(json['colectivoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'eventId': serializer.toJson<String>(eventId),
      'colectivoId': serializer.toJson<String>(colectivoId),
    };
  }

  EventColectivo copyWith({String? eventId, String? colectivoId}) =>
      EventColectivo(
        eventId: eventId ?? this.eventId,
        colectivoId: colectivoId ?? this.colectivoId,
      );
  EventColectivo copyWithCompanion(EventColectivosCompanion data) {
    return EventColectivo(
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      colectivoId: data.colectivoId.present
          ? data.colectivoId.value
          : this.colectivoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventColectivo(')
          ..write('eventId: $eventId, ')
          ..write('colectivoId: $colectivoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(eventId, colectivoId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventColectivo &&
          other.eventId == this.eventId &&
          other.colectivoId == this.colectivoId);
}

class EventColectivosCompanion extends UpdateCompanion<EventColectivo> {
  final Value<String> eventId;
  final Value<String> colectivoId;
  final Value<int> rowid;
  const EventColectivosCompanion({
    this.eventId = const Value.absent(),
    this.colectivoId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventColectivosCompanion.insert({
    required String eventId,
    required String colectivoId,
    this.rowid = const Value.absent(),
  }) : eventId = Value(eventId),
       colectivoId = Value(colectivoId);
  static Insertable<EventColectivo> custom({
    Expression<String>? eventId,
    Expression<String>? colectivoId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (eventId != null) 'event_id': eventId,
      if (colectivoId != null) 'colectivo_id': colectivoId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventColectivosCompanion copyWith({
    Value<String>? eventId,
    Value<String>? colectivoId,
    Value<int>? rowid,
  }) {
    return EventColectivosCompanion(
      eventId: eventId ?? this.eventId,
      colectivoId: colectivoId ?? this.colectivoId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (eventId.present) {
      map['event_id'] = Variable<String>(eventId.value);
    }
    if (colectivoId.present) {
      map['colectivo_id'] = Variable<String>(colectivoId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventColectivosCompanion(')
          ..write('eventId: $eventId, ')
          ..write('colectivoId: $colectivoId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecorridoShiftsTable extends RecorridoShifts
    with TableInfo<$RecorridoShiftsTable, RecorridoShift> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecorridoShiftsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recorridoIdMeta = const VerificationMeta(
    'recorridoId',
  );
  @override
  late final GeneratedColumn<String> recorridoId = GeneratedColumn<String>(
    'recorrido_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recorridos (id) ON DELETE CASCADE',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<WeekDays>, String> weekDay =
      GeneratedColumn<String>(
        'week_day',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<WeekDays>>($RecorridoShiftsTable.$converterweekDay);
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shiftNameMeta = const VerificationMeta(
    'shiftName',
  );
  @override
  late final GeneratedColumn<String> shiftName = GeneratedColumn<String>(
    'shift_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recorridoId,
    weekDay,
    startTime,
    endTime,
    shiftName,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recorrido_shifts';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecorridoShift> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('recorrido_id')) {
      context.handle(
        _recorridoIdMeta,
        recorridoId.isAcceptableOrUnknown(
          data['recorrido_id']!,
          _recorridoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recorridoIdMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('shift_name')) {
      context.handle(
        _shiftNameMeta,
        shiftName.isAcceptableOrUnknown(data['shift_name']!, _shiftNameMeta),
      );
    } else if (isInserting) {
      context.missing(_shiftNameMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecorridoShift map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecorridoShift(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      recorridoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorrido_id'],
      )!,
      weekDay: $RecorridoShiftsTable.$converterweekDay.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}week_day'],
        )!,
      ),
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      )!,
      shiftName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shift_name'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $RecorridoShiftsTable createAlias(String alias) {
    return $RecorridoShiftsTable(attachedDatabase, alias);
  }

  static TypeConverter<List<WeekDays>, String> $converterweekDay =
      const WeekDaysConverter();
}

class RecorridoShift extends DataClass implements Insertable<RecorridoShift> {
  final String id;
  final String recorridoId;
  final List<WeekDays> weekDay;
  final DateTime startTime;
  final DateTime endTime;
  final String shiftName;
  final bool isActive;
  const RecorridoShift({
    required this.id,
    required this.recorridoId,
    required this.weekDay,
    required this.startTime,
    required this.endTime,
    required this.shiftName,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['recorrido_id'] = Variable<String>(recorridoId);
    {
      map['week_day'] = Variable<String>(
        $RecorridoShiftsTable.$converterweekDay.toSql(weekDay),
      );
    }
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    map['shift_name'] = Variable<String>(shiftName);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  RecorridoShiftsCompanion toCompanion(bool nullToAbsent) {
    return RecorridoShiftsCompanion(
      id: Value(id),
      recorridoId: Value(recorridoId),
      weekDay: Value(weekDay),
      startTime: Value(startTime),
      endTime: Value(endTime),
      shiftName: Value(shiftName),
      isActive: Value(isActive),
    );
  }

  factory RecorridoShift.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecorridoShift(
      id: serializer.fromJson<String>(json['id']),
      recorridoId: serializer.fromJson<String>(json['recorridoId']),
      weekDay: serializer.fromJson<List<WeekDays>>(json['weekDay']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      shiftName: serializer.fromJson<String>(json['shiftName']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'recorridoId': serializer.toJson<String>(recorridoId),
      'weekDay': serializer.toJson<List<WeekDays>>(weekDay),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'shiftName': serializer.toJson<String>(shiftName),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  RecorridoShift copyWith({
    String? id,
    String? recorridoId,
    List<WeekDays>? weekDay,
    DateTime? startTime,
    DateTime? endTime,
    String? shiftName,
    bool? isActive,
  }) => RecorridoShift(
    id: id ?? this.id,
    recorridoId: recorridoId ?? this.recorridoId,
    weekDay: weekDay ?? this.weekDay,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    shiftName: shiftName ?? this.shiftName,
    isActive: isActive ?? this.isActive,
  );
  RecorridoShift copyWithCompanion(RecorridoShiftsCompanion data) {
    return RecorridoShift(
      id: data.id.present ? data.id.value : this.id,
      recorridoId: data.recorridoId.present
          ? data.recorridoId.value
          : this.recorridoId,
      weekDay: data.weekDay.present ? data.weekDay.value : this.weekDay,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      shiftName: data.shiftName.present ? data.shiftName.value : this.shiftName,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecorridoShift(')
          ..write('id: $id, ')
          ..write('recorridoId: $recorridoId, ')
          ..write('weekDay: $weekDay, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('shiftName: $shiftName, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    recorridoId,
    weekDay,
    startTime,
    endTime,
    shiftName,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecorridoShift &&
          other.id == this.id &&
          other.recorridoId == this.recorridoId &&
          other.weekDay == this.weekDay &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.shiftName == this.shiftName &&
          other.isActive == this.isActive);
}

class RecorridoShiftsCompanion extends UpdateCompanion<RecorridoShift> {
  final Value<String> id;
  final Value<String> recorridoId;
  final Value<List<WeekDays>> weekDay;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<String> shiftName;
  final Value<bool> isActive;
  final Value<int> rowid;
  const RecorridoShiftsCompanion({
    this.id = const Value.absent(),
    this.recorridoId = const Value.absent(),
    this.weekDay = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.shiftName = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecorridoShiftsCompanion.insert({
    required String id,
    required String recorridoId,
    required List<WeekDays> weekDay,
    required DateTime startTime,
    required DateTime endTime,
    required String shiftName,
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       recorridoId = Value(recorridoId),
       weekDay = Value(weekDay),
       startTime = Value(startTime),
       endTime = Value(endTime),
       shiftName = Value(shiftName);
  static Insertable<RecorridoShift> custom({
    Expression<String>? id,
    Expression<String>? recorridoId,
    Expression<String>? weekDay,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<String>? shiftName,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recorridoId != null) 'recorrido_id': recorridoId,
      if (weekDay != null) 'week_day': weekDay,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (shiftName != null) 'shift_name': shiftName,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecorridoShiftsCompanion copyWith({
    Value<String>? id,
    Value<String>? recorridoId,
    Value<List<WeekDays>>? weekDay,
    Value<DateTime>? startTime,
    Value<DateTime>? endTime,
    Value<String>? shiftName,
    Value<bool>? isActive,
    Value<int>? rowid,
  }) {
    return RecorridoShiftsCompanion(
      id: id ?? this.id,
      recorridoId: recorridoId ?? this.recorridoId,
      weekDay: weekDay ?? this.weekDay,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      shiftName: shiftName ?? this.shiftName,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (recorridoId.present) {
      map['recorrido_id'] = Variable<String>(recorridoId.value);
    }
    if (weekDay.present) {
      map['week_day'] = Variable<String>(
        $RecorridoShiftsTable.$converterweekDay.toSql(weekDay.value),
      );
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (shiftName.present) {
      map['shift_name'] = Variable<String>(shiftName.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecorridoShiftsCompanion(')
          ..write('id: $id, ')
          ..write('recorridoId: $recorridoId, ')
          ..write('weekDay: $weekDay, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('shiftName: $shiftName, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShiftChoferesTable extends ShiftChoferes
    with TableInfo<$ShiftChoferesTable, ShiftChofere> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShiftChoferesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _shiftIdMeta = const VerificationMeta(
    'shiftId',
  );
  @override
  late final GeneratedColumn<String> shiftId = GeneratedColumn<String>(
    'shift_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recorrido_shifts (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _choferIdMeta = const VerificationMeta(
    'choferId',
  );
  @override
  late final GeneratedColumn<String> choferId = GeneratedColumn<String>(
    'chofer_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES choferes (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [shiftId, choferId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shift_choferes';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShiftChofere> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('shift_id')) {
      context.handle(
        _shiftIdMeta,
        shiftId.isAcceptableOrUnknown(data['shift_id']!, _shiftIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shiftIdMeta);
    }
    if (data.containsKey('chofer_id')) {
      context.handle(
        _choferIdMeta,
        choferId.isAcceptableOrUnknown(data['chofer_id']!, _choferIdMeta),
      );
    } else if (isInserting) {
      context.missing(_choferIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {shiftId, choferId};
  @override
  ShiftChofere map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShiftChofere(
      shiftId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shift_id'],
      )!,
      choferId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chofer_id'],
      )!,
    );
  }

  @override
  $ShiftChoferesTable createAlias(String alias) {
    return $ShiftChoferesTable(attachedDatabase, alias);
  }
}

class ShiftChofere extends DataClass implements Insertable<ShiftChofere> {
  final String shiftId;
  final String choferId;
  const ShiftChofere({required this.shiftId, required this.choferId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['shift_id'] = Variable<String>(shiftId);
    map['chofer_id'] = Variable<String>(choferId);
    return map;
  }

  ShiftChoferesCompanion toCompanion(bool nullToAbsent) {
    return ShiftChoferesCompanion(
      shiftId: Value(shiftId),
      choferId: Value(choferId),
    );
  }

  factory ShiftChofere.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShiftChofere(
      shiftId: serializer.fromJson<String>(json['shiftId']),
      choferId: serializer.fromJson<String>(json['choferId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'shiftId': serializer.toJson<String>(shiftId),
      'choferId': serializer.toJson<String>(choferId),
    };
  }

  ShiftChofere copyWith({String? shiftId, String? choferId}) => ShiftChofere(
    shiftId: shiftId ?? this.shiftId,
    choferId: choferId ?? this.choferId,
  );
  ShiftChofere copyWithCompanion(ShiftChoferesCompanion data) {
    return ShiftChofere(
      shiftId: data.shiftId.present ? data.shiftId.value : this.shiftId,
      choferId: data.choferId.present ? data.choferId.value : this.choferId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShiftChofere(')
          ..write('shiftId: $shiftId, ')
          ..write('choferId: $choferId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(shiftId, choferId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShiftChofere &&
          other.shiftId == this.shiftId &&
          other.choferId == this.choferId);
}

class ShiftChoferesCompanion extends UpdateCompanion<ShiftChofere> {
  final Value<String> shiftId;
  final Value<String> choferId;
  final Value<int> rowid;
  const ShiftChoferesCompanion({
    this.shiftId = const Value.absent(),
    this.choferId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShiftChoferesCompanion.insert({
    required String shiftId,
    required String choferId,
    this.rowid = const Value.absent(),
  }) : shiftId = Value(shiftId),
       choferId = Value(choferId);
  static Insertable<ShiftChofere> custom({
    Expression<String>? shiftId,
    Expression<String>? choferId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (shiftId != null) 'shift_id': shiftId,
      if (choferId != null) 'chofer_id': choferId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShiftChoferesCompanion copyWith({
    Value<String>? shiftId,
    Value<String>? choferId,
    Value<int>? rowid,
  }) {
    return ShiftChoferesCompanion(
      shiftId: shiftId ?? this.shiftId,
      choferId: choferId ?? this.choferId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (shiftId.present) {
      map['shift_id'] = Variable<String>(shiftId.value);
    }
    if (choferId.present) {
      map['chofer_id'] = Variable<String>(choferId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShiftChoferesCompanion(')
          ..write('shiftId: $shiftId, ')
          ..write('choferId: $choferId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShiftColectivosTable extends ShiftColectivos
    with TableInfo<$ShiftColectivosTable, ShiftColectivo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShiftColectivosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _shiftIdMeta = const VerificationMeta(
    'shiftId',
  );
  @override
  late final GeneratedColumn<String> shiftId = GeneratedColumn<String>(
    'shift_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recorrido_shifts (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _colectivoIdMeta = const VerificationMeta(
    'colectivoId',
  );
  @override
  late final GeneratedColumn<String> colectivoId = GeneratedColumn<String>(
    'colectivo_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES colectivos (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [shiftId, colectivoId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shift_colectivos';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShiftColectivo> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('shift_id')) {
      context.handle(
        _shiftIdMeta,
        shiftId.isAcceptableOrUnknown(data['shift_id']!, _shiftIdMeta),
      );
    } else if (isInserting) {
      context.missing(_shiftIdMeta);
    }
    if (data.containsKey('colectivo_id')) {
      context.handle(
        _colectivoIdMeta,
        colectivoId.isAcceptableOrUnknown(
          data['colectivo_id']!,
          _colectivoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_colectivoIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {shiftId, colectivoId};
  @override
  ShiftColectivo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShiftColectivo(
      shiftId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shift_id'],
      )!,
      colectivoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}colectivo_id'],
      )!,
    );
  }

  @override
  $ShiftColectivosTable createAlias(String alias) {
    return $ShiftColectivosTable(attachedDatabase, alias);
  }
}

class ShiftColectivo extends DataClass implements Insertable<ShiftColectivo> {
  final String shiftId;
  final String colectivoId;
  const ShiftColectivo({required this.shiftId, required this.colectivoId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['shift_id'] = Variable<String>(shiftId);
    map['colectivo_id'] = Variable<String>(colectivoId);
    return map;
  }

  ShiftColectivosCompanion toCompanion(bool nullToAbsent) {
    return ShiftColectivosCompanion(
      shiftId: Value(shiftId),
      colectivoId: Value(colectivoId),
    );
  }

  factory ShiftColectivo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShiftColectivo(
      shiftId: serializer.fromJson<String>(json['shiftId']),
      colectivoId: serializer.fromJson<String>(json['colectivoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'shiftId': serializer.toJson<String>(shiftId),
      'colectivoId': serializer.toJson<String>(colectivoId),
    };
  }

  ShiftColectivo copyWith({String? shiftId, String? colectivoId}) =>
      ShiftColectivo(
        shiftId: shiftId ?? this.shiftId,
        colectivoId: colectivoId ?? this.colectivoId,
      );
  ShiftColectivo copyWithCompanion(ShiftColectivosCompanion data) {
    return ShiftColectivo(
      shiftId: data.shiftId.present ? data.shiftId.value : this.shiftId,
      colectivoId: data.colectivoId.present
          ? data.colectivoId.value
          : this.colectivoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShiftColectivo(')
          ..write('shiftId: $shiftId, ')
          ..write('colectivoId: $colectivoId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(shiftId, colectivoId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShiftColectivo &&
          other.shiftId == this.shiftId &&
          other.colectivoId == this.colectivoId);
}

class ShiftColectivosCompanion extends UpdateCompanion<ShiftColectivo> {
  final Value<String> shiftId;
  final Value<String> colectivoId;
  final Value<int> rowid;
  const ShiftColectivosCompanion({
    this.shiftId = const Value.absent(),
    this.colectivoId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShiftColectivosCompanion.insert({
    required String shiftId,
    required String colectivoId,
    this.rowid = const Value.absent(),
  }) : shiftId = Value(shiftId),
       colectivoId = Value(colectivoId);
  static Insertable<ShiftColectivo> custom({
    Expression<String>? shiftId,
    Expression<String>? colectivoId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (shiftId != null) 'shift_id': shiftId,
      if (colectivoId != null) 'colectivo_id': colectivoId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShiftColectivosCompanion copyWith({
    Value<String>? shiftId,
    Value<String>? colectivoId,
    Value<int>? rowid,
  }) {
    return ShiftColectivosCompanion(
      shiftId: shiftId ?? this.shiftId,
      colectivoId: colectivoId ?? this.colectivoId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (shiftId.present) {
      map['shift_id'] = Variable<String>(shiftId.value);
    }
    if (colectivoId.present) {
      map['colectivo_id'] = Variable<String>(colectivoId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShiftColectivosCompanion(')
          ..write('shiftId: $shiftId, ')
          ..write('colectivoId: $colectivoId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EncargadosTable extends Encargados
    with TableInfo<$EncargadosTable, Encargado> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EncargadosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _balanceMeta = const VerificationMeta(
    'balance',
  );
  @override
  late final GeneratedColumn<double> balance = GeneratedColumn<double>(
    'balance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _isSyncedMeta = const VerificationMeta(
    'isSynced',
  );
  @override
  late final GeneratedColumn<bool> isSynced = GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, phone, balance, isSynced];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'encargados';
  @override
  VerificationContext validateIntegrity(
    Insertable<Encargado> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    }
    if (data.containsKey('balance')) {
      context.handle(
        _balanceMeta,
        balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta),
      );
    }
    if (data.containsKey('is_synced')) {
      context.handle(
        _isSyncedMeta,
        isSynced.isAcceptableOrUnknown(data['is_synced']!, _isSyncedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Encargado map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Encargado(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      ),
      balance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}balance'],
      )!,
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $EncargadosTable createAlias(String alias) {
    return $EncargadosTable(attachedDatabase, alias);
  }
}

class Encargado extends DataClass implements Insertable<Encargado> {
  final String id;
  final String name;
  final String? phone;
  final double balance;
  final bool isSynced;
  const Encargado({
    required this.id,
    required this.name,
    this.phone,
    required this.balance,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['balance'] = Variable<double>(balance);
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  EncargadosCompanion toCompanion(bool nullToAbsent) {
    return EncargadosCompanion(
      id: Value(id),
      name: Value(name),
      phone: phone == null && nullToAbsent
          ? const Value.absent()
          : Value(phone),
      balance: Value(balance),
      isSynced: Value(isSynced),
    );
  }

  factory Encargado.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Encargado(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String?>(json['phone']),
      balance: serializer.fromJson<double>(json['balance']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String?>(phone),
      'balance': serializer.toJson<double>(balance),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Encargado copyWith({
    String? id,
    String? name,
    Value<String?> phone = const Value.absent(),
    double? balance,
    bool? isSynced,
  }) => Encargado(
    id: id ?? this.id,
    name: name ?? this.name,
    phone: phone.present ? phone.value : this.phone,
    balance: balance ?? this.balance,
    isSynced: isSynced ?? this.isSynced,
  );
  Encargado copyWithCompanion(EncargadosCompanion data) {
    return Encargado(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      balance: data.balance.present ? data.balance.value : this.balance,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Encargado(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('balance: $balance, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone, balance, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Encargado &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.balance == this.balance &&
          other.isSynced == this.isSynced);
}

class EncargadosCompanion extends UpdateCompanion<Encargado> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> phone;
  final Value<double> balance;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const EncargadosCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.balance = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EncargadosCompanion.insert({
    required String id,
    required String name,
    this.phone = const Value.absent(),
    this.balance = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name);
  static Insertable<Encargado> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<double>? balance,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (balance != null) 'balance': balance,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EncargadosCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String?>? phone,
    Value<double>? balance,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return EncargadosCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      balance: balance ?? this.balance,
      isSynced: isSynced ?? this.isSynced,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (balance.present) {
      map['balance'] = Variable<double>(balance.value);
    }
    if (isSynced.present) {
      map['is_synced'] = Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EncargadosCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('balance: $balance, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecorridoSubscriptionsTable extends RecorridoSubscriptions
    with TableInfo<$RecorridoSubscriptionsTable, RecorridoSubscription> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecorridoSubscriptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recorridoIdMeta = const VerificationMeta(
    'recorridoId',
  );
  @override
  late final GeneratedColumn<String> recorridoId = GeneratedColumn<String>(
    'recorrido_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recorridos (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _encargadoIdMeta = const VerificationMeta(
    'encargadoId',
  );
  @override
  late final GeneratedColumn<String> encargadoId = GeneratedColumn<String>(
    'encargado_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES encargados (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _subscriptionNameMeta = const VerificationMeta(
    'subscriptionName',
  );
  @override
  late final GeneratedColumn<String> subscriptionName = GeneratedColumn<String>(
    'subscription_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _customPriceMeta = const VerificationMeta(
    'customPrice',
  );
  @override
  late final GeneratedColumn<int> customPrice = GeneratedColumn<int>(
    'custom_price',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recorridoId,
    encargadoId,
    subscriptionName,
    address,
    customPrice,
    isActive,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recorrido_subscriptions';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecorridoSubscription> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('recorrido_id')) {
      context.handle(
        _recorridoIdMeta,
        recorridoId.isAcceptableOrUnknown(
          data['recorrido_id']!,
          _recorridoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recorridoIdMeta);
    }
    if (data.containsKey('encargado_id')) {
      context.handle(
        _encargadoIdMeta,
        encargadoId.isAcceptableOrUnknown(
          data['encargado_id']!,
          _encargadoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_encargadoIdMeta);
    }
    if (data.containsKey('subscription_name')) {
      context.handle(
        _subscriptionNameMeta,
        subscriptionName.isAcceptableOrUnknown(
          data['subscription_name']!,
          _subscriptionNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_subscriptionNameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('custom_price')) {
      context.handle(
        _customPriceMeta,
        customPrice.isAcceptableOrUnknown(
          data['custom_price']!,
          _customPriceMeta,
        ),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecorridoSubscription map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecorridoSubscription(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      recorridoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recorrido_id'],
      )!,
      encargadoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}encargado_id'],
      )!,
      subscriptionName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}subscription_name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      customPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}custom_price'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
    );
  }

  @override
  $RecorridoSubscriptionsTable createAlias(String alias) {
    return $RecorridoSubscriptionsTable(attachedDatabase, alias);
  }
}

class RecorridoSubscription extends DataClass
    implements Insertable<RecorridoSubscription> {
  final String id;
  final String recorridoId;
  final String encargadoId;
  final String subscriptionName;
  final String? address;
  final int? customPrice;
  final bool isActive;
  const RecorridoSubscription({
    required this.id,
    required this.recorridoId,
    required this.encargadoId,
    required this.subscriptionName,
    this.address,
    this.customPrice,
    required this.isActive,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['recorrido_id'] = Variable<String>(recorridoId);
    map['encargado_id'] = Variable<String>(encargadoId);
    map['subscription_name'] = Variable<String>(subscriptionName);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || customPrice != null) {
      map['custom_price'] = Variable<int>(customPrice);
    }
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  RecorridoSubscriptionsCompanion toCompanion(bool nullToAbsent) {
    return RecorridoSubscriptionsCompanion(
      id: Value(id),
      recorridoId: Value(recorridoId),
      encargadoId: Value(encargadoId),
      subscriptionName: Value(subscriptionName),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      customPrice: customPrice == null && nullToAbsent
          ? const Value.absent()
          : Value(customPrice),
      isActive: Value(isActive),
    );
  }

  factory RecorridoSubscription.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecorridoSubscription(
      id: serializer.fromJson<String>(json['id']),
      recorridoId: serializer.fromJson<String>(json['recorridoId']),
      encargadoId: serializer.fromJson<String>(json['encargadoId']),
      subscriptionName: serializer.fromJson<String>(json['subscriptionName']),
      address: serializer.fromJson<String?>(json['address']),
      customPrice: serializer.fromJson<int?>(json['customPrice']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'recorridoId': serializer.toJson<String>(recorridoId),
      'encargadoId': serializer.toJson<String>(encargadoId),
      'subscriptionName': serializer.toJson<String>(subscriptionName),
      'address': serializer.toJson<String?>(address),
      'customPrice': serializer.toJson<int?>(customPrice),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  RecorridoSubscription copyWith({
    String? id,
    String? recorridoId,
    String? encargadoId,
    String? subscriptionName,
    Value<String?> address = const Value.absent(),
    Value<int?> customPrice = const Value.absent(),
    bool? isActive,
  }) => RecorridoSubscription(
    id: id ?? this.id,
    recorridoId: recorridoId ?? this.recorridoId,
    encargadoId: encargadoId ?? this.encargadoId,
    subscriptionName: subscriptionName ?? this.subscriptionName,
    address: address.present ? address.value : this.address,
    customPrice: customPrice.present ? customPrice.value : this.customPrice,
    isActive: isActive ?? this.isActive,
  );
  RecorridoSubscription copyWithCompanion(
    RecorridoSubscriptionsCompanion data,
  ) {
    return RecorridoSubscription(
      id: data.id.present ? data.id.value : this.id,
      recorridoId: data.recorridoId.present
          ? data.recorridoId.value
          : this.recorridoId,
      encargadoId: data.encargadoId.present
          ? data.encargadoId.value
          : this.encargadoId,
      subscriptionName: data.subscriptionName.present
          ? data.subscriptionName.value
          : this.subscriptionName,
      address: data.address.present ? data.address.value : this.address,
      customPrice: data.customPrice.present
          ? data.customPrice.value
          : this.customPrice,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecorridoSubscription(')
          ..write('id: $id, ')
          ..write('recorridoId: $recorridoId, ')
          ..write('encargadoId: $encargadoId, ')
          ..write('subscriptionName: $subscriptionName, ')
          ..write('address: $address, ')
          ..write('customPrice: $customPrice, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    recorridoId,
    encargadoId,
    subscriptionName,
    address,
    customPrice,
    isActive,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecorridoSubscription &&
          other.id == this.id &&
          other.recorridoId == this.recorridoId &&
          other.encargadoId == this.encargadoId &&
          other.subscriptionName == this.subscriptionName &&
          other.address == this.address &&
          other.customPrice == this.customPrice &&
          other.isActive == this.isActive);
}

class RecorridoSubscriptionsCompanion
    extends UpdateCompanion<RecorridoSubscription> {
  final Value<String> id;
  final Value<String> recorridoId;
  final Value<String> encargadoId;
  final Value<String> subscriptionName;
  final Value<String?> address;
  final Value<int?> customPrice;
  final Value<bool> isActive;
  final Value<int> rowid;
  const RecorridoSubscriptionsCompanion({
    this.id = const Value.absent(),
    this.recorridoId = const Value.absent(),
    this.encargadoId = const Value.absent(),
    this.subscriptionName = const Value.absent(),
    this.address = const Value.absent(),
    this.customPrice = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecorridoSubscriptionsCompanion.insert({
    required String id,
    required String recorridoId,
    required String encargadoId,
    required String subscriptionName,
    this.address = const Value.absent(),
    this.customPrice = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       recorridoId = Value(recorridoId),
       encargadoId = Value(encargadoId),
       subscriptionName = Value(subscriptionName);
  static Insertable<RecorridoSubscription> custom({
    Expression<String>? id,
    Expression<String>? recorridoId,
    Expression<String>? encargadoId,
    Expression<String>? subscriptionName,
    Expression<String>? address,
    Expression<int>? customPrice,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recorridoId != null) 'recorrido_id': recorridoId,
      if (encargadoId != null) 'encargado_id': encargadoId,
      if (subscriptionName != null) 'subscription_name': subscriptionName,
      if (address != null) 'address': address,
      if (customPrice != null) 'custom_price': customPrice,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecorridoSubscriptionsCompanion copyWith({
    Value<String>? id,
    Value<String>? recorridoId,
    Value<String>? encargadoId,
    Value<String>? subscriptionName,
    Value<String?>? address,
    Value<int?>? customPrice,
    Value<bool>? isActive,
    Value<int>? rowid,
  }) {
    return RecorridoSubscriptionsCompanion(
      id: id ?? this.id,
      recorridoId: recorridoId ?? this.recorridoId,
      encargadoId: encargadoId ?? this.encargadoId,
      subscriptionName: subscriptionName ?? this.subscriptionName,
      address: address ?? this.address,
      customPrice: customPrice ?? this.customPrice,
      isActive: isActive ?? this.isActive,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (recorridoId.present) {
      map['recorrido_id'] = Variable<String>(recorridoId.value);
    }
    if (encargadoId.present) {
      map['encargado_id'] = Variable<String>(encargadoId.value);
    }
    if (subscriptionName.present) {
      map['subscription_name'] = Variable<String>(subscriptionName.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (customPrice.present) {
      map['custom_price'] = Variable<int>(customPrice.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecorridoSubscriptionsCompanion(')
          ..write('id: $id, ')
          ..write('recorridoId: $recorridoId, ')
          ..write('encargadoId: $encargadoId, ')
          ..write('subscriptionName: $subscriptionName, ')
          ..write('address: $address, ')
          ..write('customPrice: $customPrice, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ChoferesTable choferes = $ChoferesTable(this);
  late final $ColectivosTable colectivos = $ColectivosTable(this);
  late final $RecorridosTable recorridos = $RecorridosTable(this);
  late final $EventsTable events = $EventsTable(this);
  late final $StopsTable stops = $StopsTable(this);
  late final $EventChoferesTable eventChoferes = $EventChoferesTable(this);
  late final $EventColectivosTable eventColectivos = $EventColectivosTable(
    this,
  );
  late final $RecorridoShiftsTable recorridoShifts = $RecorridoShiftsTable(
    this,
  );
  late final $ShiftChoferesTable shiftChoferes = $ShiftChoferesTable(this);
  late final $ShiftColectivosTable shiftColectivos = $ShiftColectivosTable(
    this,
  );
  late final $EncargadosTable encargados = $EncargadosTable(this);
  late final $RecorridoSubscriptionsTable recorridoSubscriptions =
      $RecorridoSubscriptionsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    choferes,
    colectivos,
    recorridos,
    events,
    stops,
    eventChoferes,
    eventColectivos,
    recorridoShifts,
    shiftChoferes,
    shiftColectivos,
    encargados,
    recorridoSubscriptions,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'events',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('stops', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'events',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('event_choferes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'choferes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('event_choferes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'events',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('event_colectivos', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'colectivos',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('event_colectivos', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recorridos',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('recorrido_shifts', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recorrido_shifts',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('shift_choferes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'choferes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('shift_choferes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recorrido_shifts',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('shift_colectivos', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'colectivos',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('shift_colectivos', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recorridos',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('recorrido_subscriptions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'encargados',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('recorrido_subscriptions', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$ChoferesTableCreateCompanionBuilder =
    ChoferesCompanion Function({
      required String id,
      Value<String?> dni,
      Value<String?> name,
      Value<String?> surname,
      Value<String?> alias,
      Value<String?> mobileNumber,
      Value<String?> picturePath,
      Value<double> balance,
      Value<bool> is_active,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$ChoferesTableUpdateCompanionBuilder =
    ChoferesCompanion Function({
      Value<String> id,
      Value<String?> dni,
      Value<String?> name,
      Value<String?> surname,
      Value<String?> alias,
      Value<String?> mobileNumber,
      Value<String?> picturePath,
      Value<double> balance,
      Value<bool> is_active,
      Value<bool> isSynced,
      Value<int> rowid,
    });

final class $$ChoferesTableReferences
    extends BaseReferences<_$AppDatabase, $ChoferesTable, Chofere> {
  $$ChoferesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventChoferesTable, List<EventChofere>>
  _eventChoferesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventChoferes,
    aliasName: $_aliasNameGenerator(db.choferes.id, db.eventChoferes.choferId),
  );

  $$EventChoferesTableProcessedTableManager get eventChoferesRefs {
    final manager = $$EventChoferesTableTableManager(
      $_db,
      $_db.eventChoferes,
    ).filter((f) => f.choferId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventChoferesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ShiftChoferesTable, List<ShiftChofere>>
  _shiftChoferesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.shiftChoferes,
    aliasName: $_aliasNameGenerator(db.choferes.id, db.shiftChoferes.choferId),
  );

  $$ShiftChoferesTableProcessedTableManager get shiftChoferesRefs {
    final manager = $$ShiftChoferesTableTableManager(
      $_db,
      $_db.shiftChoferes,
    ).filter((f) => f.choferId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_shiftChoferesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChoferesTableFilterComposer
    extends Composer<_$AppDatabase, $ChoferesTable> {
  $$ChoferesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dni => $composableBuilder(
    column: $table.dni,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get surname => $composableBuilder(
    column: $table.surname,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get alias => $composableBuilder(
    column: $table.alias,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get picturePath => $composableBuilder(
    column: $table.picturePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get is_active => $composableBuilder(
    column: $table.is_active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> eventChoferesRefs(
    Expression<bool> Function($$EventChoferesTableFilterComposer f) f,
  ) {
    final $$EventChoferesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventChoferes,
      getReferencedColumn: (t) => t.choferId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventChoferesTableFilterComposer(
            $db: $db,
            $table: $db.eventChoferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> shiftChoferesRefs(
    Expression<bool> Function($$ShiftChoferesTableFilterComposer f) f,
  ) {
    final $$ShiftChoferesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shiftChoferes,
      getReferencedColumn: (t) => t.choferId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShiftChoferesTableFilterComposer(
            $db: $db,
            $table: $db.shiftChoferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChoferesTableOrderingComposer
    extends Composer<_$AppDatabase, $ChoferesTable> {
  $$ChoferesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dni => $composableBuilder(
    column: $table.dni,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get surname => $composableBuilder(
    column: $table.surname,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get alias => $composableBuilder(
    column: $table.alias,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get picturePath => $composableBuilder(
    column: $table.picturePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get is_active => $composableBuilder(
    column: $table.is_active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChoferesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChoferesTable> {
  $$ChoferesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get dni =>
      $composableBuilder(column: $table.dni, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get surname =>
      $composableBuilder(column: $table.surname, builder: (column) => column);

  GeneratedColumn<String> get alias =>
      $composableBuilder(column: $table.alias, builder: (column) => column);

  GeneratedColumn<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get picturePath => $composableBuilder(
    column: $table.picturePath,
    builder: (column) => column,
  );

  GeneratedColumn<double> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<bool> get is_active =>
      $composableBuilder(column: $table.is_active, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  Expression<T> eventChoferesRefs<T extends Object>(
    Expression<T> Function($$EventChoferesTableAnnotationComposer a) f,
  ) {
    final $$EventChoferesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventChoferes,
      getReferencedColumn: (t) => t.choferId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventChoferesTableAnnotationComposer(
            $db: $db,
            $table: $db.eventChoferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> shiftChoferesRefs<T extends Object>(
    Expression<T> Function($$ShiftChoferesTableAnnotationComposer a) f,
  ) {
    final $$ShiftChoferesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shiftChoferes,
      getReferencedColumn: (t) => t.choferId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShiftChoferesTableAnnotationComposer(
            $db: $db,
            $table: $db.shiftChoferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChoferesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChoferesTable,
          Chofere,
          $$ChoferesTableFilterComposer,
          $$ChoferesTableOrderingComposer,
          $$ChoferesTableAnnotationComposer,
          $$ChoferesTableCreateCompanionBuilder,
          $$ChoferesTableUpdateCompanionBuilder,
          (Chofere, $$ChoferesTableReferences),
          Chofere,
          PrefetchHooks Function({
            bool eventChoferesRefs,
            bool shiftChoferesRefs,
          })
        > {
  $$ChoferesTableTableManager(_$AppDatabase db, $ChoferesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChoferesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChoferesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChoferesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> dni = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> surname = const Value.absent(),
                Value<String?> alias = const Value.absent(),
                Value<String?> mobileNumber = const Value.absent(),
                Value<String?> picturePath = const Value.absent(),
                Value<double> balance = const Value.absent(),
                Value<bool> is_active = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChoferesCompanion(
                id: id,
                dni: dni,
                name: name,
                surname: surname,
                alias: alias,
                mobileNumber: mobileNumber,
                picturePath: picturePath,
                balance: balance,
                is_active: is_active,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> dni = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> surname = const Value.absent(),
                Value<String?> alias = const Value.absent(),
                Value<String?> mobileNumber = const Value.absent(),
                Value<String?> picturePath = const Value.absent(),
                Value<double> balance = const Value.absent(),
                Value<bool> is_active = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChoferesCompanion.insert(
                id: id,
                dni: dni,
                name: name,
                surname: surname,
                alias: alias,
                mobileNumber: mobileNumber,
                picturePath: picturePath,
                balance: balance,
                is_active: is_active,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChoferesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({eventChoferesRefs = false, shiftChoferesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (eventChoferesRefs) db.eventChoferes,
                    if (shiftChoferesRefs) db.shiftChoferes,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (eventChoferesRefs)
                        await $_getPrefetchedData<
                          Chofere,
                          $ChoferesTable,
                          EventChofere
                        >(
                          currentTable: table,
                          referencedTable: $$ChoferesTableReferences
                              ._eventChoferesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChoferesTableReferences(
                                db,
                                table,
                                p0,
                              ).eventChoferesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.choferId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shiftChoferesRefs)
                        await $_getPrefetchedData<
                          Chofere,
                          $ChoferesTable,
                          ShiftChofere
                        >(
                          currentTable: table,
                          referencedTable: $$ChoferesTableReferences
                              ._shiftChoferesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ChoferesTableReferences(
                                db,
                                table,
                                p0,
                              ).shiftChoferesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.choferId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ChoferesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChoferesTable,
      Chofere,
      $$ChoferesTableFilterComposer,
      $$ChoferesTableOrderingComposer,
      $$ChoferesTableAnnotationComposer,
      $$ChoferesTableCreateCompanionBuilder,
      $$ChoferesTableUpdateCompanionBuilder,
      (Chofere, $$ChoferesTableReferences),
      Chofere,
      PrefetchHooks Function({bool eventChoferesRefs, bool shiftChoferesRefs})
    >;
typedef $$ColectivosTableCreateCompanionBuilder =
    ColectivosCompanion Function({
      required String id,
      required String plate,
      Value<String?> name,
      Value<int?> number,
      Value<int> capacity,
      required String fuelAmount,
      required DateTime fuelDate,
      required DateTime oilDate,
      Value<bool> is_active,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$ColectivosTableUpdateCompanionBuilder =
    ColectivosCompanion Function({
      Value<String> id,
      Value<String> plate,
      Value<String?> name,
      Value<int?> number,
      Value<int> capacity,
      Value<String> fuelAmount,
      Value<DateTime> fuelDate,
      Value<DateTime> oilDate,
      Value<bool> is_active,
      Value<bool> isSynced,
      Value<int> rowid,
    });

final class $$ColectivosTableReferences
    extends BaseReferences<_$AppDatabase, $ColectivosTable, Colectivo> {
  $$ColectivosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventColectivosTable, List<EventColectivo>>
  _eventColectivosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventColectivos,
    aliasName: $_aliasNameGenerator(
      db.colectivos.id,
      db.eventColectivos.colectivoId,
    ),
  );

  $$EventColectivosTableProcessedTableManager get eventColectivosRefs {
    final manager = $$EventColectivosTableTableManager(
      $_db,
      $_db.eventColectivos,
    ).filter((f) => f.colectivoId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _eventColectivosRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ShiftColectivosTable, List<ShiftColectivo>>
  _shiftColectivosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.shiftColectivos,
    aliasName: $_aliasNameGenerator(
      db.colectivos.id,
      db.shiftColectivos.colectivoId,
    ),
  );

  $$ShiftColectivosTableProcessedTableManager get shiftColectivosRefs {
    final manager = $$ShiftColectivosTableTableManager(
      $_db,
      $_db.shiftColectivos,
    ).filter((f) => f.colectivoId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _shiftColectivosRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ColectivosTableFilterComposer
    extends Composer<_$AppDatabase, $ColectivosTable> {
  $$ColectivosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get plate => $composableBuilder(
    column: $table.plate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get capacity => $composableBuilder(
    column: $table.capacity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fuelAmount => $composableBuilder(
    column: $table.fuelAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fuelDate => $composableBuilder(
    column: $table.fuelDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get oilDate => $composableBuilder(
    column: $table.oilDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get is_active => $composableBuilder(
    column: $table.is_active,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> eventColectivosRefs(
    Expression<bool> Function($$EventColectivosTableFilterComposer f) f,
  ) {
    final $$EventColectivosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventColectivos,
      getReferencedColumn: (t) => t.colectivoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventColectivosTableFilterComposer(
            $db: $db,
            $table: $db.eventColectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> shiftColectivosRefs(
    Expression<bool> Function($$ShiftColectivosTableFilterComposer f) f,
  ) {
    final $$ShiftColectivosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shiftColectivos,
      getReferencedColumn: (t) => t.colectivoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShiftColectivosTableFilterComposer(
            $db: $db,
            $table: $db.shiftColectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ColectivosTableOrderingComposer
    extends Composer<_$AppDatabase, $ColectivosTable> {
  $$ColectivosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get plate => $composableBuilder(
    column: $table.plate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get capacity => $composableBuilder(
    column: $table.capacity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fuelAmount => $composableBuilder(
    column: $table.fuelAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fuelDate => $composableBuilder(
    column: $table.fuelDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get oilDate => $composableBuilder(
    column: $table.oilDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get is_active => $composableBuilder(
    column: $table.is_active,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ColectivosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ColectivosTable> {
  $$ColectivosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get plate =>
      $composableBuilder(column: $table.plate, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<int> get capacity =>
      $composableBuilder(column: $table.capacity, builder: (column) => column);

  GeneratedColumn<String> get fuelAmount => $composableBuilder(
    column: $table.fuelAmount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fuelDate =>
      $composableBuilder(column: $table.fuelDate, builder: (column) => column);

  GeneratedColumn<DateTime> get oilDate =>
      $composableBuilder(column: $table.oilDate, builder: (column) => column);

  GeneratedColumn<bool> get is_active =>
      $composableBuilder(column: $table.is_active, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  Expression<T> eventColectivosRefs<T extends Object>(
    Expression<T> Function($$EventColectivosTableAnnotationComposer a) f,
  ) {
    final $$EventColectivosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventColectivos,
      getReferencedColumn: (t) => t.colectivoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventColectivosTableAnnotationComposer(
            $db: $db,
            $table: $db.eventColectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> shiftColectivosRefs<T extends Object>(
    Expression<T> Function($$ShiftColectivosTableAnnotationComposer a) f,
  ) {
    final $$ShiftColectivosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shiftColectivos,
      getReferencedColumn: (t) => t.colectivoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShiftColectivosTableAnnotationComposer(
            $db: $db,
            $table: $db.shiftColectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ColectivosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ColectivosTable,
          Colectivo,
          $$ColectivosTableFilterComposer,
          $$ColectivosTableOrderingComposer,
          $$ColectivosTableAnnotationComposer,
          $$ColectivosTableCreateCompanionBuilder,
          $$ColectivosTableUpdateCompanionBuilder,
          (Colectivo, $$ColectivosTableReferences),
          Colectivo,
          PrefetchHooks Function({
            bool eventColectivosRefs,
            bool shiftColectivosRefs,
          })
        > {
  $$ColectivosTableTableManager(_$AppDatabase db, $ColectivosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ColectivosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ColectivosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ColectivosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> plate = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<int?> number = const Value.absent(),
                Value<int> capacity = const Value.absent(),
                Value<String> fuelAmount = const Value.absent(),
                Value<DateTime> fuelDate = const Value.absent(),
                Value<DateTime> oilDate = const Value.absent(),
                Value<bool> is_active = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ColectivosCompanion(
                id: id,
                plate: plate,
                name: name,
                number: number,
                capacity: capacity,
                fuelAmount: fuelAmount,
                fuelDate: fuelDate,
                oilDate: oilDate,
                is_active: is_active,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String plate,
                Value<String?> name = const Value.absent(),
                Value<int?> number = const Value.absent(),
                Value<int> capacity = const Value.absent(),
                required String fuelAmount,
                required DateTime fuelDate,
                required DateTime oilDate,
                Value<bool> is_active = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ColectivosCompanion.insert(
                id: id,
                plate: plate,
                name: name,
                number: number,
                capacity: capacity,
                fuelAmount: fuelAmount,
                fuelDate: fuelDate,
                oilDate: oilDate,
                is_active: is_active,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ColectivosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({eventColectivosRefs = false, shiftColectivosRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (eventColectivosRefs) db.eventColectivos,
                    if (shiftColectivosRefs) db.shiftColectivos,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (eventColectivosRefs)
                        await $_getPrefetchedData<
                          Colectivo,
                          $ColectivosTable,
                          EventColectivo
                        >(
                          currentTable: table,
                          referencedTable: $$ColectivosTableReferences
                              ._eventColectivosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ColectivosTableReferences(
                                db,
                                table,
                                p0,
                              ).eventColectivosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.colectivoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shiftColectivosRefs)
                        await $_getPrefetchedData<
                          Colectivo,
                          $ColectivosTable,
                          ShiftColectivo
                        >(
                          currentTable: table,
                          referencedTable: $$ColectivosTableReferences
                              ._shiftColectivosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ColectivosTableReferences(
                                db,
                                table,
                                p0,
                              ).shiftColectivosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.colectivoId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ColectivosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ColectivosTable,
      Colectivo,
      $$ColectivosTableFilterComposer,
      $$ColectivosTableOrderingComposer,
      $$ColectivosTableAnnotationComposer,
      $$ColectivosTableCreateCompanionBuilder,
      $$ColectivosTableUpdateCompanionBuilder,
      (Colectivo, $$ColectivosTableReferences),
      Colectivo,
      PrefetchHooks Function({
        bool eventColectivosRefs,
        bool shiftColectivosRefs,
      })
    >;
typedef $$RecorridosTableCreateCompanionBuilder =
    RecorridosCompanion Function({
      required String id,
      required String name,
      Value<bool> pinned,
      Value<int> basePrice,
      Value<bool> isActive,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$RecorridosTableUpdateCompanionBuilder =
    RecorridosCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<bool> pinned,
      Value<int> basePrice,
      Value<bool> isActive,
      Value<bool> isSynced,
      Value<int> rowid,
    });

final class $$RecorridosTableReferences
    extends BaseReferences<_$AppDatabase, $RecorridosTable, Recorrido> {
  $$RecorridosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventsTable, List<Event>> _eventsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.events,
    aliasName: $_aliasNameGenerator(db.recorridos.id, db.events.recorridoId),
  );

  $$EventsTableProcessedTableManager get eventsRefs {
    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.recorridoId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$RecorridoShiftsTable, List<RecorridoShift>>
  _recorridoShiftsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.recorridoShifts,
    aliasName: $_aliasNameGenerator(
      db.recorridos.id,
      db.recorridoShifts.recorridoId,
    ),
  );

  $$RecorridoShiftsTableProcessedTableManager get recorridoShiftsRefs {
    final manager = $$RecorridoShiftsTableTableManager(
      $_db,
      $_db.recorridoShifts,
    ).filter((f) => f.recorridoId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recorridoShiftsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RecorridoSubscriptionsTable,
    List<RecorridoSubscription>
  >
  _recorridoSubscriptionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recorridoSubscriptions,
        aliasName: $_aliasNameGenerator(
          db.recorridos.id,
          db.recorridoSubscriptions.recorridoId,
        ),
      );

  $$RecorridoSubscriptionsTableProcessedTableManager
  get recorridoSubscriptionsRefs {
    final manager = $$RecorridoSubscriptionsTableTableManager(
      $_db,
      $_db.recorridoSubscriptions,
    ).filter((f) => f.recorridoId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recorridoSubscriptionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecorridosTableFilterComposer
    extends Composer<_$AppDatabase, $RecorridosTable> {
  $$RecorridosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pinned => $composableBuilder(
    column: $table.pinned,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get basePrice => $composableBuilder(
    column: $table.basePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> eventsRefs(
    Expression<bool> Function($$EventsTableFilterComposer f) f,
  ) {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.recorridoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> recorridoShiftsRefs(
    Expression<bool> Function($$RecorridoShiftsTableFilterComposer f) f,
  ) {
    final $$RecorridoShiftsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recorridoShifts,
      getReferencedColumn: (t) => t.recorridoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridoShiftsTableFilterComposer(
            $db: $db,
            $table: $db.recorridoShifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> recorridoSubscriptionsRefs(
    Expression<bool> Function($$RecorridoSubscriptionsTableFilterComposer f) f,
  ) {
    final $$RecorridoSubscriptionsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recorridoSubscriptions,
          getReferencedColumn: (t) => t.recorridoId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecorridoSubscriptionsTableFilterComposer(
                $db: $db,
                $table: $db.recorridoSubscriptions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RecorridosTableOrderingComposer
    extends Composer<_$AppDatabase, $RecorridosTable> {
  $$RecorridosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pinned => $composableBuilder(
    column: $table.pinned,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get basePrice => $composableBuilder(
    column: $table.basePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecorridosTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecorridosTable> {
  $$RecorridosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get pinned =>
      $composableBuilder(column: $table.pinned, builder: (column) => column);

  GeneratedColumn<int> get basePrice =>
      $composableBuilder(column: $table.basePrice, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  Expression<T> eventsRefs<T extends Object>(
    Expression<T> Function($$EventsTableAnnotationComposer a) f,
  ) {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.recorridoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> recorridoShiftsRefs<T extends Object>(
    Expression<T> Function($$RecorridoShiftsTableAnnotationComposer a) f,
  ) {
    final $$RecorridoShiftsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recorridoShifts,
      getReferencedColumn: (t) => t.recorridoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridoShiftsTableAnnotationComposer(
            $db: $db,
            $table: $db.recorridoShifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> recorridoSubscriptionsRefs<T extends Object>(
    Expression<T> Function($$RecorridoSubscriptionsTableAnnotationComposer a) f,
  ) {
    final $$RecorridoSubscriptionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recorridoSubscriptions,
          getReferencedColumn: (t) => t.recorridoId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecorridoSubscriptionsTableAnnotationComposer(
                $db: $db,
                $table: $db.recorridoSubscriptions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RecorridosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecorridosTable,
          Recorrido,
          $$RecorridosTableFilterComposer,
          $$RecorridosTableOrderingComposer,
          $$RecorridosTableAnnotationComposer,
          $$RecorridosTableCreateCompanionBuilder,
          $$RecorridosTableUpdateCompanionBuilder,
          (Recorrido, $$RecorridosTableReferences),
          Recorrido,
          PrefetchHooks Function({
            bool eventsRefs,
            bool recorridoShiftsRefs,
            bool recorridoSubscriptionsRefs,
          })
        > {
  $$RecorridosTableTableManager(_$AppDatabase db, $RecorridosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecorridosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecorridosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecorridosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> pinned = const Value.absent(),
                Value<int> basePrice = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecorridosCompanion(
                id: id,
                name: name,
                pinned: pinned,
                basePrice: basePrice,
                isActive: isActive,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<bool> pinned = const Value.absent(),
                Value<int> basePrice = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecorridosCompanion.insert(
                id: id,
                name: name,
                pinned: pinned,
                basePrice: basePrice,
                isActive: isActive,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecorridosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                eventsRefs = false,
                recorridoShiftsRefs = false,
                recorridoSubscriptionsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (eventsRefs) db.events,
                    if (recorridoShiftsRefs) db.recorridoShifts,
                    if (recorridoSubscriptionsRefs) db.recorridoSubscriptions,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (eventsRefs)
                        await $_getPrefetchedData<
                          Recorrido,
                          $RecorridosTable,
                          Event
                        >(
                          currentTable: table,
                          referencedTable: $$RecorridosTableReferences
                              ._eventsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecorridosTableReferences(
                                db,
                                table,
                                p0,
                              ).eventsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recorridoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (recorridoShiftsRefs)
                        await $_getPrefetchedData<
                          Recorrido,
                          $RecorridosTable,
                          RecorridoShift
                        >(
                          currentTable: table,
                          referencedTable: $$RecorridosTableReferences
                              ._recorridoShiftsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecorridosTableReferences(
                                db,
                                table,
                                p0,
                              ).recorridoShiftsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recorridoId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (recorridoSubscriptionsRefs)
                        await $_getPrefetchedData<
                          Recorrido,
                          $RecorridosTable,
                          RecorridoSubscription
                        >(
                          currentTable: table,
                          referencedTable: $$RecorridosTableReferences
                              ._recorridoSubscriptionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecorridosTableReferences(
                                db,
                                table,
                                p0,
                              ).recorridoSubscriptionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recorridoId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RecorridosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecorridosTable,
      Recorrido,
      $$RecorridosTableFilterComposer,
      $$RecorridosTableOrderingComposer,
      $$RecorridosTableAnnotationComposer,
      $$RecorridosTableCreateCompanionBuilder,
      $$RecorridosTableUpdateCompanionBuilder,
      (Recorrido, $$RecorridosTableReferences),
      Recorrido,
      PrefetchHooks Function({
        bool eventsRefs,
        bool recorridoShiftsRefs,
        bool recorridoSubscriptionsRefs,
      })
    >;
typedef $$EventsTableCreateCompanionBuilder =
    EventsCompanion Function({
      required String id,
      required String name,
      Value<String?> contactName,
      Value<String?> contact,
      Value<bool> repeat,
      Value<List<WeekDays>?> days,
      required DateTime startDateTime,
      required DateTime endDateTime,
      Value<DateTime?> stopRepeatingDateTime,
      required EventStates state,
      required EventTypes type,
      required bool isTrip,
      Value<bool> isSynced,
      Value<String?> recorridoId,
      Value<int> rowid,
    });
typedef $$EventsTableUpdateCompanionBuilder =
    EventsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> contactName,
      Value<String?> contact,
      Value<bool> repeat,
      Value<List<WeekDays>?> days,
      Value<DateTime> startDateTime,
      Value<DateTime> endDateTime,
      Value<DateTime?> stopRepeatingDateTime,
      Value<EventStates> state,
      Value<EventTypes> type,
      Value<bool> isTrip,
      Value<bool> isSynced,
      Value<String?> recorridoId,
      Value<int> rowid,
    });

final class $$EventsTableReferences
    extends BaseReferences<_$AppDatabase, $EventsTable, Event> {
  $$EventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RecorridosTable _recorridoIdTable(_$AppDatabase db) =>
      db.recorridos.createAlias(
        $_aliasNameGenerator(db.events.recorridoId, db.recorridos.id),
      );

  $$RecorridosTableProcessedTableManager? get recorridoId {
    final $_column = $_itemColumn<String>('recorrido_id');
    if ($_column == null) return null;
    final manager = $$RecorridosTableTableManager(
      $_db,
      $_db.recorridos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recorridoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$StopsTable, List<Stop>> _stopsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.stops,
    aliasName: $_aliasNameGenerator(db.events.id, db.stops.eventId),
  );

  $$StopsTableProcessedTableManager get stopsRefs {
    final manager = $$StopsTableTableManager(
      $_db,
      $_db.stops,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_stopsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EventChoferesTable, List<EventChofere>>
  _eventChoferesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventChoferes,
    aliasName: $_aliasNameGenerator(db.events.id, db.eventChoferes.eventId),
  );

  $$EventChoferesTableProcessedTableManager get eventChoferesRefs {
    final manager = $$EventChoferesTableTableManager(
      $_db,
      $_db.eventChoferes,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventChoferesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EventColectivosTable, List<EventColectivo>>
  _eventColectivosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventColectivos,
    aliasName: $_aliasNameGenerator(db.events.id, db.eventColectivos.eventId),
  );

  $$EventColectivosTableProcessedTableManager get eventColectivosRefs {
    final manager = $$EventColectivosTableTableManager(
      $_db,
      $_db.eventColectivos,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _eventColectivosRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EventsTableFilterComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get repeat => $composableBuilder(
    column: $table.repeat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<WeekDays>?, List<WeekDays>, String>
  get days => $composableBuilder(
    column: $table.days,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get startDateTime => $composableBuilder(
    column: $table.startDateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endDateTime => $composableBuilder(
    column: $table.endDateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get stopRepeatingDateTime => $composableBuilder(
    column: $table.stopRepeatingDateTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<EventStates, EventStates, int> get state =>
      $composableBuilder(
        column: $table.state,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<EventTypes, EventTypes, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get isTrip => $composableBuilder(
    column: $table.isTrip,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  $$RecorridosTableFilterComposer get recorridoId {
    final $$RecorridosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recorridoId,
      referencedTable: $db.recorridos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridosTableFilterComposer(
            $db: $db,
            $table: $db.recorridos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> stopsRefs(
    Expression<bool> Function($$StopsTableFilterComposer f) f,
  ) {
    final $$StopsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.stops,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StopsTableFilterComposer(
            $db: $db,
            $table: $db.stops,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> eventChoferesRefs(
    Expression<bool> Function($$EventChoferesTableFilterComposer f) f,
  ) {
    final $$EventChoferesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventChoferes,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventChoferesTableFilterComposer(
            $db: $db,
            $table: $db.eventChoferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> eventColectivosRefs(
    Expression<bool> Function($$EventColectivosTableFilterComposer f) f,
  ) {
    final $$EventColectivosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventColectivos,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventColectivosTableFilterComposer(
            $db: $db,
            $table: $db.eventColectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventsTableOrderingComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get repeat => $composableBuilder(
    column: $table.repeat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get days => $composableBuilder(
    column: $table.days,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startDateTime => $composableBuilder(
    column: $table.startDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endDateTime => $composableBuilder(
    column: $table.endDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get stopRepeatingDateTime => $composableBuilder(
    column: $table.stopRepeatingDateTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isTrip => $composableBuilder(
    column: $table.isTrip,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecorridosTableOrderingComposer get recorridoId {
    final $$RecorridosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recorridoId,
      referencedTable: $db.recorridos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridosTableOrderingComposer(
            $db: $db,
            $table: $db.recorridos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  GeneratedColumn<bool> get repeat =>
      $composableBuilder(column: $table.repeat, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<WeekDays>?, String> get days =>
      $composableBuilder(column: $table.days, builder: (column) => column);

  GeneratedColumn<DateTime> get startDateTime => $composableBuilder(
    column: $table.startDateTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get endDateTime => $composableBuilder(
    column: $table.endDateTime,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get stopRepeatingDateTime => $composableBuilder(
    column: $table.stopRepeatingDateTime,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<EventStates, int> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EventTypes, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isTrip =>
      $composableBuilder(column: $table.isTrip, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  $$RecorridosTableAnnotationComposer get recorridoId {
    final $$RecorridosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recorridoId,
      referencedTable: $db.recorridos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridosTableAnnotationComposer(
            $db: $db,
            $table: $db.recorridos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> stopsRefs<T extends Object>(
    Expression<T> Function($$StopsTableAnnotationComposer a) f,
  ) {
    final $$StopsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.stops,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StopsTableAnnotationComposer(
            $db: $db,
            $table: $db.stops,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> eventChoferesRefs<T extends Object>(
    Expression<T> Function($$EventChoferesTableAnnotationComposer a) f,
  ) {
    final $$EventChoferesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventChoferes,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventChoferesTableAnnotationComposer(
            $db: $db,
            $table: $db.eventChoferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> eventColectivosRefs<T extends Object>(
    Expression<T> Function($$EventColectivosTableAnnotationComposer a) f,
  ) {
    final $$EventColectivosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventColectivos,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventColectivosTableAnnotationComposer(
            $db: $db,
            $table: $db.eventColectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventsTable,
          Event,
          $$EventsTableFilterComposer,
          $$EventsTableOrderingComposer,
          $$EventsTableAnnotationComposer,
          $$EventsTableCreateCompanionBuilder,
          $$EventsTableUpdateCompanionBuilder,
          (Event, $$EventsTableReferences),
          Event,
          PrefetchHooks Function({
            bool recorridoId,
            bool stopsRefs,
            bool eventChoferesRefs,
            bool eventColectivosRefs,
          })
        > {
  $$EventsTableTableManager(_$AppDatabase db, $EventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> contactName = const Value.absent(),
                Value<String?> contact = const Value.absent(),
                Value<bool> repeat = const Value.absent(),
                Value<List<WeekDays>?> days = const Value.absent(),
                Value<DateTime> startDateTime = const Value.absent(),
                Value<DateTime> endDateTime = const Value.absent(),
                Value<DateTime?> stopRepeatingDateTime = const Value.absent(),
                Value<EventStates> state = const Value.absent(),
                Value<EventTypes> type = const Value.absent(),
                Value<bool> isTrip = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<String?> recorridoId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventsCompanion(
                id: id,
                name: name,
                contactName: contactName,
                contact: contact,
                repeat: repeat,
                days: days,
                startDateTime: startDateTime,
                endDateTime: endDateTime,
                stopRepeatingDateTime: stopRepeatingDateTime,
                state: state,
                type: type,
                isTrip: isTrip,
                isSynced: isSynced,
                recorridoId: recorridoId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> contactName = const Value.absent(),
                Value<String?> contact = const Value.absent(),
                Value<bool> repeat = const Value.absent(),
                Value<List<WeekDays>?> days = const Value.absent(),
                required DateTime startDateTime,
                required DateTime endDateTime,
                Value<DateTime?> stopRepeatingDateTime = const Value.absent(),
                required EventStates state,
                required EventTypes type,
                required bool isTrip,
                Value<bool> isSynced = const Value.absent(),
                Value<String?> recorridoId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventsCompanion.insert(
                id: id,
                name: name,
                contactName: contactName,
                contact: contact,
                repeat: repeat,
                days: days,
                startDateTime: startDateTime,
                endDateTime: endDateTime,
                stopRepeatingDateTime: stopRepeatingDateTime,
                state: state,
                type: type,
                isTrip: isTrip,
                isSynced: isSynced,
                recorridoId: recorridoId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$EventsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                recorridoId = false,
                stopsRefs = false,
                eventChoferesRefs = false,
                eventColectivosRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (stopsRefs) db.stops,
                    if (eventChoferesRefs) db.eventChoferes,
                    if (eventColectivosRefs) db.eventColectivos,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (recorridoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.recorridoId,
                                    referencedTable: $$EventsTableReferences
                                        ._recorridoIdTable(db),
                                    referencedColumn: $$EventsTableReferences
                                        ._recorridoIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (stopsRefs)
                        await $_getPrefetchedData<Event, $EventsTable, Stop>(
                          currentTable: table,
                          referencedTable: $$EventsTableReferences
                              ._stopsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EventsTableReferences(db, table, p0).stopsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.eventId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (eventChoferesRefs)
                        await $_getPrefetchedData<
                          Event,
                          $EventsTable,
                          EventChofere
                        >(
                          currentTable: table,
                          referencedTable: $$EventsTableReferences
                              ._eventChoferesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EventsTableReferences(
                                db,
                                table,
                                p0,
                              ).eventChoferesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.eventId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (eventColectivosRefs)
                        await $_getPrefetchedData<
                          Event,
                          $EventsTable,
                          EventColectivo
                        >(
                          currentTable: table,
                          referencedTable: $$EventsTableReferences
                              ._eventColectivosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EventsTableReferences(
                                db,
                                table,
                                p0,
                              ).eventColectivosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.eventId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventsTable,
      Event,
      $$EventsTableFilterComposer,
      $$EventsTableOrderingComposer,
      $$EventsTableAnnotationComposer,
      $$EventsTableCreateCompanionBuilder,
      $$EventsTableUpdateCompanionBuilder,
      (Event, $$EventsTableReferences),
      Event,
      PrefetchHooks Function({
        bool recorridoId,
        bool stopsRefs,
        bool eventChoferesRefs,
        bool eventColectivosRefs,
      })
    >;
typedef $$StopsTableCreateCompanionBuilder =
    StopsCompanion Function({
      required String id,
      required String name,
      Value<DateTime?> start,
      required String eventId,
      required int orderIndex,
      Value<int> rowid,
    });
typedef $$StopsTableUpdateCompanionBuilder =
    StopsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<DateTime?> start,
      Value<String> eventId,
      Value<int> orderIndex,
      Value<int> rowid,
    });

final class $$StopsTableReferences
    extends BaseReferences<_$AppDatabase, $StopsTable, Stop> {
  $$StopsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    $_aliasNameGenerator(db.stops.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StopsTableFilterComposer extends Composer<_$AppDatabase, $StopsTable> {
  $$StopsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get start => $composableBuilder(
    column: $table.start,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StopsTableOrderingComposer
    extends Composer<_$AppDatabase, $StopsTable> {
  $$StopsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get start => $composableBuilder(
    column: $table.start,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableOrderingComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StopsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StopsTable> {
  $$StopsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get start =>
      $composableBuilder(column: $table.start, builder: (column) => column);

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  $$EventsTableAnnotationComposer get eventId {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StopsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StopsTable,
          Stop,
          $$StopsTableFilterComposer,
          $$StopsTableOrderingComposer,
          $$StopsTableAnnotationComposer,
          $$StopsTableCreateCompanionBuilder,
          $$StopsTableUpdateCompanionBuilder,
          (Stop, $$StopsTableReferences),
          Stop,
          PrefetchHooks Function({bool eventId})
        > {
  $$StopsTableTableManager(_$AppDatabase db, $StopsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StopsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StopsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StopsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime?> start = const Value.absent(),
                Value<String> eventId = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StopsCompanion(
                id: id,
                name: name,
                start: start,
                eventId: eventId,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<DateTime?> start = const Value.absent(),
                required String eventId,
                required int orderIndex,
                Value<int> rowid = const Value.absent(),
              }) => StopsCompanion.insert(
                id: id,
                name: name,
                start: start,
                eventId: eventId,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$StopsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({eventId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (eventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.eventId,
                                referencedTable: $$StopsTableReferences
                                    ._eventIdTable(db),
                                referencedColumn: $$StopsTableReferences
                                    ._eventIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StopsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StopsTable,
      Stop,
      $$StopsTableFilterComposer,
      $$StopsTableOrderingComposer,
      $$StopsTableAnnotationComposer,
      $$StopsTableCreateCompanionBuilder,
      $$StopsTableUpdateCompanionBuilder,
      (Stop, $$StopsTableReferences),
      Stop,
      PrefetchHooks Function({bool eventId})
    >;
typedef $$EventChoferesTableCreateCompanionBuilder =
    EventChoferesCompanion Function({
      required String eventId,
      required String choferId,
      Value<int> rowid,
    });
typedef $$EventChoferesTableUpdateCompanionBuilder =
    EventChoferesCompanion Function({
      Value<String> eventId,
      Value<String> choferId,
      Value<int> rowid,
    });

final class $$EventChoferesTableReferences
    extends BaseReferences<_$AppDatabase, $EventChoferesTable, EventChofere> {
  $$EventChoferesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    $_aliasNameGenerator(db.eventChoferes.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ChoferesTable _choferIdTable(_$AppDatabase db) =>
      db.choferes.createAlias(
        $_aliasNameGenerator(db.eventChoferes.choferId, db.choferes.id),
      );

  $$ChoferesTableProcessedTableManager get choferId {
    final $_column = $_itemColumn<String>('chofer_id')!;

    final manager = $$ChoferesTableTableManager(
      $_db,
      $_db.choferes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_choferIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EventChoferesTableFilterComposer
    extends Composer<_$AppDatabase, $EventChoferesTable> {
  $$EventChoferesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChoferesTableFilterComposer get choferId {
    final $$ChoferesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.choferId,
      referencedTable: $db.choferes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChoferesTableFilterComposer(
            $db: $db,
            $table: $db.choferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventChoferesTableOrderingComposer
    extends Composer<_$AppDatabase, $EventChoferesTable> {
  $$EventChoferesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableOrderingComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChoferesTableOrderingComposer get choferId {
    final $$ChoferesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.choferId,
      referencedTable: $db.choferes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChoferesTableOrderingComposer(
            $db: $db,
            $table: $db.choferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventChoferesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventChoferesTable> {
  $$EventChoferesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableAnnotationComposer get eventId {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChoferesTableAnnotationComposer get choferId {
    final $$ChoferesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.choferId,
      referencedTable: $db.choferes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChoferesTableAnnotationComposer(
            $db: $db,
            $table: $db.choferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventChoferesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventChoferesTable,
          EventChofere,
          $$EventChoferesTableFilterComposer,
          $$EventChoferesTableOrderingComposer,
          $$EventChoferesTableAnnotationComposer,
          $$EventChoferesTableCreateCompanionBuilder,
          $$EventChoferesTableUpdateCompanionBuilder,
          (EventChofere, $$EventChoferesTableReferences),
          EventChofere,
          PrefetchHooks Function({bool eventId, bool choferId})
        > {
  $$EventChoferesTableTableManager(_$AppDatabase db, $EventChoferesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventChoferesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventChoferesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventChoferesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> eventId = const Value.absent(),
                Value<String> choferId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventChoferesCompanion(
                eventId: eventId,
                choferId: choferId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String eventId,
                required String choferId,
                Value<int> rowid = const Value.absent(),
              }) => EventChoferesCompanion.insert(
                eventId: eventId,
                choferId: choferId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EventChoferesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({eventId = false, choferId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (eventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.eventId,
                                referencedTable: $$EventChoferesTableReferences
                                    ._eventIdTable(db),
                                referencedColumn: $$EventChoferesTableReferences
                                    ._eventIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (choferId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.choferId,
                                referencedTable: $$EventChoferesTableReferences
                                    ._choferIdTable(db),
                                referencedColumn: $$EventChoferesTableReferences
                                    ._choferIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EventChoferesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventChoferesTable,
      EventChofere,
      $$EventChoferesTableFilterComposer,
      $$EventChoferesTableOrderingComposer,
      $$EventChoferesTableAnnotationComposer,
      $$EventChoferesTableCreateCompanionBuilder,
      $$EventChoferesTableUpdateCompanionBuilder,
      (EventChofere, $$EventChoferesTableReferences),
      EventChofere,
      PrefetchHooks Function({bool eventId, bool choferId})
    >;
typedef $$EventColectivosTableCreateCompanionBuilder =
    EventColectivosCompanion Function({
      required String eventId,
      required String colectivoId,
      Value<int> rowid,
    });
typedef $$EventColectivosTableUpdateCompanionBuilder =
    EventColectivosCompanion Function({
      Value<String> eventId,
      Value<String> colectivoId,
      Value<int> rowid,
    });

final class $$EventColectivosTableReferences
    extends
        BaseReferences<_$AppDatabase, $EventColectivosTable, EventColectivo> {
  $$EventColectivosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    $_aliasNameGenerator(db.eventColectivos.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ColectivosTable _colectivoIdTable(_$AppDatabase db) =>
      db.colectivos.createAlias(
        $_aliasNameGenerator(db.eventColectivos.colectivoId, db.colectivos.id),
      );

  $$ColectivosTableProcessedTableManager get colectivoId {
    final $_column = $_itemColumn<String>('colectivo_id')!;

    final manager = $$ColectivosTableTableManager(
      $_db,
      $_db.colectivos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_colectivoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EventColectivosTableFilterComposer
    extends Composer<_$AppDatabase, $EventColectivosTable> {
  $$EventColectivosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableFilterComposer get eventId {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ColectivosTableFilterComposer get colectivoId {
    final $$ColectivosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.colectivoId,
      referencedTable: $db.colectivos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ColectivosTableFilterComposer(
            $db: $db,
            $table: $db.colectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventColectivosTableOrderingComposer
    extends Composer<_$AppDatabase, $EventColectivosTable> {
  $$EventColectivosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableOrderingComposer get eventId {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableOrderingComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ColectivosTableOrderingComposer get colectivoId {
    final $$ColectivosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.colectivoId,
      referencedTable: $db.colectivos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ColectivosTableOrderingComposer(
            $db: $db,
            $table: $db.colectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventColectivosTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventColectivosTable> {
  $$EventColectivosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableAnnotationComposer get eventId {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ColectivosTableAnnotationComposer get colectivoId {
    final $$ColectivosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.colectivoId,
      referencedTable: $db.colectivos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ColectivosTableAnnotationComposer(
            $db: $db,
            $table: $db.colectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventColectivosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventColectivosTable,
          EventColectivo,
          $$EventColectivosTableFilterComposer,
          $$EventColectivosTableOrderingComposer,
          $$EventColectivosTableAnnotationComposer,
          $$EventColectivosTableCreateCompanionBuilder,
          $$EventColectivosTableUpdateCompanionBuilder,
          (EventColectivo, $$EventColectivosTableReferences),
          EventColectivo,
          PrefetchHooks Function({bool eventId, bool colectivoId})
        > {
  $$EventColectivosTableTableManager(
    _$AppDatabase db,
    $EventColectivosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventColectivosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventColectivosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventColectivosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> eventId = const Value.absent(),
                Value<String> colectivoId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventColectivosCompanion(
                eventId: eventId,
                colectivoId: colectivoId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String eventId,
                required String colectivoId,
                Value<int> rowid = const Value.absent(),
              }) => EventColectivosCompanion.insert(
                eventId: eventId,
                colectivoId: colectivoId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EventColectivosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({eventId = false, colectivoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (eventId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.eventId,
                                referencedTable:
                                    $$EventColectivosTableReferences
                                        ._eventIdTable(db),
                                referencedColumn:
                                    $$EventColectivosTableReferences
                                        ._eventIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (colectivoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.colectivoId,
                                referencedTable:
                                    $$EventColectivosTableReferences
                                        ._colectivoIdTable(db),
                                referencedColumn:
                                    $$EventColectivosTableReferences
                                        ._colectivoIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EventColectivosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventColectivosTable,
      EventColectivo,
      $$EventColectivosTableFilterComposer,
      $$EventColectivosTableOrderingComposer,
      $$EventColectivosTableAnnotationComposer,
      $$EventColectivosTableCreateCompanionBuilder,
      $$EventColectivosTableUpdateCompanionBuilder,
      (EventColectivo, $$EventColectivosTableReferences),
      EventColectivo,
      PrefetchHooks Function({bool eventId, bool colectivoId})
    >;
typedef $$RecorridoShiftsTableCreateCompanionBuilder =
    RecorridoShiftsCompanion Function({
      required String id,
      required String recorridoId,
      required List<WeekDays> weekDay,
      required DateTime startTime,
      required DateTime endTime,
      required String shiftName,
      Value<bool> isActive,
      Value<int> rowid,
    });
typedef $$RecorridoShiftsTableUpdateCompanionBuilder =
    RecorridoShiftsCompanion Function({
      Value<String> id,
      Value<String> recorridoId,
      Value<List<WeekDays>> weekDay,
      Value<DateTime> startTime,
      Value<DateTime> endTime,
      Value<String> shiftName,
      Value<bool> isActive,
      Value<int> rowid,
    });

final class $$RecorridoShiftsTableReferences
    extends
        BaseReferences<_$AppDatabase, $RecorridoShiftsTable, RecorridoShift> {
  $$RecorridoShiftsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecorridosTable _recorridoIdTable(_$AppDatabase db) =>
      db.recorridos.createAlias(
        $_aliasNameGenerator(db.recorridoShifts.recorridoId, db.recorridos.id),
      );

  $$RecorridosTableProcessedTableManager get recorridoId {
    final $_column = $_itemColumn<String>('recorrido_id')!;

    final manager = $$RecorridosTableTableManager(
      $_db,
      $_db.recorridos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recorridoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ShiftChoferesTable, List<ShiftChofere>>
  _shiftChoferesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.shiftChoferes,
    aliasName: $_aliasNameGenerator(
      db.recorridoShifts.id,
      db.shiftChoferes.shiftId,
    ),
  );

  $$ShiftChoferesTableProcessedTableManager get shiftChoferesRefs {
    final manager = $$ShiftChoferesTableTableManager(
      $_db,
      $_db.shiftChoferes,
    ).filter((f) => f.shiftId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_shiftChoferesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ShiftColectivosTable, List<ShiftColectivo>>
  _shiftColectivosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.shiftColectivos,
    aliasName: $_aliasNameGenerator(
      db.recorridoShifts.id,
      db.shiftColectivos.shiftId,
    ),
  );

  $$ShiftColectivosTableProcessedTableManager get shiftColectivosRefs {
    final manager = $$ShiftColectivosTableTableManager(
      $_db,
      $_db.shiftColectivos,
    ).filter((f) => f.shiftId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _shiftColectivosRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecorridoShiftsTableFilterComposer
    extends Composer<_$AppDatabase, $RecorridoShiftsTable> {
  $$RecorridoShiftsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<WeekDays>, List<WeekDays>, String>
  get weekDay => $composableBuilder(
    column: $table.weekDay,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shiftName => $composableBuilder(
    column: $table.shiftName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  $$RecorridosTableFilterComposer get recorridoId {
    final $$RecorridosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recorridoId,
      referencedTable: $db.recorridos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridosTableFilterComposer(
            $db: $db,
            $table: $db.recorridos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> shiftChoferesRefs(
    Expression<bool> Function($$ShiftChoferesTableFilterComposer f) f,
  ) {
    final $$ShiftChoferesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shiftChoferes,
      getReferencedColumn: (t) => t.shiftId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShiftChoferesTableFilterComposer(
            $db: $db,
            $table: $db.shiftChoferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> shiftColectivosRefs(
    Expression<bool> Function($$ShiftColectivosTableFilterComposer f) f,
  ) {
    final $$ShiftColectivosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shiftColectivos,
      getReferencedColumn: (t) => t.shiftId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShiftColectivosTableFilterComposer(
            $db: $db,
            $table: $db.shiftColectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecorridoShiftsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecorridoShiftsTable> {
  $$RecorridoShiftsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weekDay => $composableBuilder(
    column: $table.weekDay,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shiftName => $composableBuilder(
    column: $table.shiftName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecorridosTableOrderingComposer get recorridoId {
    final $$RecorridosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recorridoId,
      referencedTable: $db.recorridos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridosTableOrderingComposer(
            $db: $db,
            $table: $db.recorridos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecorridoShiftsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecorridoShiftsTable> {
  $$RecorridoShiftsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<WeekDays>, String> get weekDay =>
      $composableBuilder(column: $table.weekDay, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get shiftName =>
      $composableBuilder(column: $table.shiftName, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$RecorridosTableAnnotationComposer get recorridoId {
    final $$RecorridosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recorridoId,
      referencedTable: $db.recorridos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridosTableAnnotationComposer(
            $db: $db,
            $table: $db.recorridos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> shiftChoferesRefs<T extends Object>(
    Expression<T> Function($$ShiftChoferesTableAnnotationComposer a) f,
  ) {
    final $$ShiftChoferesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shiftChoferes,
      getReferencedColumn: (t) => t.shiftId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShiftChoferesTableAnnotationComposer(
            $db: $db,
            $table: $db.shiftChoferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> shiftColectivosRefs<T extends Object>(
    Expression<T> Function($$ShiftColectivosTableAnnotationComposer a) f,
  ) {
    final $$ShiftColectivosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shiftColectivos,
      getReferencedColumn: (t) => t.shiftId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShiftColectivosTableAnnotationComposer(
            $db: $db,
            $table: $db.shiftColectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecorridoShiftsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecorridoShiftsTable,
          RecorridoShift,
          $$RecorridoShiftsTableFilterComposer,
          $$RecorridoShiftsTableOrderingComposer,
          $$RecorridoShiftsTableAnnotationComposer,
          $$RecorridoShiftsTableCreateCompanionBuilder,
          $$RecorridoShiftsTableUpdateCompanionBuilder,
          (RecorridoShift, $$RecorridoShiftsTableReferences),
          RecorridoShift,
          PrefetchHooks Function({
            bool recorridoId,
            bool shiftChoferesRefs,
            bool shiftColectivosRefs,
          })
        > {
  $$RecorridoShiftsTableTableManager(
    _$AppDatabase db,
    $RecorridoShiftsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecorridoShiftsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecorridoShiftsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecorridoShiftsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> recorridoId = const Value.absent(),
                Value<List<WeekDays>> weekDay = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime> endTime = const Value.absent(),
                Value<String> shiftName = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecorridoShiftsCompanion(
                id: id,
                recorridoId: recorridoId,
                weekDay: weekDay,
                startTime: startTime,
                endTime: endTime,
                shiftName: shiftName,
                isActive: isActive,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String recorridoId,
                required List<WeekDays> weekDay,
                required DateTime startTime,
                required DateTime endTime,
                required String shiftName,
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecorridoShiftsCompanion.insert(
                id: id,
                recorridoId: recorridoId,
                weekDay: weekDay,
                startTime: startTime,
                endTime: endTime,
                shiftName: shiftName,
                isActive: isActive,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecorridoShiftsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                recorridoId = false,
                shiftChoferesRefs = false,
                shiftColectivosRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (shiftChoferesRefs) db.shiftChoferes,
                    if (shiftColectivosRefs) db.shiftColectivos,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (recorridoId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.recorridoId,
                                    referencedTable:
                                        $$RecorridoShiftsTableReferences
                                            ._recorridoIdTable(db),
                                    referencedColumn:
                                        $$RecorridoShiftsTableReferences
                                            ._recorridoIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (shiftChoferesRefs)
                        await $_getPrefetchedData<
                          RecorridoShift,
                          $RecorridoShiftsTable,
                          ShiftChofere
                        >(
                          currentTable: table,
                          referencedTable: $$RecorridoShiftsTableReferences
                              ._shiftChoferesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecorridoShiftsTableReferences(
                                db,
                                table,
                                p0,
                              ).shiftChoferesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.shiftId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shiftColectivosRefs)
                        await $_getPrefetchedData<
                          RecorridoShift,
                          $RecorridoShiftsTable,
                          ShiftColectivo
                        >(
                          currentTable: table,
                          referencedTable: $$RecorridoShiftsTableReferences
                              ._shiftColectivosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecorridoShiftsTableReferences(
                                db,
                                table,
                                p0,
                              ).shiftColectivosRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.shiftId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RecorridoShiftsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecorridoShiftsTable,
      RecorridoShift,
      $$RecorridoShiftsTableFilterComposer,
      $$RecorridoShiftsTableOrderingComposer,
      $$RecorridoShiftsTableAnnotationComposer,
      $$RecorridoShiftsTableCreateCompanionBuilder,
      $$RecorridoShiftsTableUpdateCompanionBuilder,
      (RecorridoShift, $$RecorridoShiftsTableReferences),
      RecorridoShift,
      PrefetchHooks Function({
        bool recorridoId,
        bool shiftChoferesRefs,
        bool shiftColectivosRefs,
      })
    >;
typedef $$ShiftChoferesTableCreateCompanionBuilder =
    ShiftChoferesCompanion Function({
      required String shiftId,
      required String choferId,
      Value<int> rowid,
    });
typedef $$ShiftChoferesTableUpdateCompanionBuilder =
    ShiftChoferesCompanion Function({
      Value<String> shiftId,
      Value<String> choferId,
      Value<int> rowid,
    });

final class $$ShiftChoferesTableReferences
    extends BaseReferences<_$AppDatabase, $ShiftChoferesTable, ShiftChofere> {
  $$ShiftChoferesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecorridoShiftsTable _shiftIdTable(_$AppDatabase db) =>
      db.recorridoShifts.createAlias(
        $_aliasNameGenerator(db.shiftChoferes.shiftId, db.recorridoShifts.id),
      );

  $$RecorridoShiftsTableProcessedTableManager get shiftId {
    final $_column = $_itemColumn<String>('shift_id')!;

    final manager = $$RecorridoShiftsTableTableManager(
      $_db,
      $_db.recorridoShifts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shiftIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ChoferesTable _choferIdTable(_$AppDatabase db) =>
      db.choferes.createAlias(
        $_aliasNameGenerator(db.shiftChoferes.choferId, db.choferes.id),
      );

  $$ChoferesTableProcessedTableManager get choferId {
    final $_column = $_itemColumn<String>('chofer_id')!;

    final manager = $$ChoferesTableTableManager(
      $_db,
      $_db.choferes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_choferIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShiftChoferesTableFilterComposer
    extends Composer<_$AppDatabase, $ShiftChoferesTable> {
  $$ShiftChoferesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RecorridoShiftsTableFilterComposer get shiftId {
    final $$RecorridoShiftsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
      referencedTable: $db.recorridoShifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridoShiftsTableFilterComposer(
            $db: $db,
            $table: $db.recorridoShifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChoferesTableFilterComposer get choferId {
    final $$ChoferesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.choferId,
      referencedTable: $db.choferes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChoferesTableFilterComposer(
            $db: $db,
            $table: $db.choferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShiftChoferesTableOrderingComposer
    extends Composer<_$AppDatabase, $ShiftChoferesTable> {
  $$ShiftChoferesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RecorridoShiftsTableOrderingComposer get shiftId {
    final $$RecorridoShiftsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
      referencedTable: $db.recorridoShifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridoShiftsTableOrderingComposer(
            $db: $db,
            $table: $db.recorridoShifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChoferesTableOrderingComposer get choferId {
    final $$ChoferesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.choferId,
      referencedTable: $db.choferes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChoferesTableOrderingComposer(
            $db: $db,
            $table: $db.choferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShiftChoferesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShiftChoferesTable> {
  $$ShiftChoferesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RecorridoShiftsTableAnnotationComposer get shiftId {
    final $$RecorridoShiftsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
      referencedTable: $db.recorridoShifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridoShiftsTableAnnotationComposer(
            $db: $db,
            $table: $db.recorridoShifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ChoferesTableAnnotationComposer get choferId {
    final $$ChoferesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.choferId,
      referencedTable: $db.choferes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChoferesTableAnnotationComposer(
            $db: $db,
            $table: $db.choferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShiftChoferesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShiftChoferesTable,
          ShiftChofere,
          $$ShiftChoferesTableFilterComposer,
          $$ShiftChoferesTableOrderingComposer,
          $$ShiftChoferesTableAnnotationComposer,
          $$ShiftChoferesTableCreateCompanionBuilder,
          $$ShiftChoferesTableUpdateCompanionBuilder,
          (ShiftChofere, $$ShiftChoferesTableReferences),
          ShiftChofere,
          PrefetchHooks Function({bool shiftId, bool choferId})
        > {
  $$ShiftChoferesTableTableManager(_$AppDatabase db, $ShiftChoferesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShiftChoferesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShiftChoferesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShiftChoferesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> shiftId = const Value.absent(),
                Value<String> choferId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ShiftChoferesCompanion(
                shiftId: shiftId,
                choferId: choferId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String shiftId,
                required String choferId,
                Value<int> rowid = const Value.absent(),
              }) => ShiftChoferesCompanion.insert(
                shiftId: shiftId,
                choferId: choferId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShiftChoferesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({shiftId = false, choferId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (shiftId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.shiftId,
                                referencedTable: $$ShiftChoferesTableReferences
                                    ._shiftIdTable(db),
                                referencedColumn: $$ShiftChoferesTableReferences
                                    ._shiftIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (choferId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.choferId,
                                referencedTable: $$ShiftChoferesTableReferences
                                    ._choferIdTable(db),
                                referencedColumn: $$ShiftChoferesTableReferences
                                    ._choferIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ShiftChoferesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShiftChoferesTable,
      ShiftChofere,
      $$ShiftChoferesTableFilterComposer,
      $$ShiftChoferesTableOrderingComposer,
      $$ShiftChoferesTableAnnotationComposer,
      $$ShiftChoferesTableCreateCompanionBuilder,
      $$ShiftChoferesTableUpdateCompanionBuilder,
      (ShiftChofere, $$ShiftChoferesTableReferences),
      ShiftChofere,
      PrefetchHooks Function({bool shiftId, bool choferId})
    >;
typedef $$ShiftColectivosTableCreateCompanionBuilder =
    ShiftColectivosCompanion Function({
      required String shiftId,
      required String colectivoId,
      Value<int> rowid,
    });
typedef $$ShiftColectivosTableUpdateCompanionBuilder =
    ShiftColectivosCompanion Function({
      Value<String> shiftId,
      Value<String> colectivoId,
      Value<int> rowid,
    });

final class $$ShiftColectivosTableReferences
    extends
        BaseReferences<_$AppDatabase, $ShiftColectivosTable, ShiftColectivo> {
  $$ShiftColectivosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecorridoShiftsTable _shiftIdTable(_$AppDatabase db) =>
      db.recorridoShifts.createAlias(
        $_aliasNameGenerator(db.shiftColectivos.shiftId, db.recorridoShifts.id),
      );

  $$RecorridoShiftsTableProcessedTableManager get shiftId {
    final $_column = $_itemColumn<String>('shift_id')!;

    final manager = $$RecorridoShiftsTableTableManager(
      $_db,
      $_db.recorridoShifts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shiftIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ColectivosTable _colectivoIdTable(_$AppDatabase db) =>
      db.colectivos.createAlias(
        $_aliasNameGenerator(db.shiftColectivos.colectivoId, db.colectivos.id),
      );

  $$ColectivosTableProcessedTableManager get colectivoId {
    final $_column = $_itemColumn<String>('colectivo_id')!;

    final manager = $$ColectivosTableTableManager(
      $_db,
      $_db.colectivos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_colectivoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShiftColectivosTableFilterComposer
    extends Composer<_$AppDatabase, $ShiftColectivosTable> {
  $$ShiftColectivosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RecorridoShiftsTableFilterComposer get shiftId {
    final $$RecorridoShiftsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
      referencedTable: $db.recorridoShifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridoShiftsTableFilterComposer(
            $db: $db,
            $table: $db.recorridoShifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ColectivosTableFilterComposer get colectivoId {
    final $$ColectivosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.colectivoId,
      referencedTable: $db.colectivos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ColectivosTableFilterComposer(
            $db: $db,
            $table: $db.colectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShiftColectivosTableOrderingComposer
    extends Composer<_$AppDatabase, $ShiftColectivosTable> {
  $$ShiftColectivosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RecorridoShiftsTableOrderingComposer get shiftId {
    final $$RecorridoShiftsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
      referencedTable: $db.recorridoShifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridoShiftsTableOrderingComposer(
            $db: $db,
            $table: $db.recorridoShifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ColectivosTableOrderingComposer get colectivoId {
    final $$ColectivosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.colectivoId,
      referencedTable: $db.colectivos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ColectivosTableOrderingComposer(
            $db: $db,
            $table: $db.colectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShiftColectivosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShiftColectivosTable> {
  $$ShiftColectivosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$RecorridoShiftsTableAnnotationComposer get shiftId {
    final $$RecorridoShiftsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
      referencedTable: $db.recorridoShifts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridoShiftsTableAnnotationComposer(
            $db: $db,
            $table: $db.recorridoShifts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ColectivosTableAnnotationComposer get colectivoId {
    final $$ColectivosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.colectivoId,
      referencedTable: $db.colectivos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ColectivosTableAnnotationComposer(
            $db: $db,
            $table: $db.colectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShiftColectivosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShiftColectivosTable,
          ShiftColectivo,
          $$ShiftColectivosTableFilterComposer,
          $$ShiftColectivosTableOrderingComposer,
          $$ShiftColectivosTableAnnotationComposer,
          $$ShiftColectivosTableCreateCompanionBuilder,
          $$ShiftColectivosTableUpdateCompanionBuilder,
          (ShiftColectivo, $$ShiftColectivosTableReferences),
          ShiftColectivo,
          PrefetchHooks Function({bool shiftId, bool colectivoId})
        > {
  $$ShiftColectivosTableTableManager(
    _$AppDatabase db,
    $ShiftColectivosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShiftColectivosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShiftColectivosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShiftColectivosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> shiftId = const Value.absent(),
                Value<String> colectivoId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ShiftColectivosCompanion(
                shiftId: shiftId,
                colectivoId: colectivoId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String shiftId,
                required String colectivoId,
                Value<int> rowid = const Value.absent(),
              }) => ShiftColectivosCompanion.insert(
                shiftId: shiftId,
                colectivoId: colectivoId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShiftColectivosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({shiftId = false, colectivoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (shiftId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.shiftId,
                                referencedTable:
                                    $$ShiftColectivosTableReferences
                                        ._shiftIdTable(db),
                                referencedColumn:
                                    $$ShiftColectivosTableReferences
                                        ._shiftIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (colectivoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.colectivoId,
                                referencedTable:
                                    $$ShiftColectivosTableReferences
                                        ._colectivoIdTable(db),
                                referencedColumn:
                                    $$ShiftColectivosTableReferences
                                        ._colectivoIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ShiftColectivosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShiftColectivosTable,
      ShiftColectivo,
      $$ShiftColectivosTableFilterComposer,
      $$ShiftColectivosTableOrderingComposer,
      $$ShiftColectivosTableAnnotationComposer,
      $$ShiftColectivosTableCreateCompanionBuilder,
      $$ShiftColectivosTableUpdateCompanionBuilder,
      (ShiftColectivo, $$ShiftColectivosTableReferences),
      ShiftColectivo,
      PrefetchHooks Function({bool shiftId, bool colectivoId})
    >;
typedef $$EncargadosTableCreateCompanionBuilder =
    EncargadosCompanion Function({
      required String id,
      required String name,
      Value<String?> phone,
      Value<double> balance,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$EncargadosTableUpdateCompanionBuilder =
    EncargadosCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String?> phone,
      Value<double> balance,
      Value<bool> isSynced,
      Value<int> rowid,
    });

final class $$EncargadosTableReferences
    extends BaseReferences<_$AppDatabase, $EncargadosTable, Encargado> {
  $$EncargadosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<
    $RecorridoSubscriptionsTable,
    List<RecorridoSubscription>
  >
  _recorridoSubscriptionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recorridoSubscriptions,
        aliasName: $_aliasNameGenerator(
          db.encargados.id,
          db.recorridoSubscriptions.encargadoId,
        ),
      );

  $$RecorridoSubscriptionsTableProcessedTableManager
  get recorridoSubscriptionsRefs {
    final manager = $$RecorridoSubscriptionsTableTableManager(
      $_db,
      $_db.recorridoSubscriptions,
    ).filter((f) => f.encargadoId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recorridoSubscriptionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EncargadosTableFilterComposer
    extends Composer<_$AppDatabase, $EncargadosTable> {
  $$EncargadosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recorridoSubscriptionsRefs(
    Expression<bool> Function($$RecorridoSubscriptionsTableFilterComposer f) f,
  ) {
    final $$RecorridoSubscriptionsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recorridoSubscriptions,
          getReferencedColumn: (t) => t.encargadoId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecorridoSubscriptionsTableFilterComposer(
                $db: $db,
                $table: $db.recorridoSubscriptions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$EncargadosTableOrderingComposer
    extends Composer<_$AppDatabase, $EncargadosTable> {
  $$EncargadosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EncargadosTableAnnotationComposer
    extends Composer<_$AppDatabase, $EncargadosTable> {
  $$EncargadosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<double> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  Expression<T> recorridoSubscriptionsRefs<T extends Object>(
    Expression<T> Function($$RecorridoSubscriptionsTableAnnotationComposer a) f,
  ) {
    final $$RecorridoSubscriptionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recorridoSubscriptions,
          getReferencedColumn: (t) => t.encargadoId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecorridoSubscriptionsTableAnnotationComposer(
                $db: $db,
                $table: $db.recorridoSubscriptions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$EncargadosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EncargadosTable,
          Encargado,
          $$EncargadosTableFilterComposer,
          $$EncargadosTableOrderingComposer,
          $$EncargadosTableAnnotationComposer,
          $$EncargadosTableCreateCompanionBuilder,
          $$EncargadosTableUpdateCompanionBuilder,
          (Encargado, $$EncargadosTableReferences),
          Encargado,
          PrefetchHooks Function({bool recorridoSubscriptionsRefs})
        > {
  $$EncargadosTableTableManager(_$AppDatabase db, $EncargadosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EncargadosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EncargadosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EncargadosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> phone = const Value.absent(),
                Value<double> balance = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EncargadosCompanion(
                id: id,
                name: name,
                phone: phone,
                balance: balance,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                Value<String?> phone = const Value.absent(),
                Value<double> balance = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EncargadosCompanion.insert(
                id: id,
                name: name,
                phone: phone,
                balance: balance,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EncargadosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recorridoSubscriptionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recorridoSubscriptionsRefs) db.recorridoSubscriptions,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recorridoSubscriptionsRefs)
                    await $_getPrefetchedData<
                      Encargado,
                      $EncargadosTable,
                      RecorridoSubscription
                    >(
                      currentTable: table,
                      referencedTable: $$EncargadosTableReferences
                          ._recorridoSubscriptionsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$EncargadosTableReferences(
                            db,
                            table,
                            p0,
                          ).recorridoSubscriptionsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.encargadoId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$EncargadosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EncargadosTable,
      Encargado,
      $$EncargadosTableFilterComposer,
      $$EncargadosTableOrderingComposer,
      $$EncargadosTableAnnotationComposer,
      $$EncargadosTableCreateCompanionBuilder,
      $$EncargadosTableUpdateCompanionBuilder,
      (Encargado, $$EncargadosTableReferences),
      Encargado,
      PrefetchHooks Function({bool recorridoSubscriptionsRefs})
    >;
typedef $$RecorridoSubscriptionsTableCreateCompanionBuilder =
    RecorridoSubscriptionsCompanion Function({
      required String id,
      required String recorridoId,
      required String encargadoId,
      required String subscriptionName,
      Value<String?> address,
      Value<int?> customPrice,
      Value<bool> isActive,
      Value<int> rowid,
    });
typedef $$RecorridoSubscriptionsTableUpdateCompanionBuilder =
    RecorridoSubscriptionsCompanion Function({
      Value<String> id,
      Value<String> recorridoId,
      Value<String> encargadoId,
      Value<String> subscriptionName,
      Value<String?> address,
      Value<int?> customPrice,
      Value<bool> isActive,
      Value<int> rowid,
    });

final class $$RecorridoSubscriptionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecorridoSubscriptionsTable,
          RecorridoSubscription
        > {
  $$RecorridoSubscriptionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecorridosTable _recorridoIdTable(_$AppDatabase db) =>
      db.recorridos.createAlias(
        $_aliasNameGenerator(
          db.recorridoSubscriptions.recorridoId,
          db.recorridos.id,
        ),
      );

  $$RecorridosTableProcessedTableManager get recorridoId {
    final $_column = $_itemColumn<String>('recorrido_id')!;

    final manager = $$RecorridosTableTableManager(
      $_db,
      $_db.recorridos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recorridoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EncargadosTable _encargadoIdTable(_$AppDatabase db) =>
      db.encargados.createAlias(
        $_aliasNameGenerator(
          db.recorridoSubscriptions.encargadoId,
          db.encargados.id,
        ),
      );

  $$EncargadosTableProcessedTableManager get encargadoId {
    final $_column = $_itemColumn<String>('encargado_id')!;

    final manager = $$EncargadosTableTableManager(
      $_db,
      $_db.encargados,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_encargadoIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecorridoSubscriptionsTableFilterComposer
    extends Composer<_$AppDatabase, $RecorridoSubscriptionsTable> {
  $$RecorridoSubscriptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get subscriptionName => $composableBuilder(
    column: $table.subscriptionName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get customPrice => $composableBuilder(
    column: $table.customPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  $$RecorridosTableFilterComposer get recorridoId {
    final $$RecorridosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recorridoId,
      referencedTable: $db.recorridos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridosTableFilterComposer(
            $db: $db,
            $table: $db.recorridos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EncargadosTableFilterComposer get encargadoId {
    final $$EncargadosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.encargadoId,
      referencedTable: $db.encargados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EncargadosTableFilterComposer(
            $db: $db,
            $table: $db.encargados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecorridoSubscriptionsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecorridoSubscriptionsTable> {
  $$RecorridoSubscriptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get subscriptionName => $composableBuilder(
    column: $table.subscriptionName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get customPrice => $composableBuilder(
    column: $table.customPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecorridosTableOrderingComposer get recorridoId {
    final $$RecorridosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recorridoId,
      referencedTable: $db.recorridos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridosTableOrderingComposer(
            $db: $db,
            $table: $db.recorridos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EncargadosTableOrderingComposer get encargadoId {
    final $$EncargadosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.encargadoId,
      referencedTable: $db.encargados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EncargadosTableOrderingComposer(
            $db: $db,
            $table: $db.encargados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecorridoSubscriptionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecorridoSubscriptionsTable> {
  $$RecorridoSubscriptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get subscriptionName => $composableBuilder(
    column: $table.subscriptionName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<int> get customPrice => $composableBuilder(
    column: $table.customPrice,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  $$RecorridosTableAnnotationComposer get recorridoId {
    final $$RecorridosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recorridoId,
      referencedTable: $db.recorridos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecorridosTableAnnotationComposer(
            $db: $db,
            $table: $db.recorridos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EncargadosTableAnnotationComposer get encargadoId {
    final $$EncargadosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.encargadoId,
      referencedTable: $db.encargados,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EncargadosTableAnnotationComposer(
            $db: $db,
            $table: $db.encargados,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecorridoSubscriptionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecorridoSubscriptionsTable,
          RecorridoSubscription,
          $$RecorridoSubscriptionsTableFilterComposer,
          $$RecorridoSubscriptionsTableOrderingComposer,
          $$RecorridoSubscriptionsTableAnnotationComposer,
          $$RecorridoSubscriptionsTableCreateCompanionBuilder,
          $$RecorridoSubscriptionsTableUpdateCompanionBuilder,
          (RecorridoSubscription, $$RecorridoSubscriptionsTableReferences),
          RecorridoSubscription,
          PrefetchHooks Function({bool recorridoId, bool encargadoId})
        > {
  $$RecorridoSubscriptionsTableTableManager(
    _$AppDatabase db,
    $RecorridoSubscriptionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecorridoSubscriptionsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$RecorridoSubscriptionsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RecorridoSubscriptionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> recorridoId = const Value.absent(),
                Value<String> encargadoId = const Value.absent(),
                Value<String> subscriptionName = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<int?> customPrice = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecorridoSubscriptionsCompanion(
                id: id,
                recorridoId: recorridoId,
                encargadoId: encargadoId,
                subscriptionName: subscriptionName,
                address: address,
                customPrice: customPrice,
                isActive: isActive,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String recorridoId,
                required String encargadoId,
                required String subscriptionName,
                Value<String?> address = const Value.absent(),
                Value<int?> customPrice = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecorridoSubscriptionsCompanion.insert(
                id: id,
                recorridoId: recorridoId,
                encargadoId: encargadoId,
                subscriptionName: subscriptionName,
                address: address,
                customPrice: customPrice,
                isActive: isActive,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecorridoSubscriptionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recorridoId = false, encargadoId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (recorridoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recorridoId,
                                referencedTable:
                                    $$RecorridoSubscriptionsTableReferences
                                        ._recorridoIdTable(db),
                                referencedColumn:
                                    $$RecorridoSubscriptionsTableReferences
                                        ._recorridoIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (encargadoId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.encargadoId,
                                referencedTable:
                                    $$RecorridoSubscriptionsTableReferences
                                        ._encargadoIdTable(db),
                                referencedColumn:
                                    $$RecorridoSubscriptionsTableReferences
                                        ._encargadoIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RecorridoSubscriptionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecorridoSubscriptionsTable,
      RecorridoSubscription,
      $$RecorridoSubscriptionsTableFilterComposer,
      $$RecorridoSubscriptionsTableOrderingComposer,
      $$RecorridoSubscriptionsTableAnnotationComposer,
      $$RecorridoSubscriptionsTableCreateCompanionBuilder,
      $$RecorridoSubscriptionsTableUpdateCompanionBuilder,
      (RecorridoSubscription, $$RecorridoSubscriptionsTableReferences),
      RecorridoSubscription,
      PrefetchHooks Function({bool recorridoId, bool encargadoId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ChoferesTableTableManager get choferes =>
      $$ChoferesTableTableManager(_db, _db.choferes);
  $$ColectivosTableTableManager get colectivos =>
      $$ColectivosTableTableManager(_db, _db.colectivos);
  $$RecorridosTableTableManager get recorridos =>
      $$RecorridosTableTableManager(_db, _db.recorridos);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db, _db.events);
  $$StopsTableTableManager get stops =>
      $$StopsTableTableManager(_db, _db.stops);
  $$EventChoferesTableTableManager get eventChoferes =>
      $$EventChoferesTableTableManager(_db, _db.eventChoferes);
  $$EventColectivosTableTableManager get eventColectivos =>
      $$EventColectivosTableTableManager(_db, _db.eventColectivos);
  $$RecorridoShiftsTableTableManager get recorridoShifts =>
      $$RecorridoShiftsTableTableManager(_db, _db.recorridoShifts);
  $$ShiftChoferesTableTableManager get shiftChoferes =>
      $$ShiftChoferesTableTableManager(_db, _db.shiftChoferes);
  $$ShiftColectivosTableTableManager get shiftColectivos =>
      $$ShiftColectivosTableTableManager(_db, _db.shiftColectivos);
  $$EncargadosTableTableManager get encargados =>
      $$EncargadosTableTableManager(_db, _db.encargados);
  $$RecorridoSubscriptionsTableTableManager get recorridoSubscriptions =>
      $$RecorridoSubscriptionsTableTableManager(
        _db,
        _db.recorridoSubscriptions,
      );
}
