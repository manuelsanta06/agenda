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
  static const VerificationMeta _fuelAmountMeta = const VerificationMeta(
    'fuelAmount',
  );
  @override
  late final GeneratedColumn<String> fuelAmount = GeneratedColumn<String>(
    'fuel_amount',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fuelDateMeta = const VerificationMeta(
    'fuelDate',
  );
  @override
  late final GeneratedColumn<DateTime> fuelDate = GeneratedColumn<DateTime>(
    'fuel_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
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
    fuelAmount,
    fuelDate,
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
    if (data.containsKey('fuel_amount')) {
      context.handle(
        _fuelAmountMeta,
        fuelAmount.isAcceptableOrUnknown(data['fuel_amount']!, _fuelAmountMeta),
      );
    }
    if (data.containsKey('fuel_date')) {
      context.handle(
        _fuelDateMeta,
        fuelDate.isAcceptableOrUnknown(data['fuel_date']!, _fuelDateMeta),
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
      fuelAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fuel_amount'],
      ),
      fuelDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fuel_date'],
      ),
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
  final String? fuelAmount;
  final DateTime? fuelDate;
  final bool is_active;
  final bool isSynced;
  const Colectivo({
    required this.id,
    required this.plate,
    this.name,
    this.number,
    this.fuelAmount,
    this.fuelDate,
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
    if (!nullToAbsent || fuelAmount != null) {
      map['fuel_amount'] = Variable<String>(fuelAmount);
    }
    if (!nullToAbsent || fuelDate != null) {
      map['fuel_date'] = Variable<DateTime>(fuelDate);
    }
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
      fuelAmount: fuelAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(fuelAmount),
      fuelDate: fuelDate == null && nullToAbsent
          ? const Value.absent()
          : Value(fuelDate),
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
      fuelAmount: serializer.fromJson<String?>(json['fuelAmount']),
      fuelDate: serializer.fromJson<DateTime?>(json['fuelDate']),
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
      'fuelAmount': serializer.toJson<String?>(fuelAmount),
      'fuelDate': serializer.toJson<DateTime?>(fuelDate),
      'is_active': serializer.toJson<bool>(is_active),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Colectivo copyWith({
    String? id,
    String? plate,
    Value<String?> name = const Value.absent(),
    Value<int?> number = const Value.absent(),
    Value<String?> fuelAmount = const Value.absent(),
    Value<DateTime?> fuelDate = const Value.absent(),
    bool? is_active,
    bool? isSynced,
  }) => Colectivo(
    id: id ?? this.id,
    plate: plate ?? this.plate,
    name: name.present ? name.value : this.name,
    number: number.present ? number.value : this.number,
    fuelAmount: fuelAmount.present ? fuelAmount.value : this.fuelAmount,
    fuelDate: fuelDate.present ? fuelDate.value : this.fuelDate,
    is_active: is_active ?? this.is_active,
    isSynced: isSynced ?? this.isSynced,
  );
  Colectivo copyWithCompanion(ColectivosCompanion data) {
    return Colectivo(
      id: data.id.present ? data.id.value : this.id,
      plate: data.plate.present ? data.plate.value : this.plate,
      name: data.name.present ? data.name.value : this.name,
      number: data.number.present ? data.number.value : this.number,
      fuelAmount: data.fuelAmount.present
          ? data.fuelAmount.value
          : this.fuelAmount,
      fuelDate: data.fuelDate.present ? data.fuelDate.value : this.fuelDate,
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
          ..write('fuelAmount: $fuelAmount, ')
          ..write('fuelDate: $fuelDate, ')
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
    fuelAmount,
    fuelDate,
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
          other.fuelAmount == this.fuelAmount &&
          other.fuelDate == this.fuelDate &&
          other.is_active == this.is_active &&
          other.isSynced == this.isSynced);
}

class ColectivosCompanion extends UpdateCompanion<Colectivo> {
  final Value<String> id;
  final Value<String> plate;
  final Value<String?> name;
  final Value<int?> number;
  final Value<String?> fuelAmount;
  final Value<DateTime?> fuelDate;
  final Value<bool> is_active;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const ColectivosCompanion({
    this.id = const Value.absent(),
    this.plate = const Value.absent(),
    this.name = const Value.absent(),
    this.number = const Value.absent(),
    this.fuelAmount = const Value.absent(),
    this.fuelDate = const Value.absent(),
    this.is_active = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ColectivosCompanion.insert({
    required String id,
    required String plate,
    this.name = const Value.absent(),
    this.number = const Value.absent(),
    this.fuelAmount = const Value.absent(),
    this.fuelDate = const Value.absent(),
    this.is_active = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       plate = Value(plate);
  static Insertable<Colectivo> custom({
    Expression<String>? id,
    Expression<String>? plate,
    Expression<String>? name,
    Expression<int>? number,
    Expression<String>? fuelAmount,
    Expression<DateTime>? fuelDate,
    Expression<bool>? is_active,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (plate != null) 'plate': plate,
      if (name != null) 'name': name,
      if (number != null) 'number': number,
      if (fuelAmount != null) 'fuel_amount': fuelAmount,
      if (fuelDate != null) 'fuel_date': fuelDate,
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
    Value<String?>? fuelAmount,
    Value<DateTime?>? fuelDate,
    Value<bool>? is_active,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return ColectivosCompanion(
      id: id ?? this.id,
      plate: plate ?? this.plate,
      name: name ?? this.name,
      number: number ?? this.number,
      fuelAmount: fuelAmount ?? this.fuelAmount,
      fuelDate: fuelDate ?? this.fuelDate,
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
    if (fuelAmount.present) {
      map['fuel_amount'] = Variable<String>(fuelAmount.value);
    }
    if (fuelDate.present) {
      map['fuel_date'] = Variable<DateTime>(fuelDate.value);
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
          ..write('fuelAmount: $fuelAmount, ')
          ..write('fuelDate: $fuelDate, ')
          ..write('is_active: $is_active, ')
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
    state,
    type,
    isTrip,
    isSynced,
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
  final DateTime? endDateTime;
  final EventStates state;
  final EventTypes type;
  final bool isTrip;
  final bool isSynced;
  const Event({
    required this.id,
    required this.name,
    this.contactName,
    this.contact,
    required this.repeat,
    this.days,
    required this.startDateTime,
    this.endDateTime,
    required this.state,
    required this.type,
    required this.isTrip,
    required this.isSynced,
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
    if (!nullToAbsent || endDateTime != null) {
      map['end_date_time'] = Variable<DateTime>(endDateTime);
    }
    {
      map['state'] = Variable<int>($EventsTable.$converterstate.toSql(state));
    }
    {
      map['type'] = Variable<int>($EventsTable.$convertertype.toSql(type));
    }
    map['is_trip'] = Variable<bool>(isTrip);
    map['is_synced'] = Variable<bool>(isSynced);
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
      endDateTime: endDateTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endDateTime),
      state: Value(state),
      type: Value(type),
      isTrip: Value(isTrip),
      isSynced: Value(isSynced),
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
      endDateTime: serializer.fromJson<DateTime?>(json['endDateTime']),
      state: $EventsTable.$converterstate.fromJson(
        serializer.fromJson<int>(json['state']),
      ),
      type: $EventsTable.$convertertype.fromJson(
        serializer.fromJson<int>(json['type']),
      ),
      isTrip: serializer.fromJson<bool>(json['isTrip']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
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
      'endDateTime': serializer.toJson<DateTime?>(endDateTime),
      'state': serializer.toJson<int>(
        $EventsTable.$converterstate.toJson(state),
      ),
      'type': serializer.toJson<int>($EventsTable.$convertertype.toJson(type)),
      'isTrip': serializer.toJson<bool>(isTrip),
      'isSynced': serializer.toJson<bool>(isSynced),
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
    Value<DateTime?> endDateTime = const Value.absent(),
    EventStates? state,
    EventTypes? type,
    bool? isTrip,
    bool? isSynced,
  }) => Event(
    id: id ?? this.id,
    name: name ?? this.name,
    contactName: contactName.present ? contactName.value : this.contactName,
    contact: contact.present ? contact.value : this.contact,
    repeat: repeat ?? this.repeat,
    days: days.present ? days.value : this.days,
    startDateTime: startDateTime ?? this.startDateTime,
    endDateTime: endDateTime.present ? endDateTime.value : this.endDateTime,
    state: state ?? this.state,
    type: type ?? this.type,
    isTrip: isTrip ?? this.isTrip,
    isSynced: isSynced ?? this.isSynced,
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
      state: data.state.present ? data.state.value : this.state,
      type: data.type.present ? data.type.value : this.type,
      isTrip: data.isTrip.present ? data.isTrip.value : this.isTrip,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
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
          ..write('state: $state, ')
          ..write('type: $type, ')
          ..write('isTrip: $isTrip, ')
          ..write('isSynced: $isSynced')
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
    state,
    type,
    isTrip,
    isSynced,
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
          other.state == this.state &&
          other.type == this.type &&
          other.isTrip == this.isTrip &&
          other.isSynced == this.isSynced);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> contactName;
  final Value<String?> contact;
  final Value<bool> repeat;
  final Value<List<WeekDays>?> days;
  final Value<DateTime> startDateTime;
  final Value<DateTime?> endDateTime;
  final Value<EventStates> state;
  final Value<EventTypes> type;
  final Value<bool> isTrip;
  final Value<bool> isSynced;
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
    this.state = const Value.absent(),
    this.type = const Value.absent(),
    this.isTrip = const Value.absent(),
    this.isSynced = const Value.absent(),
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
    this.endDateTime = const Value.absent(),
    required EventStates state,
    required EventTypes type,
    required bool isTrip,
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       startDateTime = Value(startDateTime),
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
    Expression<int>? state,
    Expression<int>? type,
    Expression<bool>? isTrip,
    Expression<bool>? isSynced,
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
      if (state != null) 'state': state,
      if (type != null) 'type': type,
      if (isTrip != null) 'is_trip': isTrip,
      if (isSynced != null) 'is_synced': isSynced,
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
    Value<DateTime?>? endDateTime,
    Value<EventStates>? state,
    Value<EventTypes>? type,
    Value<bool>? isTrip,
    Value<bool>? isSynced,
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
      state: state ?? this.state,
      type: type ?? this.type,
      isTrip: isTrip ?? this.isTrip,
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
          ..write('state: $state, ')
          ..write('type: $type, ')
          ..write('isTrip: $isTrip, ')
          ..write('isSynced: $isSynced, ')
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ChoferesTable choferes = $ChoferesTable(this);
  late final $ColectivosTable colectivos = $ColectivosTable(this);
  late final $EventsTable events = $EventsTable(this);
  late final $StopsTable stops = $StopsTable(this);
  late final $EventChoferesTable eventChoferes = $EventChoferesTable(this);
  late final $EventColectivosTable eventColectivos = $EventColectivosTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    choferes,
    colectivos,
    events,
    stops,
    eventChoferes,
    eventColectivos,
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
          PrefetchHooks Function({bool eventChoferesRefs})
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
          prefetchHooksCallback: ({eventChoferesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (eventChoferesRefs) db.eventChoferes,
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
                      managerFromTypedResult: (p0) => $$ChoferesTableReferences(
                        db,
                        table,
                        p0,
                      ).eventChoferesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.choferId == item.id),
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
      PrefetchHooks Function({bool eventChoferesRefs})
    >;
typedef $$ColectivosTableCreateCompanionBuilder =
    ColectivosCompanion Function({
      required String id,
      required String plate,
      Value<String?> name,
      Value<int?> number,
      Value<String?> fuelAmount,
      Value<DateTime?> fuelDate,
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
      Value<String?> fuelAmount,
      Value<DateTime?> fuelDate,
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

  ColumnFilters<String> get fuelAmount => $composableBuilder(
    column: $table.fuelAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fuelDate => $composableBuilder(
    column: $table.fuelDate,
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

  ColumnOrderings<String> get fuelAmount => $composableBuilder(
    column: $table.fuelAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fuelDate => $composableBuilder(
    column: $table.fuelDate,
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

  GeneratedColumn<String> get fuelAmount => $composableBuilder(
    column: $table.fuelAmount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get fuelDate =>
      $composableBuilder(column: $table.fuelDate, builder: (column) => column);

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
          PrefetchHooks Function({bool eventColectivosRefs})
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
                Value<String?> fuelAmount = const Value.absent(),
                Value<DateTime?> fuelDate = const Value.absent(),
                Value<bool> is_active = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ColectivosCompanion(
                id: id,
                plate: plate,
                name: name,
                number: number,
                fuelAmount: fuelAmount,
                fuelDate: fuelDate,
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
                Value<String?> fuelAmount = const Value.absent(),
                Value<DateTime?> fuelDate = const Value.absent(),
                Value<bool> is_active = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ColectivosCompanion.insert(
                id: id,
                plate: plate,
                name: name,
                number: number,
                fuelAmount: fuelAmount,
                fuelDate: fuelDate,
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
          prefetchHooksCallback: ({eventColectivosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (eventColectivosRefs) db.eventColectivos,
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
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
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
      PrefetchHooks Function({bool eventColectivosRefs})
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
      Value<DateTime?> endDateTime,
      required EventStates state,
      required EventTypes type,
      required bool isTrip,
      Value<bool> isSynced,
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
      Value<DateTime?> endDateTime,
      Value<EventStates> state,
      Value<EventTypes> type,
      Value<bool> isTrip,
      Value<bool> isSynced,
      Value<int> rowid,
    });

final class $$EventsTableReferences
    extends BaseReferences<_$AppDatabase, $EventsTable, Event> {
  $$EventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

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

  GeneratedColumnWithTypeConverter<EventStates, int> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EventTypes, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get isTrip =>
      $composableBuilder(column: $table.isTrip, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

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
                Value<DateTime?> endDateTime = const Value.absent(),
                Value<EventStates> state = const Value.absent(),
                Value<EventTypes> type = const Value.absent(),
                Value<bool> isTrip = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
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
                state: state,
                type: type,
                isTrip: isTrip,
                isSynced: isSynced,
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
                Value<DateTime?> endDateTime = const Value.absent(),
                required EventStates state,
                required EventTypes type,
                required bool isTrip,
                Value<bool> isSynced = const Value.absent(),
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
                state: state,
                type: type,
                isTrip: isTrip,
                isSynced: isSynced,
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
                  addJoins: null,
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ChoferesTableTableManager get choferes =>
      $$ChoferesTableTableManager(_db, _db.choferes);
  $$ColectivosTableTableManager get colectivos =>
      $$ColectivosTableTableManager(_db, _db.colectivos);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db, _db.events);
  $$StopsTableTableManager get stops =>
      $$StopsTableTableManager(_db, _db.stops);
  $$EventChoferesTableTableManager get eventChoferes =>
      $$EventChoferesTableTableManager(_db, _db.eventChoferes);
  $$EventColectivosTableTableManager get eventColectivos =>
      $$EventColectivosTableTableManager(_db, _db.eventColectivos);
}
