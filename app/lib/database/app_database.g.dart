// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ChoferesTable extends Choferes
    with drift.TableInfo<$ChoferesTable, Chofere> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChoferesTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta = const drift.VerificationMeta(
    'id',
  );
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const drift.VerificationMeta _dniMeta = const drift.VerificationMeta(
    'dni',
  );
  @override
  late final drift.GeneratedColumn<String> dni = drift.GeneratedColumn<String>(
    'dni',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const drift.VerificationMeta _nameMeta = const drift.VerificationMeta(
    'name',
  );
  @override
  late final drift.GeneratedColumn<String> name = drift.GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const drift.VerificationMeta _surnameMeta =
      const drift.VerificationMeta('surname');
  @override
  late final drift.GeneratedColumn<String> surname =
      drift.GeneratedColumn<String>(
        'surname',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _aliasMeta = const drift.VerificationMeta(
    'alias',
  );
  @override
  late final drift.GeneratedColumn<String> alias =
      drift.GeneratedColumn<String>(
        'alias',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _mobileNumberMeta =
      const drift.VerificationMeta('mobileNumber');
  @override
  late final drift.GeneratedColumn<String> mobileNumber =
      drift.GeneratedColumn<String>(
        'mobile_number',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _picturePathMeta =
      const drift.VerificationMeta('picturePath');
  @override
  late final drift.GeneratedColumn<String> picturePath =
      drift.GeneratedColumn<String>(
        'picture_path',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _balanceMeta =
      const drift.VerificationMeta('balance');
  @override
  late final drift.GeneratedColumn<double> balance =
      drift.GeneratedColumn<double>(
        'balance',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const drift.Constant(0.0),
      );
  static const drift.VerificationMeta _is_activeMeta =
      const drift.VerificationMeta('is_active');
  @override
  late final drift.GeneratedColumn<bool> is_active =
      drift.GeneratedColumn<bool>(
        'is_active',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_active" IN (0, 1))',
        ),
        defaultValue: const drift.Constant(true),
      );
  static const drift.VerificationMeta _isSyncedMeta =
      const drift.VerificationMeta('isSynced');
  @override
  late final drift.GeneratedColumn<bool> isSynced = drift.GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const drift.Constant(false),
  );
  @override
  List<drift.GeneratedColumn> get $columns => [
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
  drift.VerificationContext validateIntegrity(
    drift.Insertable<Chofere> instance, {
    bool isInserting = false,
  }) {
    final context = drift.VerificationContext();
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
  Set<drift.GeneratedColumn> get $primaryKey => {id};
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

class Chofere extends drift.DataClass implements drift.Insertable<Chofere> {
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    if (!nullToAbsent || dni != null) {
      map['dni'] = drift.Variable<String>(dni);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = drift.Variable<String>(name);
    }
    if (!nullToAbsent || surname != null) {
      map['surname'] = drift.Variable<String>(surname);
    }
    if (!nullToAbsent || alias != null) {
      map['alias'] = drift.Variable<String>(alias);
    }
    if (!nullToAbsent || mobileNumber != null) {
      map['mobile_number'] = drift.Variable<String>(mobileNumber);
    }
    if (!nullToAbsent || picturePath != null) {
      map['picture_path'] = drift.Variable<String>(picturePath);
    }
    map['balance'] = drift.Variable<double>(balance);
    map['is_active'] = drift.Variable<bool>(is_active);
    map['is_synced'] = drift.Variable<bool>(isSynced);
    return map;
  }

  ChoferesCompanion toCompanion(bool nullToAbsent) {
    return ChoferesCompanion(
      id: drift.Value(id),
      dni: dni == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(dni),
      name: name == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(name),
      surname: surname == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(surname),
      alias: alias == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(alias),
      mobileNumber: mobileNumber == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(mobileNumber),
      picturePath: picturePath == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(picturePath),
      balance: drift.Value(balance),
      is_active: drift.Value(is_active),
      isSynced: drift.Value(isSynced),
    );
  }

  factory Chofere.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
    drift.Value<String?> dni = const drift.Value.absent(),
    drift.Value<String?> name = const drift.Value.absent(),
    drift.Value<String?> surname = const drift.Value.absent(),
    drift.Value<String?> alias = const drift.Value.absent(),
    drift.Value<String?> mobileNumber = const drift.Value.absent(),
    drift.Value<String?> picturePath = const drift.Value.absent(),
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

class ChoferesCompanion extends drift.UpdateCompanion<Chofere> {
  final drift.Value<String> id;
  final drift.Value<String?> dni;
  final drift.Value<String?> name;
  final drift.Value<String?> surname;
  final drift.Value<String?> alias;
  final drift.Value<String?> mobileNumber;
  final drift.Value<String?> picturePath;
  final drift.Value<double> balance;
  final drift.Value<bool> is_active;
  final drift.Value<bool> isSynced;
  final drift.Value<int> rowid;
  const ChoferesCompanion({
    this.id = const drift.Value.absent(),
    this.dni = const drift.Value.absent(),
    this.name = const drift.Value.absent(),
    this.surname = const drift.Value.absent(),
    this.alias = const drift.Value.absent(),
    this.mobileNumber = const drift.Value.absent(),
    this.picturePath = const drift.Value.absent(),
    this.balance = const drift.Value.absent(),
    this.is_active = const drift.Value.absent(),
    this.isSynced = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  ChoferesCompanion.insert({
    required String id,
    this.dni = const drift.Value.absent(),
    this.name = const drift.Value.absent(),
    this.surname = const drift.Value.absent(),
    this.alias = const drift.Value.absent(),
    this.mobileNumber = const drift.Value.absent(),
    this.picturePath = const drift.Value.absent(),
    this.balance = const drift.Value.absent(),
    this.is_active = const drift.Value.absent(),
    this.isSynced = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  }) : id = drift.Value(id);
  static drift.Insertable<Chofere> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? dni,
    drift.Expression<String>? name,
    drift.Expression<String>? surname,
    drift.Expression<String>? alias,
    drift.Expression<String>? mobileNumber,
    drift.Expression<String>? picturePath,
    drift.Expression<double>? balance,
    drift.Expression<bool>? is_active,
    drift.Expression<bool>? isSynced,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
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
    drift.Value<String>? id,
    drift.Value<String?>? dni,
    drift.Value<String?>? name,
    drift.Value<String?>? surname,
    drift.Value<String?>? alias,
    drift.Value<String?>? mobileNumber,
    drift.Value<String?>? picturePath,
    drift.Value<double>? balance,
    drift.Value<bool>? is_active,
    drift.Value<bool>? isSynced,
    drift.Value<int>? rowid,
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (dni.present) {
      map['dni'] = drift.Variable<String>(dni.value);
    }
    if (name.present) {
      map['name'] = drift.Variable<String>(name.value);
    }
    if (surname.present) {
      map['surname'] = drift.Variable<String>(surname.value);
    }
    if (alias.present) {
      map['alias'] = drift.Variable<String>(alias.value);
    }
    if (mobileNumber.present) {
      map['mobile_number'] = drift.Variable<String>(mobileNumber.value);
    }
    if (picturePath.present) {
      map['picture_path'] = drift.Variable<String>(picturePath.value);
    }
    if (balance.present) {
      map['balance'] = drift.Variable<double>(balance.value);
    }
    if (is_active.present) {
      map['is_active'] = drift.Variable<bool>(is_active.value);
    }
    if (isSynced.present) {
      map['is_synced'] = drift.Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
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
    with drift.TableInfo<$ColectivosTable, Colectivo> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ColectivosTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta = const drift.VerificationMeta(
    'id',
  );
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const drift.VerificationMeta _plateMeta = const drift.VerificationMeta(
    'plate',
  );
  @override
  late final drift.GeneratedColumn<String> plate =
      drift.GeneratedColumn<String>(
        'plate',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
      );
  static const drift.VerificationMeta _vtvMeta = const drift.VerificationMeta(
    'vtv',
  );
  @override
  late final drift.GeneratedColumn<DateTime> vtv =
      drift.GeneratedColumn<DateTime>(
        'vtv',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: drift.Constant(DateTime(2000, 1, 1)),
      );
  static const drift.VerificationMeta _nameMeta = const drift.VerificationMeta(
    'name',
  );
  @override
  late final drift.GeneratedColumn<String> name = drift.GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const drift.VerificationMeta _numberMeta =
      const drift.VerificationMeta('number');
  @override
  late final drift.GeneratedColumn<int> number = drift.GeneratedColumn<int>(
    'number',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const drift.VerificationMeta _capacityMeta =
      const drift.VerificationMeta('capacity');
  @override
  late final drift.GeneratedColumn<int> capacity = drift.GeneratedColumn<int>(
    'capacity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const drift.Constant(0),
  );
  static const drift.VerificationMeta _fuelAmountMeta =
      const drift.VerificationMeta('fuelAmount');
  @override
  late final drift.GeneratedColumn<String> fuelAmount =
      drift.GeneratedColumn<String>(
        'fuel_amount',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const drift.VerificationMeta _fuelDateMeta =
      const drift.VerificationMeta('fuelDate');
  @override
  late final drift.GeneratedColumn<DateTime> fuelDate =
      drift.GeneratedColumn<DateTime>(
        'fuel_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const drift.VerificationMeta _oilDateMeta =
      const drift.VerificationMeta('oilDate');
  @override
  late final drift.GeneratedColumn<DateTime> oilDate =
      drift.GeneratedColumn<DateTime>(
        'oil_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const drift.VerificationMeta _is_activeMeta =
      const drift.VerificationMeta('is_active');
  @override
  late final drift.GeneratedColumn<bool> is_active =
      drift.GeneratedColumn<bool>(
        'is_active',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_active" IN (0, 1))',
        ),
        defaultValue: const drift.Constant(true),
      );
  static const drift.VerificationMeta _isSyncedMeta =
      const drift.VerificationMeta('isSynced');
  @override
  late final drift.GeneratedColumn<bool> isSynced = drift.GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const drift.Constant(false),
  );
  @override
  List<drift.GeneratedColumn> get $columns => [
    id,
    plate,
    vtv,
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
  drift.VerificationContext validateIntegrity(
    drift.Insertable<Colectivo> instance, {
    bool isInserting = false,
  }) {
    final context = drift.VerificationContext();
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
    if (data.containsKey('vtv')) {
      context.handle(
        _vtvMeta,
        vtv.isAcceptableOrUnknown(data['vtv']!, _vtvMeta),
      );
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
  Set<drift.GeneratedColumn> get $primaryKey => {id};
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
      vtv: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}vtv'],
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

class Colectivo extends drift.DataClass implements drift.Insertable<Colectivo> {
  final String id;
  final String plate;
  final DateTime vtv;
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
    required this.vtv,
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['plate'] = drift.Variable<String>(plate);
    map['vtv'] = drift.Variable<DateTime>(vtv);
    if (!nullToAbsent || name != null) {
      map['name'] = drift.Variable<String>(name);
    }
    if (!nullToAbsent || number != null) {
      map['number'] = drift.Variable<int>(number);
    }
    map['capacity'] = drift.Variable<int>(capacity);
    map['fuel_amount'] = drift.Variable<String>(fuelAmount);
    map['fuel_date'] = drift.Variable<DateTime>(fuelDate);
    map['oil_date'] = drift.Variable<DateTime>(oilDate);
    map['is_active'] = drift.Variable<bool>(is_active);
    map['is_synced'] = drift.Variable<bool>(isSynced);
    return map;
  }

  ColectivosCompanion toCompanion(bool nullToAbsent) {
    return ColectivosCompanion(
      id: drift.Value(id),
      plate: drift.Value(plate),
      vtv: drift.Value(vtv),
      name: name == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(name),
      number: number == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(number),
      capacity: drift.Value(capacity),
      fuelAmount: drift.Value(fuelAmount),
      fuelDate: drift.Value(fuelDate),
      oilDate: drift.Value(oilDate),
      is_active: drift.Value(is_active),
      isSynced: drift.Value(isSynced),
    );
  }

  factory Colectivo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return Colectivo(
      id: serializer.fromJson<String>(json['id']),
      plate: serializer.fromJson<String>(json['plate']),
      vtv: serializer.fromJson<DateTime>(json['vtv']),
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
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'plate': serializer.toJson<String>(plate),
      'vtv': serializer.toJson<DateTime>(vtv),
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
    DateTime? vtv,
    drift.Value<String?> name = const drift.Value.absent(),
    drift.Value<int?> number = const drift.Value.absent(),
    int? capacity,
    String? fuelAmount,
    DateTime? fuelDate,
    DateTime? oilDate,
    bool? is_active,
    bool? isSynced,
  }) => Colectivo(
    id: id ?? this.id,
    plate: plate ?? this.plate,
    vtv: vtv ?? this.vtv,
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
      vtv: data.vtv.present ? data.vtv.value : this.vtv,
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
          ..write('vtv: $vtv, ')
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
    vtv,
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
          other.vtv == this.vtv &&
          other.name == this.name &&
          other.number == this.number &&
          other.capacity == this.capacity &&
          other.fuelAmount == this.fuelAmount &&
          other.fuelDate == this.fuelDate &&
          other.oilDate == this.oilDate &&
          other.is_active == this.is_active &&
          other.isSynced == this.isSynced);
}

class ColectivosCompanion extends drift.UpdateCompanion<Colectivo> {
  final drift.Value<String> id;
  final drift.Value<String> plate;
  final drift.Value<DateTime> vtv;
  final drift.Value<String?> name;
  final drift.Value<int?> number;
  final drift.Value<int> capacity;
  final drift.Value<String> fuelAmount;
  final drift.Value<DateTime> fuelDate;
  final drift.Value<DateTime> oilDate;
  final drift.Value<bool> is_active;
  final drift.Value<bool> isSynced;
  final drift.Value<int> rowid;
  const ColectivosCompanion({
    this.id = const drift.Value.absent(),
    this.plate = const drift.Value.absent(),
    this.vtv = const drift.Value.absent(),
    this.name = const drift.Value.absent(),
    this.number = const drift.Value.absent(),
    this.capacity = const drift.Value.absent(),
    this.fuelAmount = const drift.Value.absent(),
    this.fuelDate = const drift.Value.absent(),
    this.oilDate = const drift.Value.absent(),
    this.is_active = const drift.Value.absent(),
    this.isSynced = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  ColectivosCompanion.insert({
    required String id,
    required String plate,
    this.vtv = const drift.Value.absent(),
    this.name = const drift.Value.absent(),
    this.number = const drift.Value.absent(),
    this.capacity = const drift.Value.absent(),
    required String fuelAmount,
    required DateTime fuelDate,
    required DateTime oilDate,
    this.is_active = const drift.Value.absent(),
    this.isSynced = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  }) : id = drift.Value(id),
       plate = drift.Value(plate),
       fuelAmount = drift.Value(fuelAmount),
       fuelDate = drift.Value(fuelDate),
       oilDate = drift.Value(oilDate);
  static drift.Insertable<Colectivo> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? plate,
    drift.Expression<DateTime>? vtv,
    drift.Expression<String>? name,
    drift.Expression<int>? number,
    drift.Expression<int>? capacity,
    drift.Expression<String>? fuelAmount,
    drift.Expression<DateTime>? fuelDate,
    drift.Expression<DateTime>? oilDate,
    drift.Expression<bool>? is_active,
    drift.Expression<bool>? isSynced,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (plate != null) 'plate': plate,
      if (vtv != null) 'vtv': vtv,
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
    drift.Value<String>? id,
    drift.Value<String>? plate,
    drift.Value<DateTime>? vtv,
    drift.Value<String?>? name,
    drift.Value<int?>? number,
    drift.Value<int>? capacity,
    drift.Value<String>? fuelAmount,
    drift.Value<DateTime>? fuelDate,
    drift.Value<DateTime>? oilDate,
    drift.Value<bool>? is_active,
    drift.Value<bool>? isSynced,
    drift.Value<int>? rowid,
  }) {
    return ColectivosCompanion(
      id: id ?? this.id,
      plate: plate ?? this.plate,
      vtv: vtv ?? this.vtv,
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (plate.present) {
      map['plate'] = drift.Variable<String>(plate.value);
    }
    if (vtv.present) {
      map['vtv'] = drift.Variable<DateTime>(vtv.value);
    }
    if (name.present) {
      map['name'] = drift.Variable<String>(name.value);
    }
    if (number.present) {
      map['number'] = drift.Variable<int>(number.value);
    }
    if (capacity.present) {
      map['capacity'] = drift.Variable<int>(capacity.value);
    }
    if (fuelAmount.present) {
      map['fuel_amount'] = drift.Variable<String>(fuelAmount.value);
    }
    if (fuelDate.present) {
      map['fuel_date'] = drift.Variable<DateTime>(fuelDate.value);
    }
    if (oilDate.present) {
      map['oil_date'] = drift.Variable<DateTime>(oilDate.value);
    }
    if (is_active.present) {
      map['is_active'] = drift.Variable<bool>(is_active.value);
    }
    if (isSynced.present) {
      map['is_synced'] = drift.Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ColectivosCompanion(')
          ..write('id: $id, ')
          ..write('plate: $plate, ')
          ..write('vtv: $vtv, ')
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
    with drift.TableInfo<$RecorridosTable, Recorrido> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecorridosTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta = const drift.VerificationMeta(
    'id',
  );
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const drift.VerificationMeta _nameMeta = const drift.VerificationMeta(
    'name',
  );
  @override
  late final drift.GeneratedColumn<String> name = drift.GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const drift.VerificationMeta _pinnedMeta =
      const drift.VerificationMeta('pinned');
  @override
  late final drift.GeneratedColumn<bool> pinned = drift.GeneratedColumn<bool>(
    'pinned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pinned" IN (0, 1))',
    ),
    defaultValue: const drift.Constant(false),
  );
  static const drift.VerificationMeta _basePriceMeta =
      const drift.VerificationMeta('basePrice');
  @override
  late final drift.GeneratedColumn<int> basePrice = drift.GeneratedColumn<int>(
    'base_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const drift.Constant(0),
  );
  static const drift.VerificationMeta _isActiveMeta =
      const drift.VerificationMeta('isActive');
  @override
  late final drift.GeneratedColumn<bool> isActive = drift.GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const drift.Constant(true),
  );
  static const drift.VerificationMeta _isSyncedMeta =
      const drift.VerificationMeta('isSynced');
  @override
  late final drift.GeneratedColumn<bool> isSynced = drift.GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const drift.Constant(false),
  );
  @override
  List<drift.GeneratedColumn> get $columns => [
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
  drift.VerificationContext validateIntegrity(
    drift.Insertable<Recorrido> instance, {
    bool isInserting = false,
  }) {
    final context = drift.VerificationContext();
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
  Set<drift.GeneratedColumn> get $primaryKey => {id};
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

class Recorrido extends drift.DataClass implements drift.Insertable<Recorrido> {
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['name'] = drift.Variable<String>(name);
    map['pinned'] = drift.Variable<bool>(pinned);
    map['base_price'] = drift.Variable<int>(basePrice);
    map['is_active'] = drift.Variable<bool>(isActive);
    map['is_synced'] = drift.Variable<bool>(isSynced);
    return map;
  }

  RecorridosCompanion toCompanion(bool nullToAbsent) {
    return RecorridosCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      pinned: drift.Value(pinned),
      basePrice: drift.Value(basePrice),
      isActive: drift.Value(isActive),
      isSynced: drift.Value(isSynced),
    );
  }

  factory Recorrido.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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

class RecorridosCompanion extends drift.UpdateCompanion<Recorrido> {
  final drift.Value<String> id;
  final drift.Value<String> name;
  final drift.Value<bool> pinned;
  final drift.Value<int> basePrice;
  final drift.Value<bool> isActive;
  final drift.Value<bool> isSynced;
  final drift.Value<int> rowid;
  const RecorridosCompanion({
    this.id = const drift.Value.absent(),
    this.name = const drift.Value.absent(),
    this.pinned = const drift.Value.absent(),
    this.basePrice = const drift.Value.absent(),
    this.isActive = const drift.Value.absent(),
    this.isSynced = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  RecorridosCompanion.insert({
    required String id,
    required String name,
    this.pinned = const drift.Value.absent(),
    this.basePrice = const drift.Value.absent(),
    this.isActive = const drift.Value.absent(),
    this.isSynced = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  }) : id = drift.Value(id),
       name = drift.Value(name);
  static drift.Insertable<Recorrido> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? name,
    drift.Expression<bool>? pinned,
    drift.Expression<int>? basePrice,
    drift.Expression<bool>? isActive,
    drift.Expression<bool>? isSynced,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
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
    drift.Value<String>? id,
    drift.Value<String>? name,
    drift.Value<bool>? pinned,
    drift.Value<int>? basePrice,
    drift.Value<bool>? isActive,
    drift.Value<bool>? isSynced,
    drift.Value<int>? rowid,
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = drift.Variable<String>(name.value);
    }
    if (pinned.present) {
      map['pinned'] = drift.Variable<bool>(pinned.value);
    }
    if (basePrice.present) {
      map['base_price'] = drift.Variable<int>(basePrice.value);
    }
    if (isActive.present) {
      map['is_active'] = drift.Variable<bool>(isActive.value);
    }
    if (isSynced.present) {
      map['is_synced'] = drift.Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
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

class $EventsTable extends Events with drift.TableInfo<$EventsTable, Event> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta = const drift.VerificationMeta(
    'id',
  );
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const drift.VerificationMeta _nameMeta = const drift.VerificationMeta(
    'name',
  );
  @override
  late final drift.GeneratedColumn<String> name = drift.GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const drift.VerificationMeta _priceMeta = const drift.VerificationMeta(
    'price',
  );
  @override
  late final drift.GeneratedColumn<int> price = drift.GeneratedColumn<int>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const drift.Constant(0),
  );
  static const drift.VerificationMeta _dataMeta = const drift.VerificationMeta(
    'data',
  );
  @override
  late final drift.GeneratedColumn<String> data = drift.GeneratedColumn<String>(
    'data',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const drift.Constant(''),
  );
  static const drift.VerificationMeta _contactNameMeta =
      const drift.VerificationMeta('contactName');
  @override
  late final drift.GeneratedColumn<String> contactName =
      drift.GeneratedColumn<String>(
        'contact_name',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _contactMeta =
      const drift.VerificationMeta('contact');
  @override
  late final drift.GeneratedColumn<String> contact =
      drift.GeneratedColumn<String>(
        'contact',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _repeatMeta =
      const drift.VerificationMeta('repeat');
  @override
  late final drift.GeneratedColumn<bool> repeat = drift.GeneratedColumn<bool>(
    'repeat',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("repeat" IN (0, 1))',
    ),
    defaultValue: const drift.Constant(false),
  );
  @override
  late final drift.GeneratedColumnWithTypeConverter<List<WeekDays>?, String>
  days = drift.GeneratedColumn<String>(
    'days',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<List<WeekDays>?>($EventsTable.$converterdaysn);
  static const drift.VerificationMeta _startDateTimeMeta =
      const drift.VerificationMeta('startDateTime');
  @override
  late final drift.GeneratedColumn<DateTime> startDateTime =
      drift.GeneratedColumn<DateTime>(
        'start_date_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const drift.VerificationMeta _endDateTimeMeta =
      const drift.VerificationMeta('endDateTime');
  @override
  late final drift.GeneratedColumn<DateTime> endDateTime =
      drift.GeneratedColumn<DateTime>(
        'end_date_time',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const drift.VerificationMeta _stopRepeatingDateTimeMeta =
      const drift.VerificationMeta('stopRepeatingDateTime');
  @override
  late final drift.GeneratedColumn<DateTime> stopRepeatingDateTime =
      drift.GeneratedColumn<DateTime>(
        'stop_repeating_date_time',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  late final drift.GeneratedColumnWithTypeConverter<EventStates, int> state =
      drift.GeneratedColumn<int>(
        'state',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<EventStates>($EventsTable.$converterstate);
  @override
  late final drift.GeneratedColumnWithTypeConverter<EventTypes, int> type =
      drift.GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<EventTypes>($EventsTable.$convertertype);
  static const drift.VerificationMeta _isTripMeta =
      const drift.VerificationMeta('isTrip');
  @override
  late final drift.GeneratedColumn<bool> isTrip = drift.GeneratedColumn<bool>(
    'is_trip',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_trip" IN (0, 1))',
    ),
  );
  static const drift.VerificationMeta _isSyncedMeta =
      const drift.VerificationMeta('isSynced');
  @override
  late final drift.GeneratedColumn<bool> isSynced = drift.GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const drift.Constant(false),
  );
  static const drift.VerificationMeta _recorridoIdMeta =
      const drift.VerificationMeta('recorridoId');
  @override
  late final drift.GeneratedColumn<String> recorridoId =
      drift.GeneratedColumn<String>(
        'recorrido_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES recorridos (id)',
        ),
      );
  static const drift.VerificationMeta _shiftIdMeta =
      const drift.VerificationMeta('shiftId');
  @override
  late final drift.GeneratedColumn<String> shiftId =
      drift.GeneratedColumn<String>(
        'shift_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES events (id)',
        ),
      );
  @override
  List<drift.GeneratedColumn> get $columns => [
    id,
    name,
    price,
    data,
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
    shiftId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events';
  @override
  drift.VerificationContext validateIntegrity(
    drift.Insertable<Event> instance, {
    bool isInserting = false,
  }) {
    final context = drift.VerificationContext();
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
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    }
    if (data.containsKey('data')) {
      context.handle(
        _dataMeta,
        this.data.isAcceptableOrUnknown(data['data']!, _dataMeta),
      );
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
    if (data.containsKey('shift_id')) {
      context.handle(
        _shiftIdMeta,
        shiftId.isAcceptableOrUnknown(data['shift_id']!, _shiftIdMeta),
      );
    }
    return context;
  }

  @override
  Set<drift.GeneratedColumn> get $primaryKey => {id};
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
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      )!,
      data: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}data'],
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
      shiftId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}shift_id'],
      ),
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }

  static drift.TypeConverter<List<WeekDays>, String> $converterdays =
      const WeekDaysConverter();
  static drift.TypeConverter<List<WeekDays>?, String?> $converterdaysn =
      NullAwareTypeConverter.wrap($converterdays);
  static drift.JsonTypeConverter2<EventStates, int, int> $converterstate =
      const drift.EnumIndexConverter<EventStates>(EventStates.values);
  static drift.JsonTypeConverter2<EventTypes, int, int> $convertertype =
      const drift.EnumIndexConverter<EventTypes>(EventTypes.values);
}

class Event extends drift.DataClass implements drift.Insertable<Event> {
  final String id;
  final String name;
  final int price;
  final String data;
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
  final String? shiftId;
  const Event({
    required this.id,
    required this.name,
    required this.price,
    required this.data,
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
    this.shiftId,
  });
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['name'] = drift.Variable<String>(name);
    map['price'] = drift.Variable<int>(price);
    map['data'] = drift.Variable<String>(data);
    if (!nullToAbsent || contactName != null) {
      map['contact_name'] = drift.Variable<String>(contactName);
    }
    if (!nullToAbsent || contact != null) {
      map['contact'] = drift.Variable<String>(contact);
    }
    map['repeat'] = drift.Variable<bool>(repeat);
    if (!nullToAbsent || days != null) {
      map['days'] = drift.Variable<String>(
        $EventsTable.$converterdaysn.toSql(days),
      );
    }
    map['start_date_time'] = drift.Variable<DateTime>(startDateTime);
    map['end_date_time'] = drift.Variable<DateTime>(endDateTime);
    if (!nullToAbsent || stopRepeatingDateTime != null) {
      map['stop_repeating_date_time'] = drift.Variable<DateTime>(
        stopRepeatingDateTime,
      );
    }
    {
      map['state'] = drift.Variable<int>(
        $EventsTable.$converterstate.toSql(state),
      );
    }
    {
      map['type'] = drift.Variable<int>(
        $EventsTable.$convertertype.toSql(type),
      );
    }
    map['is_trip'] = drift.Variable<bool>(isTrip);
    map['is_synced'] = drift.Variable<bool>(isSynced);
    if (!nullToAbsent || recorridoId != null) {
      map['recorrido_id'] = drift.Variable<String>(recorridoId);
    }
    if (!nullToAbsent || shiftId != null) {
      map['shift_id'] = drift.Variable<String>(shiftId);
    }
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      price: drift.Value(price),
      data: drift.Value(data),
      contactName: contactName == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(contactName),
      contact: contact == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(contact),
      repeat: drift.Value(repeat),
      days: days == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(days),
      startDateTime: drift.Value(startDateTime),
      endDateTime: drift.Value(endDateTime),
      stopRepeatingDateTime: stopRepeatingDateTime == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(stopRepeatingDateTime),
      state: drift.Value(state),
      type: drift.Value(type),
      isTrip: drift.Value(isTrip),
      isSynced: drift.Value(isSynced),
      recorridoId: recorridoId == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(recorridoId),
      shiftId: shiftId == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(shiftId),
    );
  }

  factory Event.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<int>(json['price']),
      data: serializer.fromJson<String>(json['data']),
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
      shiftId: serializer.fromJson<String?>(json['shiftId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<int>(price),
      'data': serializer.toJson<String>(data),
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
      'shiftId': serializer.toJson<String?>(shiftId),
    };
  }

  Event copyWith({
    String? id,
    String? name,
    int? price,
    String? data,
    drift.Value<String?> contactName = const drift.Value.absent(),
    drift.Value<String?> contact = const drift.Value.absent(),
    bool? repeat,
    drift.Value<List<WeekDays>?> days = const drift.Value.absent(),
    DateTime? startDateTime,
    DateTime? endDateTime,
    drift.Value<DateTime?> stopRepeatingDateTime = const drift.Value.absent(),
    EventStates? state,
    EventTypes? type,
    bool? isTrip,
    bool? isSynced,
    drift.Value<String?> recorridoId = const drift.Value.absent(),
    drift.Value<String?> shiftId = const drift.Value.absent(),
  }) => Event(
    id: id ?? this.id,
    name: name ?? this.name,
    price: price ?? this.price,
    data: data ?? this.data,
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
    shiftId: shiftId.present ? shiftId.value : this.shiftId,
  );
  Event copyWithCompanion(EventsCompanion data) {
    return Event(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      data: data.data.present ? data.data.value : this.data,
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
      shiftId: data.shiftId.present ? data.shiftId.value : this.shiftId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('data: $data, ')
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
          ..write('shiftId: $shiftId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    price,
    data,
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
    shiftId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.data == this.data &&
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
          other.recorridoId == this.recorridoId &&
          other.shiftId == this.shiftId);
}

class EventsCompanion extends drift.UpdateCompanion<Event> {
  final drift.Value<String> id;
  final drift.Value<String> name;
  final drift.Value<int> price;
  final drift.Value<String> data;
  final drift.Value<String?> contactName;
  final drift.Value<String?> contact;
  final drift.Value<bool> repeat;
  final drift.Value<List<WeekDays>?> days;
  final drift.Value<DateTime> startDateTime;
  final drift.Value<DateTime> endDateTime;
  final drift.Value<DateTime?> stopRepeatingDateTime;
  final drift.Value<EventStates> state;
  final drift.Value<EventTypes> type;
  final drift.Value<bool> isTrip;
  final drift.Value<bool> isSynced;
  final drift.Value<String?> recorridoId;
  final drift.Value<String?> shiftId;
  final drift.Value<int> rowid;
  const EventsCompanion({
    this.id = const drift.Value.absent(),
    this.name = const drift.Value.absent(),
    this.price = const drift.Value.absent(),
    this.data = const drift.Value.absent(),
    this.contactName = const drift.Value.absent(),
    this.contact = const drift.Value.absent(),
    this.repeat = const drift.Value.absent(),
    this.days = const drift.Value.absent(),
    this.startDateTime = const drift.Value.absent(),
    this.endDateTime = const drift.Value.absent(),
    this.stopRepeatingDateTime = const drift.Value.absent(),
    this.state = const drift.Value.absent(),
    this.type = const drift.Value.absent(),
    this.isTrip = const drift.Value.absent(),
    this.isSynced = const drift.Value.absent(),
    this.recorridoId = const drift.Value.absent(),
    this.shiftId = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  EventsCompanion.insert({
    required String id,
    required String name,
    this.price = const drift.Value.absent(),
    this.data = const drift.Value.absent(),
    this.contactName = const drift.Value.absent(),
    this.contact = const drift.Value.absent(),
    this.repeat = const drift.Value.absent(),
    this.days = const drift.Value.absent(),
    required DateTime startDateTime,
    required DateTime endDateTime,
    this.stopRepeatingDateTime = const drift.Value.absent(),
    required EventStates state,
    required EventTypes type,
    required bool isTrip,
    this.isSynced = const drift.Value.absent(),
    this.recorridoId = const drift.Value.absent(),
    this.shiftId = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  }) : id = drift.Value(id),
       name = drift.Value(name),
       startDateTime = drift.Value(startDateTime),
       endDateTime = drift.Value(endDateTime),
       state = drift.Value(state),
       type = drift.Value(type),
       isTrip = drift.Value(isTrip);
  static drift.Insertable<Event> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? name,
    drift.Expression<int>? price,
    drift.Expression<String>? data,
    drift.Expression<String>? contactName,
    drift.Expression<String>? contact,
    drift.Expression<bool>? repeat,
    drift.Expression<String>? days,
    drift.Expression<DateTime>? startDateTime,
    drift.Expression<DateTime>? endDateTime,
    drift.Expression<DateTime>? stopRepeatingDateTime,
    drift.Expression<int>? state,
    drift.Expression<int>? type,
    drift.Expression<bool>? isTrip,
    drift.Expression<bool>? isSynced,
    drift.Expression<String>? recorridoId,
    drift.Expression<String>? shiftId,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (data != null) 'data': data,
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
      if (shiftId != null) 'shift_id': shiftId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventsCompanion copyWith({
    drift.Value<String>? id,
    drift.Value<String>? name,
    drift.Value<int>? price,
    drift.Value<String>? data,
    drift.Value<String?>? contactName,
    drift.Value<String?>? contact,
    drift.Value<bool>? repeat,
    drift.Value<List<WeekDays>?>? days,
    drift.Value<DateTime>? startDateTime,
    drift.Value<DateTime>? endDateTime,
    drift.Value<DateTime?>? stopRepeatingDateTime,
    drift.Value<EventStates>? state,
    drift.Value<EventTypes>? type,
    drift.Value<bool>? isTrip,
    drift.Value<bool>? isSynced,
    drift.Value<String?>? recorridoId,
    drift.Value<String?>? shiftId,
    drift.Value<int>? rowid,
  }) {
    return EventsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      data: data ?? this.data,
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
      shiftId: shiftId ?? this.shiftId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = drift.Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = drift.Variable<int>(price.value);
    }
    if (data.present) {
      map['data'] = drift.Variable<String>(data.value);
    }
    if (contactName.present) {
      map['contact_name'] = drift.Variable<String>(contactName.value);
    }
    if (contact.present) {
      map['contact'] = drift.Variable<String>(contact.value);
    }
    if (repeat.present) {
      map['repeat'] = drift.Variable<bool>(repeat.value);
    }
    if (days.present) {
      map['days'] = drift.Variable<String>(
        $EventsTable.$converterdaysn.toSql(days.value),
      );
    }
    if (startDateTime.present) {
      map['start_date_time'] = drift.Variable<DateTime>(startDateTime.value);
    }
    if (endDateTime.present) {
      map['end_date_time'] = drift.Variable<DateTime>(endDateTime.value);
    }
    if (stopRepeatingDateTime.present) {
      map['stop_repeating_date_time'] = drift.Variable<DateTime>(
        stopRepeatingDateTime.value,
      );
    }
    if (state.present) {
      map['state'] = drift.Variable<int>(
        $EventsTable.$converterstate.toSql(state.value),
      );
    }
    if (type.present) {
      map['type'] = drift.Variable<int>(
        $EventsTable.$convertertype.toSql(type.value),
      );
    }
    if (isTrip.present) {
      map['is_trip'] = drift.Variable<bool>(isTrip.value);
    }
    if (isSynced.present) {
      map['is_synced'] = drift.Variable<bool>(isSynced.value);
    }
    if (recorridoId.present) {
      map['recorrido_id'] = drift.Variable<String>(recorridoId.value);
    }
    if (shiftId.present) {
      map['shift_id'] = drift.Variable<String>(shiftId.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('data: $data, ')
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
          ..write('shiftId: $shiftId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StopsTable extends Stops with drift.TableInfo<$StopsTable, Stop> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StopsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta = const drift.VerificationMeta(
    'id',
  );
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const drift.VerificationMeta _nameMeta = const drift.VerificationMeta(
    'name',
  );
  @override
  late final drift.GeneratedColumn<String> name = drift.GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const drift.VerificationMeta _startMeta = const drift.VerificationMeta(
    'start',
  );
  @override
  late final drift.GeneratedColumn<DateTime> start =
      drift.GeneratedColumn<DateTime>(
        'start',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _eventIdMeta =
      const drift.VerificationMeta('eventId');
  @override
  late final drift.GeneratedColumn<String> eventId =
      drift.GeneratedColumn<String>(
        'event_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES events (id) ON DELETE CASCADE',
        ),
      );
  static const drift.VerificationMeta _orderIndexMeta =
      const drift.VerificationMeta('orderIndex');
  @override
  late final drift.GeneratedColumn<int> orderIndex = drift.GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<drift.GeneratedColumn> get $columns => [
    id,
    name,
    start,
    eventId,
    orderIndex,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stops';
  @override
  drift.VerificationContext validateIntegrity(
    drift.Insertable<Stop> instance, {
    bool isInserting = false,
  }) {
    final context = drift.VerificationContext();
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
  Set<drift.GeneratedColumn> get $primaryKey => {id};
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

class Stop extends drift.DataClass implements drift.Insertable<Stop> {
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['name'] = drift.Variable<String>(name);
    if (!nullToAbsent || start != null) {
      map['start'] = drift.Variable<DateTime>(start);
    }
    map['event_id'] = drift.Variable<String>(eventId);
    map['order_index'] = drift.Variable<int>(orderIndex);
    return map;
  }

  StopsCompanion toCompanion(bool nullToAbsent) {
    return StopsCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      start: start == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(start),
      eventId: drift.Value(eventId),
      orderIndex: drift.Value(orderIndex),
    );
  }

  factory Stop.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
    drift.Value<DateTime?> start = const drift.Value.absent(),
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

class StopsCompanion extends drift.UpdateCompanion<Stop> {
  final drift.Value<String> id;
  final drift.Value<String> name;
  final drift.Value<DateTime?> start;
  final drift.Value<String> eventId;
  final drift.Value<int> orderIndex;
  final drift.Value<int> rowid;
  const StopsCompanion({
    this.id = const drift.Value.absent(),
    this.name = const drift.Value.absent(),
    this.start = const drift.Value.absent(),
    this.eventId = const drift.Value.absent(),
    this.orderIndex = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  StopsCompanion.insert({
    required String id,
    required String name,
    this.start = const drift.Value.absent(),
    required String eventId,
    required int orderIndex,
    this.rowid = const drift.Value.absent(),
  }) : id = drift.Value(id),
       name = drift.Value(name),
       eventId = drift.Value(eventId),
       orderIndex = drift.Value(orderIndex);
  static drift.Insertable<Stop> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? name,
    drift.Expression<DateTime>? start,
    drift.Expression<String>? eventId,
    drift.Expression<int>? orderIndex,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (start != null) 'start': start,
      if (eventId != null) 'event_id': eventId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StopsCompanion copyWith({
    drift.Value<String>? id,
    drift.Value<String>? name,
    drift.Value<DateTime?>? start,
    drift.Value<String>? eventId,
    drift.Value<int>? orderIndex,
    drift.Value<int>? rowid,
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = drift.Variable<String>(name.value);
    }
    if (start.present) {
      map['start'] = drift.Variable<DateTime>(start.value);
    }
    if (eventId.present) {
      map['event_id'] = drift.Variable<String>(eventId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = drift.Variable<int>(orderIndex.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
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
    with drift.TableInfo<$EventChoferesTable, EventChofere> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventChoferesTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _eventIdMeta =
      const drift.VerificationMeta('eventId');
  @override
  late final drift.GeneratedColumn<String> eventId =
      drift.GeneratedColumn<String>(
        'event_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES events (id) ON DELETE CASCADE',
        ),
      );
  static const drift.VerificationMeta _choferIdMeta =
      const drift.VerificationMeta('choferId');
  @override
  late final drift.GeneratedColumn<String> choferId =
      drift.GeneratedColumn<String>(
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
  List<drift.GeneratedColumn> get $columns => [eventId, choferId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_choferes';
  @override
  drift.VerificationContext validateIntegrity(
    drift.Insertable<EventChofere> instance, {
    bool isInserting = false,
  }) {
    final context = drift.VerificationContext();
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
  Set<drift.GeneratedColumn> get $primaryKey => {eventId, choferId};
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

class EventChofere extends drift.DataClass
    implements drift.Insertable<EventChofere> {
  final String eventId;
  final String choferId;
  const EventChofere({required this.eventId, required this.choferId});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['event_id'] = drift.Variable<String>(eventId);
    map['chofer_id'] = drift.Variable<String>(choferId);
    return map;
  }

  EventChoferesCompanion toCompanion(bool nullToAbsent) {
    return EventChoferesCompanion(
      eventId: drift.Value(eventId),
      choferId: drift.Value(choferId),
    );
  }

  factory EventChofere.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return EventChofere(
      eventId: serializer.fromJson<String>(json['eventId']),
      choferId: serializer.fromJson<String>(json['choferId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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

class EventChoferesCompanion extends drift.UpdateCompanion<EventChofere> {
  final drift.Value<String> eventId;
  final drift.Value<String> choferId;
  final drift.Value<int> rowid;
  const EventChoferesCompanion({
    this.eventId = const drift.Value.absent(),
    this.choferId = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  EventChoferesCompanion.insert({
    required String eventId,
    required String choferId,
    this.rowid = const drift.Value.absent(),
  }) : eventId = drift.Value(eventId),
       choferId = drift.Value(choferId);
  static drift.Insertable<EventChofere> custom({
    drift.Expression<String>? eventId,
    drift.Expression<String>? choferId,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (eventId != null) 'event_id': eventId,
      if (choferId != null) 'chofer_id': choferId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventChoferesCompanion copyWith({
    drift.Value<String>? eventId,
    drift.Value<String>? choferId,
    drift.Value<int>? rowid,
  }) {
    return EventChoferesCompanion(
      eventId: eventId ?? this.eventId,
      choferId: choferId ?? this.choferId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (eventId.present) {
      map['event_id'] = drift.Variable<String>(eventId.value);
    }
    if (choferId.present) {
      map['chofer_id'] = drift.Variable<String>(choferId.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
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
    with drift.TableInfo<$EventColectivosTable, EventColectivo> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventColectivosTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _eventIdMeta =
      const drift.VerificationMeta('eventId');
  @override
  late final drift.GeneratedColumn<String> eventId =
      drift.GeneratedColumn<String>(
        'event_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES events (id) ON DELETE CASCADE',
        ),
      );
  static const drift.VerificationMeta _colectivoIdMeta =
      const drift.VerificationMeta('colectivoId');
  @override
  late final drift.GeneratedColumn<String> colectivoId =
      drift.GeneratedColumn<String>(
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
  List<drift.GeneratedColumn> get $columns => [eventId, colectivoId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_colectivos';
  @override
  drift.VerificationContext validateIntegrity(
    drift.Insertable<EventColectivo> instance, {
    bool isInserting = false,
  }) {
    final context = drift.VerificationContext();
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
  Set<drift.GeneratedColumn> get $primaryKey => {eventId, colectivoId};
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

class EventColectivo extends drift.DataClass
    implements drift.Insertable<EventColectivo> {
  final String eventId;
  final String colectivoId;
  const EventColectivo({required this.eventId, required this.colectivoId});
  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['event_id'] = drift.Variable<String>(eventId);
    map['colectivo_id'] = drift.Variable<String>(colectivoId);
    return map;
  }

  EventColectivosCompanion toCompanion(bool nullToAbsent) {
    return EventColectivosCompanion(
      eventId: drift.Value(eventId),
      colectivoId: drift.Value(colectivoId),
    );
  }

  factory EventColectivo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
    return EventColectivo(
      eventId: serializer.fromJson<String>(json['eventId']),
      colectivoId: serializer.fromJson<String>(json['colectivoId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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

class EventColectivosCompanion extends drift.UpdateCompanion<EventColectivo> {
  final drift.Value<String> eventId;
  final drift.Value<String> colectivoId;
  final drift.Value<int> rowid;
  const EventColectivosCompanion({
    this.eventId = const drift.Value.absent(),
    this.colectivoId = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  EventColectivosCompanion.insert({
    required String eventId,
    required String colectivoId,
    this.rowid = const drift.Value.absent(),
  }) : eventId = drift.Value(eventId),
       colectivoId = drift.Value(colectivoId);
  static drift.Insertable<EventColectivo> custom({
    drift.Expression<String>? eventId,
    drift.Expression<String>? colectivoId,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (eventId != null) 'event_id': eventId,
      if (colectivoId != null) 'colectivo_id': colectivoId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventColectivosCompanion copyWith({
    drift.Value<String>? eventId,
    drift.Value<String>? colectivoId,
    drift.Value<int>? rowid,
  }) {
    return EventColectivosCompanion(
      eventId: eventId ?? this.eventId,
      colectivoId: colectivoId ?? this.colectivoId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (eventId.present) {
      map['event_id'] = drift.Variable<String>(eventId.value);
    }
    if (colectivoId.present) {
      map['colectivo_id'] = drift.Variable<String>(colectivoId.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
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

class $EncargadosTable extends Encargados
    with drift.TableInfo<$EncargadosTable, Encargado> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EncargadosTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta = const drift.VerificationMeta(
    'id',
  );
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const drift.VerificationMeta _nameMeta = const drift.VerificationMeta(
    'name',
  );
  @override
  late final drift.GeneratedColumn<String> name = drift.GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const drift.VerificationMeta _phoneMeta = const drift.VerificationMeta(
    'phone',
  );
  @override
  late final drift.GeneratedColumn<String> phone =
      drift.GeneratedColumn<String>(
        'phone',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _balanceMeta =
      const drift.VerificationMeta('balance');
  @override
  late final drift.GeneratedColumn<double> balance =
      drift.GeneratedColumn<double>(
        'balance',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const drift.Constant(0.0),
      );
  static const drift.VerificationMeta _isSyncedMeta =
      const drift.VerificationMeta('isSynced');
  @override
  late final drift.GeneratedColumn<bool> isSynced = drift.GeneratedColumn<bool>(
    'is_synced',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_synced" IN (0, 1))',
    ),
    defaultValue: const drift.Constant(false),
  );
  @override
  List<drift.GeneratedColumn> get $columns => [
    id,
    name,
    phone,
    balance,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'encargados';
  @override
  drift.VerificationContext validateIntegrity(
    drift.Insertable<Encargado> instance, {
    bool isInserting = false,
  }) {
    final context = drift.VerificationContext();
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
  Set<drift.GeneratedColumn> get $primaryKey => {id};
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

class Encargado extends drift.DataClass implements drift.Insertable<Encargado> {
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['name'] = drift.Variable<String>(name);
    if (!nullToAbsent || phone != null) {
      map['phone'] = drift.Variable<String>(phone);
    }
    map['balance'] = drift.Variable<double>(balance);
    map['is_synced'] = drift.Variable<bool>(isSynced);
    return map;
  }

  EncargadosCompanion toCompanion(bool nullToAbsent) {
    return EncargadosCompanion(
      id: drift.Value(id),
      name: drift.Value(name),
      phone: phone == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(phone),
      balance: drift.Value(balance),
      isSynced: drift.Value(isSynced),
    );
  }

  factory Encargado.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
    drift.Value<String?> phone = const drift.Value.absent(),
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

class EncargadosCompanion extends drift.UpdateCompanion<Encargado> {
  final drift.Value<String> id;
  final drift.Value<String> name;
  final drift.Value<String?> phone;
  final drift.Value<double> balance;
  final drift.Value<bool> isSynced;
  final drift.Value<int> rowid;
  const EncargadosCompanion({
    this.id = const drift.Value.absent(),
    this.name = const drift.Value.absent(),
    this.phone = const drift.Value.absent(),
    this.balance = const drift.Value.absent(),
    this.isSynced = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  EncargadosCompanion.insert({
    required String id,
    required String name,
    this.phone = const drift.Value.absent(),
    this.balance = const drift.Value.absent(),
    this.isSynced = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  }) : id = drift.Value(id),
       name = drift.Value(name);
  static drift.Insertable<Encargado> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? name,
    drift.Expression<String>? phone,
    drift.Expression<double>? balance,
    drift.Expression<bool>? isSynced,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (balance != null) 'balance': balance,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EncargadosCompanion copyWith({
    drift.Value<String>? id,
    drift.Value<String>? name,
    drift.Value<String?>? phone,
    drift.Value<double>? balance,
    drift.Value<bool>? isSynced,
    drift.Value<int>? rowid,
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = drift.Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = drift.Variable<String>(phone.value);
    }
    if (balance.present) {
      map['balance'] = drift.Variable<double>(balance.value);
    }
    if (isSynced.present) {
      map['is_synced'] = drift.Variable<bool>(isSynced.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
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
    with drift.TableInfo<$RecorridoSubscriptionsTable, RecorridoSubscription> {
  @override
  final drift.GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecorridoSubscriptionsTable(this.attachedDatabase, [this._alias]);
  static const drift.VerificationMeta _idMeta = const drift.VerificationMeta(
    'id',
  );
  @override
  late final drift.GeneratedColumn<String> id = drift.GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const drift.VerificationMeta _recorridoIdMeta =
      const drift.VerificationMeta('recorridoId');
  @override
  late final drift.GeneratedColumn<String> recorridoId =
      drift.GeneratedColumn<String>(
        'recorrido_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES recorridos (id) ON DELETE CASCADE',
        ),
      );
  static const drift.VerificationMeta _encargadoIdMeta =
      const drift.VerificationMeta('encargadoId');
  @override
  late final drift.GeneratedColumn<String> encargadoId =
      drift.GeneratedColumn<String>(
        'encargado_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES encargados (id) ON DELETE CASCADE',
        ),
      );
  static const drift.VerificationMeta _subscriptionNameMeta =
      const drift.VerificationMeta('subscriptionName');
  @override
  late final drift.GeneratedColumn<String> subscriptionName =
      drift.GeneratedColumn<String>(
        'subscription_name',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const drift.VerificationMeta _addressMeta =
      const drift.VerificationMeta('address');
  @override
  late final drift.GeneratedColumn<String> address =
      drift.GeneratedColumn<String>(
        'address',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _customPriceMeta =
      const drift.VerificationMeta('customPrice');
  @override
  late final drift.GeneratedColumn<int> customPrice =
      drift.GeneratedColumn<int>(
        'custom_price',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      );
  static const drift.VerificationMeta _isActiveMeta =
      const drift.VerificationMeta('isActive');
  @override
  late final drift.GeneratedColumn<bool> isActive = drift.GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const drift.Constant(true),
  );
  @override
  List<drift.GeneratedColumn> get $columns => [
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
  drift.VerificationContext validateIntegrity(
    drift.Insertable<RecorridoSubscription> instance, {
    bool isInserting = false,
  }) {
    final context = drift.VerificationContext();
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
  Set<drift.GeneratedColumn> get $primaryKey => {id};
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

class RecorridoSubscription extends drift.DataClass
    implements drift.Insertable<RecorridoSubscription> {
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    map['id'] = drift.Variable<String>(id);
    map['recorrido_id'] = drift.Variable<String>(recorridoId);
    map['encargado_id'] = drift.Variable<String>(encargadoId);
    map['subscription_name'] = drift.Variable<String>(subscriptionName);
    if (!nullToAbsent || address != null) {
      map['address'] = drift.Variable<String>(address);
    }
    if (!nullToAbsent || customPrice != null) {
      map['custom_price'] = drift.Variable<int>(customPrice);
    }
    map['is_active'] = drift.Variable<bool>(isActive);
    return map;
  }

  RecorridoSubscriptionsCompanion toCompanion(bool nullToAbsent) {
    return RecorridoSubscriptionsCompanion(
      id: drift.Value(id),
      recorridoId: drift.Value(recorridoId),
      encargadoId: drift.Value(encargadoId),
      subscriptionName: drift.Value(subscriptionName),
      address: address == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(address),
      customPrice: customPrice == null && nullToAbsent
          ? const drift.Value.absent()
          : drift.Value(customPrice),
      isActive: drift.Value(isActive),
    );
  }

  factory RecorridoSubscription.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
    serializer ??= drift.driftRuntimeOptions.defaultSerializer;
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
    drift.Value<String?> address = const drift.Value.absent(),
    drift.Value<int?> customPrice = const drift.Value.absent(),
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
    extends drift.UpdateCompanion<RecorridoSubscription> {
  final drift.Value<String> id;
  final drift.Value<String> recorridoId;
  final drift.Value<String> encargadoId;
  final drift.Value<String> subscriptionName;
  final drift.Value<String?> address;
  final drift.Value<int?> customPrice;
  final drift.Value<bool> isActive;
  final drift.Value<int> rowid;
  const RecorridoSubscriptionsCompanion({
    this.id = const drift.Value.absent(),
    this.recorridoId = const drift.Value.absent(),
    this.encargadoId = const drift.Value.absent(),
    this.subscriptionName = const drift.Value.absent(),
    this.address = const drift.Value.absent(),
    this.customPrice = const drift.Value.absent(),
    this.isActive = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  });
  RecorridoSubscriptionsCompanion.insert({
    required String id,
    required String recorridoId,
    required String encargadoId,
    required String subscriptionName,
    this.address = const drift.Value.absent(),
    this.customPrice = const drift.Value.absent(),
    this.isActive = const drift.Value.absent(),
    this.rowid = const drift.Value.absent(),
  }) : id = drift.Value(id),
       recorridoId = drift.Value(recorridoId),
       encargadoId = drift.Value(encargadoId),
       subscriptionName = drift.Value(subscriptionName);
  static drift.Insertable<RecorridoSubscription> custom({
    drift.Expression<String>? id,
    drift.Expression<String>? recorridoId,
    drift.Expression<String>? encargadoId,
    drift.Expression<String>? subscriptionName,
    drift.Expression<String>? address,
    drift.Expression<int>? customPrice,
    drift.Expression<bool>? isActive,
    drift.Expression<int>? rowid,
  }) {
    return drift.RawValuesInsertable({
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
    drift.Value<String>? id,
    drift.Value<String>? recorridoId,
    drift.Value<String>? encargadoId,
    drift.Value<String>? subscriptionName,
    drift.Value<String?>? address,
    drift.Value<int?>? customPrice,
    drift.Value<bool>? isActive,
    drift.Value<int>? rowid,
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
  Map<String, drift.Expression> toColumns(bool nullToAbsent) {
    final map = <String, drift.Expression>{};
    if (id.present) {
      map['id'] = drift.Variable<String>(id.value);
    }
    if (recorridoId.present) {
      map['recorrido_id'] = drift.Variable<String>(recorridoId.value);
    }
    if (encargadoId.present) {
      map['encargado_id'] = drift.Variable<String>(encargadoId.value);
    }
    if (subscriptionName.present) {
      map['subscription_name'] = drift.Variable<String>(subscriptionName.value);
    }
    if (address.present) {
      map['address'] = drift.Variable<String>(address.value);
    }
    if (customPrice.present) {
      map['custom_price'] = drift.Variable<int>(customPrice.value);
    }
    if (isActive.present) {
      map['is_active'] = drift.Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = drift.Variable<int>(rowid.value);
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

abstract class _$AppDatabase extends drift.GeneratedDatabase {
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
  late final $EncargadosTable encargados = $EncargadosTable(this);
  late final $RecorridoSubscriptionsTable recorridoSubscriptions =
      $RecorridoSubscriptionsTable(this);
  @override
  Iterable<drift.TableInfo<drift.Table, Object?>> get allTables =>
      allSchemaEntities.whereType<drift.TableInfo<drift.Table, Object?>>();
  @override
  List<drift.DatabaseSchemaEntity> get allSchemaEntities => [
    choferes,
    colectivos,
    recorridos,
    events,
    stops,
    eventChoferes,
    eventColectivos,
    encargados,
    recorridoSubscriptions,
  ];
  @override
  drift.StreamQueryUpdateRules get streamUpdateRules =>
      const StreamQueryUpdateRules([
        drift.WritePropagation(
          on: drift.TableUpdateQuery.onTableName(
            'events',
            limitUpdateKind: drift.UpdateKind.delete,
          ),
          result: [drift.TableUpdate('stops', kind: drift.UpdateKind.delete)],
        ),
        drift.WritePropagation(
          on: drift.TableUpdateQuery.onTableName(
            'events',
            limitUpdateKind: drift.UpdateKind.delete,
          ),
          result: [
            drift.TableUpdate('event_choferes', kind: drift.UpdateKind.delete),
          ],
        ),
        drift.WritePropagation(
          on: drift.TableUpdateQuery.onTableName(
            'choferes',
            limitUpdateKind: drift.UpdateKind.delete,
          ),
          result: [
            drift.TableUpdate('event_choferes', kind: drift.UpdateKind.delete),
          ],
        ),
        drift.WritePropagation(
          on: drift.TableUpdateQuery.onTableName(
            'events',
            limitUpdateKind: drift.UpdateKind.delete,
          ),
          result: [
            drift.TableUpdate(
              'event_colectivos',
              kind: drift.UpdateKind.delete,
            ),
          ],
        ),
        drift.WritePropagation(
          on: drift.TableUpdateQuery.onTableName(
            'colectivos',
            limitUpdateKind: drift.UpdateKind.delete,
          ),
          result: [
            drift.TableUpdate(
              'event_colectivos',
              kind: drift.UpdateKind.delete,
            ),
          ],
        ),
        drift.WritePropagation(
          on: drift.TableUpdateQuery.onTableName(
            'recorridos',
            limitUpdateKind: drift.UpdateKind.delete,
          ),
          result: [
            drift.TableUpdate(
              'recorrido_subscriptions',
              kind: drift.UpdateKind.delete,
            ),
          ],
        ),
        drift.WritePropagation(
          on: drift.TableUpdateQuery.onTableName(
            'encargados',
            limitUpdateKind: drift.UpdateKind.delete,
          ),
          result: [
            drift.TableUpdate(
              'recorrido_subscriptions',
              kind: drift.UpdateKind.delete,
            ),
          ],
        ),
      ]);
}

typedef $$ChoferesTableCreateCompanionBuilder =
    ChoferesCompanion Function({
      required String id,
      drift.Value<String?> dni,
      drift.Value<String?> name,
      drift.Value<String?> surname,
      drift.Value<String?> alias,
      drift.Value<String?> mobileNumber,
      drift.Value<String?> picturePath,
      drift.Value<double> balance,
      drift.Value<bool> is_active,
      drift.Value<bool> isSynced,
      drift.Value<int> rowid,
    });
typedef $$ChoferesTableUpdateCompanionBuilder =
    ChoferesCompanion Function({
      drift.Value<String> id,
      drift.Value<String?> dni,
      drift.Value<String?> name,
      drift.Value<String?> surname,
      drift.Value<String?> alias,
      drift.Value<String?> mobileNumber,
      drift.Value<String?> picturePath,
      drift.Value<double> balance,
      drift.Value<bool> is_active,
      drift.Value<bool> isSynced,
      drift.Value<int> rowid,
    });

final class $$ChoferesTableReferences
    extends drift.BaseReferences<_$AppDatabase, $ChoferesTable, Chofere> {
  $$ChoferesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static drift.MultiTypedResultKey<$EventChoferesTable, List<EventChofere>>
  _eventChoferesRefsTable(_$AppDatabase db) =>
      drift.MultiTypedResultKey.fromTable(
        db.eventChoferes,
        aliasName: drift.$_aliasNameGenerator(
          db.choferes.id,
          db.eventChoferes.choferId,
        ),
      );

  $$EventChoferesTableProcessedTableManager get eventChoferesRefs {
    final manager = $$EventChoferesTableTableManager(
      $_db,
      $_db.eventChoferes,
    ).filter((f) => f.choferId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventChoferesRefsTable($_db));
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChoferesTableFilterComposer
    extends drift.Composer<_$AppDatabase, $ChoferesTable> {
  $$ChoferesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get dni => $composableBuilder(
    column: $table.dni,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get surname => $composableBuilder(
    column: $table.surname,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get alias => $composableBuilder(
    column: $table.alias,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get picturePath => $composableBuilder(
    column: $table.picturePath,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<double> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<bool> get is_active => $composableBuilder(
    column: $table.is_active,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.Expression<bool> eventChoferesRefs(
    drift.Expression<bool> Function($$EventChoferesTableFilterComposer f) f,
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
    extends drift.Composer<_$AppDatabase, $ChoferesTable> {
  $$ChoferesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get dni => $composableBuilder(
    column: $table.dni,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get surname => $composableBuilder(
    column: $table.surname,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get alias => $composableBuilder(
    column: $table.alias,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get picturePath => $composableBuilder(
    column: $table.picturePath,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<double> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get is_active => $composableBuilder(
    column: $table.is_active,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => drift.ColumnOrderings(column),
  );
}

class $$ChoferesTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $ChoferesTable> {
  $$ChoferesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get dni =>
      $composableBuilder(column: $table.dni, builder: (column) => column);

  drift.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  drift.GeneratedColumn<String> get surname =>
      $composableBuilder(column: $table.surname, builder: (column) => column);

  drift.GeneratedColumn<String> get alias =>
      $composableBuilder(column: $table.alias, builder: (column) => column);

  drift.GeneratedColumn<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get picturePath => $composableBuilder(
    column: $table.picturePath,
    builder: (column) => column,
  );

  drift.GeneratedColumn<double> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  drift.GeneratedColumn<bool> get is_active =>
      $composableBuilder(column: $table.is_active, builder: (column) => column);

  drift.GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  drift.Expression<T> eventChoferesRefs<T extends Object>(
    drift.Expression<T> Function($$EventChoferesTableAnnotationComposer a) f,
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
        drift.RootTableManager<
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
          drift.PrefetchHooks Function({bool eventChoferesRefs})
        > {
  $$ChoferesTableTableManager(_$AppDatabase db, $ChoferesTable table)
    : super(
        drift.TableManagerState(
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
                drift.Value<String> id = const drift.Value.absent(),
                drift.Value<String?> dni = const drift.Value.absent(),
                drift.Value<String?> name = const drift.Value.absent(),
                drift.Value<String?> surname = const drift.Value.absent(),
                drift.Value<String?> alias = const drift.Value.absent(),
                drift.Value<String?> mobileNumber = const drift.Value.absent(),
                drift.Value<String?> picturePath = const drift.Value.absent(),
                drift.Value<double> balance = const drift.Value.absent(),
                drift.Value<bool> is_active = const drift.Value.absent(),
                drift.Value<bool> isSynced = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
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
                drift.Value<String?> dni = const drift.Value.absent(),
                drift.Value<String?> name = const drift.Value.absent(),
                drift.Value<String?> surname = const drift.Value.absent(),
                drift.Value<String?> alias = const drift.Value.absent(),
                drift.Value<String?> mobileNumber = const drift.Value.absent(),
                drift.Value<String?> picturePath = const drift.Value.absent(),
                drift.Value<double> balance = const drift.Value.absent(),
                drift.Value<bool> is_active = const drift.Value.absent(),
                drift.Value<bool> isSynced = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
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
          prefetchHooksCallback: ({eventChoferesRefs = false}) {
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (eventChoferesRefs) db.eventChoferes,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventChoferesRefs)
                    await drift.$_getPrefetchedData<
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
    drift.ProcessedTableManager<
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
      drift.PrefetchHooks Function({bool eventChoferesRefs})
    >;
typedef $$ColectivosTableCreateCompanionBuilder =
    ColectivosCompanion Function({
      required String id,
      required String plate,
      drift.Value<DateTime> vtv,
      drift.Value<String?> name,
      drift.Value<int?> number,
      drift.Value<int> capacity,
      required String fuelAmount,
      required DateTime fuelDate,
      required DateTime oilDate,
      drift.Value<bool> is_active,
      drift.Value<bool> isSynced,
      drift.Value<int> rowid,
    });
typedef $$ColectivosTableUpdateCompanionBuilder =
    ColectivosCompanion Function({
      drift.Value<String> id,
      drift.Value<String> plate,
      drift.Value<DateTime> vtv,
      drift.Value<String?> name,
      drift.Value<int?> number,
      drift.Value<int> capacity,
      drift.Value<String> fuelAmount,
      drift.Value<DateTime> fuelDate,
      drift.Value<DateTime> oilDate,
      drift.Value<bool> is_active,
      drift.Value<bool> isSynced,
      drift.Value<int> rowid,
    });

final class $$ColectivosTableReferences
    extends drift.BaseReferences<_$AppDatabase, $ColectivosTable, Colectivo> {
  $$ColectivosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static drift.MultiTypedResultKey<$EventColectivosTable, List<EventColectivo>>
  _eventColectivosRefsTable(_$AppDatabase db) =>
      drift.MultiTypedResultKey.fromTable(
        db.eventColectivos,
        aliasName: drift.$_aliasNameGenerator(
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
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ColectivosTableFilterComposer
    extends drift.Composer<_$AppDatabase, $ColectivosTable> {
  $$ColectivosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get plate => $composableBuilder(
    column: $table.plate,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<DateTime> get vtv => $composableBuilder(
    column: $table.vtv,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<int> get capacity => $composableBuilder(
    column: $table.capacity,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get fuelAmount => $composableBuilder(
    column: $table.fuelAmount,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<DateTime> get fuelDate => $composableBuilder(
    column: $table.fuelDate,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<DateTime> get oilDate => $composableBuilder(
    column: $table.oilDate,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<bool> get is_active => $composableBuilder(
    column: $table.is_active,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.Expression<bool> eventColectivosRefs(
    drift.Expression<bool> Function($$EventColectivosTableFilterComposer f) f,
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
    extends drift.Composer<_$AppDatabase, $ColectivosTable> {
  $$ColectivosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get plate => $composableBuilder(
    column: $table.plate,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<DateTime> get vtv => $composableBuilder(
    column: $table.vtv,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<int> get capacity => $composableBuilder(
    column: $table.capacity,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get fuelAmount => $composableBuilder(
    column: $table.fuelAmount,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<DateTime> get fuelDate => $composableBuilder(
    column: $table.fuelDate,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<DateTime> get oilDate => $composableBuilder(
    column: $table.oilDate,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get is_active => $composableBuilder(
    column: $table.is_active,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => drift.ColumnOrderings(column),
  );
}

class $$ColectivosTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $ColectivosTable> {
  $$ColectivosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get plate =>
      $composableBuilder(column: $table.plate, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get vtv =>
      $composableBuilder(column: $table.vtv, builder: (column) => column);

  drift.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  drift.GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  drift.GeneratedColumn<int> get capacity =>
      $composableBuilder(column: $table.capacity, builder: (column) => column);

  drift.GeneratedColumn<String> get fuelAmount => $composableBuilder(
    column: $table.fuelAmount,
    builder: (column) => column,
  );

  drift.GeneratedColumn<DateTime> get fuelDate =>
      $composableBuilder(column: $table.fuelDate, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get oilDate =>
      $composableBuilder(column: $table.oilDate, builder: (column) => column);

  drift.GeneratedColumn<bool> get is_active =>
      $composableBuilder(column: $table.is_active, builder: (column) => column);

  drift.GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  drift.Expression<T> eventColectivosRefs<T extends Object>(
    drift.Expression<T> Function($$EventColectivosTableAnnotationComposer a) f,
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
        drift.RootTableManager<
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
          drift.PrefetchHooks Function({bool eventColectivosRefs})
        > {
  $$ColectivosTableTableManager(_$AppDatabase db, $ColectivosTable table)
    : super(
        drift.TableManagerState(
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
                drift.Value<String> id = const drift.Value.absent(),
                drift.Value<String> plate = const drift.Value.absent(),
                drift.Value<DateTime> vtv = const drift.Value.absent(),
                drift.Value<String?> name = const drift.Value.absent(),
                drift.Value<int?> number = const drift.Value.absent(),
                drift.Value<int> capacity = const drift.Value.absent(),
                drift.Value<String> fuelAmount = const drift.Value.absent(),
                drift.Value<DateTime> fuelDate = const drift.Value.absent(),
                drift.Value<DateTime> oilDate = const drift.Value.absent(),
                drift.Value<bool> is_active = const drift.Value.absent(),
                drift.Value<bool> isSynced = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
              }) => ColectivosCompanion(
                id: id,
                plate: plate,
                vtv: vtv,
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
                drift.Value<DateTime> vtv = const drift.Value.absent(),
                drift.Value<String?> name = const drift.Value.absent(),
                drift.Value<int?> number = const drift.Value.absent(),
                drift.Value<int> capacity = const drift.Value.absent(),
                required String fuelAmount,
                required DateTime fuelDate,
                required DateTime oilDate,
                drift.Value<bool> is_active = const drift.Value.absent(),
                drift.Value<bool> isSynced = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
              }) => ColectivosCompanion.insert(
                id: id,
                plate: plate,
                vtv: vtv,
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
          prefetchHooksCallback: ({eventColectivosRefs = false}) {
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (eventColectivosRefs) db.eventColectivos,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventColectivosRefs)
                    await drift.$_getPrefetchedData<
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
    drift.ProcessedTableManager<
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
      drift.PrefetchHooks Function({bool eventColectivosRefs})
    >;
typedef $$RecorridosTableCreateCompanionBuilder =
    RecorridosCompanion Function({
      required String id,
      required String name,
      drift.Value<bool> pinned,
      drift.Value<int> basePrice,
      drift.Value<bool> isActive,
      drift.Value<bool> isSynced,
      drift.Value<int> rowid,
    });
typedef $$RecorridosTableUpdateCompanionBuilder =
    RecorridosCompanion Function({
      drift.Value<String> id,
      drift.Value<String> name,
      drift.Value<bool> pinned,
      drift.Value<int> basePrice,
      drift.Value<bool> isActive,
      drift.Value<bool> isSynced,
      drift.Value<int> rowid,
    });

final class $$RecorridosTableReferences
    extends drift.BaseReferences<_$AppDatabase, $RecorridosTable, Recorrido> {
  $$RecorridosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static drift.MultiTypedResultKey<$EventsTable, List<Event>> _eventsRefsTable(
    _$AppDatabase db,
  ) => drift.MultiTypedResultKey.fromTable(
    db.events,
    aliasName: drift.$_aliasNameGenerator(
      db.recorridos.id,
      db.events.recorridoId,
    ),
  );

  $$EventsTableProcessedTableManager get eventsRefs {
    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.recorridoId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventsRefsTable($_db));
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static drift.MultiTypedResultKey<
    $RecorridoSubscriptionsTable,
    List<RecorridoSubscription>
  >
  _recorridoSubscriptionsRefsTable(_$AppDatabase db) =>
      drift.MultiTypedResultKey.fromTable(
        db.recorridoSubscriptions,
        aliasName: drift.$_aliasNameGenerator(
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
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecorridosTableFilterComposer
    extends drift.Composer<_$AppDatabase, $RecorridosTable> {
  $$RecorridosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<bool> get pinned => $composableBuilder(
    column: $table.pinned,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<int> get basePrice => $composableBuilder(
    column: $table.basePrice,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.Expression<bool> eventsRefs(
    drift.Expression<bool> Function($$EventsTableFilterComposer f) f,
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

  drift.Expression<bool> recorridoSubscriptionsRefs(
    drift.Expression<bool> Function(
      $$RecorridoSubscriptionsTableFilterComposer f,
    )
    f,
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
    extends drift.Composer<_$AppDatabase, $RecorridosTable> {
  $$RecorridosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get pinned => $composableBuilder(
    column: $table.pinned,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<int> get basePrice => $composableBuilder(
    column: $table.basePrice,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => drift.ColumnOrderings(column),
  );
}

class $$RecorridosTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $RecorridosTable> {
  $$RecorridosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  drift.GeneratedColumn<bool> get pinned =>
      $composableBuilder(column: $table.pinned, builder: (column) => column);

  drift.GeneratedColumn<int> get basePrice =>
      $composableBuilder(column: $table.basePrice, builder: (column) => column);

  drift.GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  drift.GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  drift.Expression<T> eventsRefs<T extends Object>(
    drift.Expression<T> Function($$EventsTableAnnotationComposer a) f,
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

  drift.Expression<T> recorridoSubscriptionsRefs<T extends Object>(
    drift.Expression<T> Function(
      $$RecorridoSubscriptionsTableAnnotationComposer a,
    )
    f,
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
        drift.RootTableManager<
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
          drift.PrefetchHooks Function({
            bool eventsRefs,
            bool recorridoSubscriptionsRefs,
          })
        > {
  $$RecorridosTableTableManager(_$AppDatabase db, $RecorridosTable table)
    : super(
        drift.TableManagerState(
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
                drift.Value<String> id = const drift.Value.absent(),
                drift.Value<String> name = const drift.Value.absent(),
                drift.Value<bool> pinned = const drift.Value.absent(),
                drift.Value<int> basePrice = const drift.Value.absent(),
                drift.Value<bool> isActive = const drift.Value.absent(),
                drift.Value<bool> isSynced = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
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
                drift.Value<bool> pinned = const drift.Value.absent(),
                drift.Value<int> basePrice = const drift.Value.absent(),
                drift.Value<bool> isActive = const drift.Value.absent(),
                drift.Value<bool> isSynced = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
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
              ({eventsRefs = false, recorridoSubscriptionsRefs = false}) {
                return drift.PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (eventsRefs) db.events,
                    if (recorridoSubscriptionsRefs) db.recorridoSubscriptions,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (eventsRefs)
                        await drift.$_getPrefetchedData<
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
                      if (recorridoSubscriptionsRefs)
                        await drift.$_getPrefetchedData<
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
    drift.ProcessedTableManager<
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
      drift.PrefetchHooks Function({
        bool eventsRefs,
        bool recorridoSubscriptionsRefs,
      })
    >;
typedef $$EventsTableCreateCompanionBuilder =
    EventsCompanion Function({
      required String id,
      required String name,
      drift.Value<int> price,
      drift.Value<String> data,
      drift.Value<String?> contactName,
      drift.Value<String?> contact,
      drift.Value<bool> repeat,
      drift.Value<List<WeekDays>?> days,
      required DateTime startDateTime,
      required DateTime endDateTime,
      drift.Value<DateTime?> stopRepeatingDateTime,
      required EventStates state,
      required EventTypes type,
      required bool isTrip,
      drift.Value<bool> isSynced,
      drift.Value<String?> recorridoId,
      drift.Value<String?> shiftId,
      drift.Value<int> rowid,
    });
typedef $$EventsTableUpdateCompanionBuilder =
    EventsCompanion Function({
      drift.Value<String> id,
      drift.Value<String> name,
      drift.Value<int> price,
      drift.Value<String> data,
      drift.Value<String?> contactName,
      drift.Value<String?> contact,
      drift.Value<bool> repeat,
      drift.Value<List<WeekDays>?> days,
      drift.Value<DateTime> startDateTime,
      drift.Value<DateTime> endDateTime,
      drift.Value<DateTime?> stopRepeatingDateTime,
      drift.Value<EventStates> state,
      drift.Value<EventTypes> type,
      drift.Value<bool> isTrip,
      drift.Value<bool> isSynced,
      drift.Value<String?> recorridoId,
      drift.Value<String?> shiftId,
      drift.Value<int> rowid,
    });

final class $$EventsTableReferences
    extends drift.BaseReferences<_$AppDatabase, $EventsTable, Event> {
  $$EventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RecorridosTable _recorridoIdTable(_$AppDatabase db) =>
      db.recorridos.createAlias(
        drift.$_aliasNameGenerator(db.events.recorridoId, db.recorridos.id),
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
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EventsTable _shiftIdTable(_$AppDatabase db) => db.events.createAlias(
    drift.$_aliasNameGenerator(db.events.shiftId, db.events.id),
  );

  $$EventsTableProcessedTableManager? get shiftId {
    final $_column = $_itemColumn<String>('shift_id');
    if ($_column == null) return null;
    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_shiftIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static drift.MultiTypedResultKey<$StopsTable, List<Stop>> _stopsRefsTable(
    _$AppDatabase db,
  ) => drift.MultiTypedResultKey.fromTable(
    db.stops,
    aliasName: drift.$_aliasNameGenerator(db.events.id, db.stops.eventId),
  );

  $$StopsTableProcessedTableManager get stopsRefs {
    final manager = $$StopsTableTableManager(
      $_db,
      $_db.stops,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_stopsRefsTable($_db));
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static drift.MultiTypedResultKey<$EventChoferesTable, List<EventChofere>>
  _eventChoferesRefsTable(_$AppDatabase db) =>
      drift.MultiTypedResultKey.fromTable(
        db.eventChoferes,
        aliasName: drift.$_aliasNameGenerator(
          db.events.id,
          db.eventChoferes.eventId,
        ),
      );

  $$EventChoferesTableProcessedTableManager get eventChoferesRefs {
    final manager = $$EventChoferesTableTableManager(
      $_db,
      $_db.eventChoferes,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventChoferesRefsTable($_db));
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static drift.MultiTypedResultKey<$EventColectivosTable, List<EventColectivo>>
  _eventColectivosRefsTable(_$AppDatabase db) =>
      drift.MultiTypedResultKey.fromTable(
        db.eventColectivos,
        aliasName: drift.$_aliasNameGenerator(
          db.events.id,
          db.eventColectivos.eventId,
        ),
      );

  $$EventColectivosTableProcessedTableManager get eventColectivosRefs {
    final manager = $$EventColectivosTableTableManager(
      $_db,
      $_db.eventColectivos,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _eventColectivosRefsTable($_db),
    );
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EventsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<bool> get repeat => $composableBuilder(
    column: $table.repeat,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnWithTypeConverterFilters<List<WeekDays>?, List<WeekDays>, String>
  get days => $composableBuilder(
    column: $table.days,
    builder: (column) => drift.ColumnWithTypeConverterFilters(column),
  );

  drift.ColumnFilters<DateTime> get startDateTime => $composableBuilder(
    column: $table.startDateTime,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<DateTime> get endDateTime => $composableBuilder(
    column: $table.endDateTime,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<DateTime> get stopRepeatingDateTime => $composableBuilder(
    column: $table.stopRepeatingDateTime,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnWithTypeConverterFilters<EventStates, EventStates, int>
  get state => $composableBuilder(
    column: $table.state,
    builder: (column) => drift.ColumnWithTypeConverterFilters(column),
  );

  drift.ColumnWithTypeConverterFilters<EventTypes, EventTypes, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => drift.ColumnWithTypeConverterFilters(column),
      );

  drift.ColumnFilters<bool> get isTrip => $composableBuilder(
    column: $table.isTrip,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => drift.ColumnFilters(column),
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

  $$EventsTableFilterComposer get shiftId {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
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

  drift.Expression<bool> stopsRefs(
    drift.Expression<bool> Function($$StopsTableFilterComposer f) f,
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

  drift.Expression<bool> eventChoferesRefs(
    drift.Expression<bool> Function($$EventChoferesTableFilterComposer f) f,
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

  drift.Expression<bool> eventColectivosRefs(
    drift.Expression<bool> Function($$EventColectivosTableFilterComposer f) f,
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
    extends drift.Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get data => $composableBuilder(
    column: $table.data,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get contact => $composableBuilder(
    column: $table.contact,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get repeat => $composableBuilder(
    column: $table.repeat,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get days => $composableBuilder(
    column: $table.days,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<DateTime> get startDateTime => $composableBuilder(
    column: $table.startDateTime,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<DateTime> get endDateTime => $composableBuilder(
    column: $table.endDateTime,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<DateTime> get stopRepeatingDateTime =>
      $composableBuilder(
        column: $table.stopRepeatingDateTime,
        builder: (column) => drift.ColumnOrderings(column),
      );

  drift.ColumnOrderings<int> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get isTrip => $composableBuilder(
    column: $table.isTrip,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => drift.ColumnOrderings(column),
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

  $$EventsTableOrderingComposer get shiftId {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
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

class $$EventsTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $EventsTable> {
  $$EventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  drift.GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  drift.GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  drift.GeneratedColumn<String> get contactName => $composableBuilder(
    column: $table.contactName,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  drift.GeneratedColumn<bool> get repeat =>
      $composableBuilder(column: $table.repeat, builder: (column) => column);

  drift.GeneratedColumnWithTypeConverter<List<WeekDays>?, String> get days =>
      $composableBuilder(column: $table.days, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get startDateTime => $composableBuilder(
    column: $table.startDateTime,
    builder: (column) => column,
  );

  drift.GeneratedColumn<DateTime> get endDateTime => $composableBuilder(
    column: $table.endDateTime,
    builder: (column) => column,
  );

  drift.GeneratedColumn<DateTime> get stopRepeatingDateTime =>
      $composableBuilder(
        column: $table.stopRepeatingDateTime,
        builder: (column) => column,
      );

  drift.GeneratedColumnWithTypeConverter<EventStates, int> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  drift.GeneratedColumnWithTypeConverter<EventTypes, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  drift.GeneratedColumn<bool> get isTrip =>
      $composableBuilder(column: $table.isTrip, builder: (column) => column);

  drift.GeneratedColumn<bool> get isSynced =>
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

  $$EventsTableAnnotationComposer get shiftId {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.shiftId,
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

  drift.Expression<T> stopsRefs<T extends Object>(
    drift.Expression<T> Function($$StopsTableAnnotationComposer a) f,
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

  drift.Expression<T> eventChoferesRefs<T extends Object>(
    drift.Expression<T> Function($$EventChoferesTableAnnotationComposer a) f,
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

  drift.Expression<T> eventColectivosRefs<T extends Object>(
    drift.Expression<T> Function($$EventColectivosTableAnnotationComposer a) f,
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
        drift.RootTableManager<
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
          drift.PrefetchHooks Function({
            bool recorridoId,
            bool shiftId,
            bool stopsRefs,
            bool eventChoferesRefs,
            bool eventColectivosRefs,
          })
        > {
  $$EventsTableTableManager(_$AppDatabase db, $EventsTable table)
    : super(
        drift.TableManagerState(
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
                drift.Value<String> id = const drift.Value.absent(),
                drift.Value<String> name = const drift.Value.absent(),
                drift.Value<int> price = const drift.Value.absent(),
                drift.Value<String> data = const drift.Value.absent(),
                drift.Value<String?> contactName = const drift.Value.absent(),
                drift.Value<String?> contact = const drift.Value.absent(),
                drift.Value<bool> repeat = const drift.Value.absent(),
                drift.Value<List<WeekDays>?> days = const drift.Value.absent(),
                drift.Value<DateTime> startDateTime =
                    const drift.Value.absent(),
                drift.Value<DateTime> endDateTime = const drift.Value.absent(),
                drift.Value<DateTime?> stopRepeatingDateTime =
                    const drift.Value.absent(),
                drift.Value<EventStates> state = const drift.Value.absent(),
                drift.Value<EventTypes> type = const drift.Value.absent(),
                drift.Value<bool> isTrip = const drift.Value.absent(),
                drift.Value<bool> isSynced = const drift.Value.absent(),
                drift.Value<String?> recorridoId = const drift.Value.absent(),
                drift.Value<String?> shiftId = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
              }) => EventsCompanion(
                id: id,
                name: name,
                price: price,
                data: data,
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
                shiftId: shiftId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                drift.Value<int> price = const drift.Value.absent(),
                drift.Value<String> data = const drift.Value.absent(),
                drift.Value<String?> contactName = const drift.Value.absent(),
                drift.Value<String?> contact = const drift.Value.absent(),
                drift.Value<bool> repeat = const drift.Value.absent(),
                drift.Value<List<WeekDays>?> days = const drift.Value.absent(),
                required DateTime startDateTime,
                required DateTime endDateTime,
                drift.Value<DateTime?> stopRepeatingDateTime =
                    const drift.Value.absent(),
                required EventStates state,
                required EventTypes type,
                required bool isTrip,
                drift.Value<bool> isSynced = const drift.Value.absent(),
                drift.Value<String?> recorridoId = const drift.Value.absent(),
                drift.Value<String?> shiftId = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
              }) => EventsCompanion.insert(
                id: id,
                name: name,
                price: price,
                data: data,
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
                shiftId: shiftId,
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
                shiftId = false,
                stopsRefs = false,
                eventChoferesRefs = false,
                eventColectivosRefs = false,
              }) {
                return drift.PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (stopsRefs) db.stops,
                    if (eventChoferesRefs) db.eventChoferes,
                    if (eventColectivosRefs) db.eventColectivos,
                  ],
                  addJoins:
                      <
                        T extends drift.TableManagerState<
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
                        if (shiftId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.shiftId,
                                    referencedTable: $$EventsTableReferences
                                        ._shiftIdTable(db),
                                    referencedColumn: $$EventsTableReferences
                                        ._shiftIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (stopsRefs)
                        await drift
                            .$_getPrefetchedData<Event, $EventsTable, Stop>(
                              currentTable: table,
                              referencedTable: $$EventsTableReferences
                                  ._stopsRefsTable(db),
                              managerFromTypedResult: (p0) =>
                                  $$EventsTableReferences(
                                    db,
                                    table,
                                    p0,
                                  ).stopsRefs,
                              referencedItemsForCurrentItem:
                                  (item, referencedItems) => referencedItems
                                      .where((e) => e.eventId == item.id),
                              typedResults: items,
                            ),
                      if (eventChoferesRefs)
                        await drift.$_getPrefetchedData<
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
                        await drift.$_getPrefetchedData<
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
    drift.ProcessedTableManager<
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
      drift.PrefetchHooks Function({
        bool recorridoId,
        bool shiftId,
        bool stopsRefs,
        bool eventChoferesRefs,
        bool eventColectivosRefs,
      })
    >;
typedef $$StopsTableCreateCompanionBuilder =
    StopsCompanion Function({
      required String id,
      required String name,
      drift.Value<DateTime?> start,
      required String eventId,
      required int orderIndex,
      drift.Value<int> rowid,
    });
typedef $$StopsTableUpdateCompanionBuilder =
    StopsCompanion Function({
      drift.Value<String> id,
      drift.Value<String> name,
      drift.Value<DateTime?> start,
      drift.Value<String> eventId,
      drift.Value<int> orderIndex,
      drift.Value<int> rowid,
    });

final class $$StopsTableReferences
    extends drift.BaseReferences<_$AppDatabase, $StopsTable, Stop> {
  $$StopsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    drift.$_aliasNameGenerator(db.stops.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StopsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $StopsTable> {
  $$StopsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<DateTime> get start => $composableBuilder(
    column: $table.start,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => drift.ColumnFilters(column),
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
    extends drift.Composer<_$AppDatabase, $StopsTable> {
  $$StopsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<DateTime> get start => $composableBuilder(
    column: $table.start,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => drift.ColumnOrderings(column),
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
    extends drift.Composer<_$AppDatabase, $StopsTable> {
  $$StopsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  drift.GeneratedColumn<DateTime> get start =>
      $composableBuilder(column: $table.start, builder: (column) => column);

  drift.GeneratedColumn<int> get orderIndex => $composableBuilder(
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
        drift.RootTableManager<
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
          drift.PrefetchHooks Function({bool eventId})
        > {
  $$StopsTableTableManager(_$AppDatabase db, $StopsTable table)
    : super(
        drift.TableManagerState(
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
                drift.Value<String> id = const drift.Value.absent(),
                drift.Value<String> name = const drift.Value.absent(),
                drift.Value<DateTime?> start = const drift.Value.absent(),
                drift.Value<String> eventId = const drift.Value.absent(),
                drift.Value<int> orderIndex = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
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
                drift.Value<DateTime?> start = const drift.Value.absent(),
                required String eventId,
                required int orderIndex,
                drift.Value<int> rowid = const drift.Value.absent(),
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
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends drift.TableManagerState<
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
    drift.ProcessedTableManager<
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
      drift.PrefetchHooks Function({bool eventId})
    >;
typedef $$EventChoferesTableCreateCompanionBuilder =
    EventChoferesCompanion Function({
      required String eventId,
      required String choferId,
      drift.Value<int> rowid,
    });
typedef $$EventChoferesTableUpdateCompanionBuilder =
    EventChoferesCompanion Function({
      drift.Value<String> eventId,
      drift.Value<String> choferId,
      drift.Value<int> rowid,
    });

final class $$EventChoferesTableReferences
    extends
        drift.BaseReferences<_$AppDatabase, $EventChoferesTable, EventChofere> {
  $$EventChoferesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    drift.$_aliasNameGenerator(db.eventChoferes.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ChoferesTable _choferIdTable(_$AppDatabase db) =>
      db.choferes.createAlias(
        drift.$_aliasNameGenerator(db.eventChoferes.choferId, db.choferes.id),
      );

  $$ChoferesTableProcessedTableManager get choferId {
    final $_column = $_itemColumn<String>('chofer_id')!;

    final manager = $$ChoferesTableTableManager(
      $_db,
      $_db.choferes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_choferIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EventChoferesTableFilterComposer
    extends drift.Composer<_$AppDatabase, $EventChoferesTable> {
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
    extends drift.Composer<_$AppDatabase, $EventChoferesTable> {
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
    extends drift.Composer<_$AppDatabase, $EventChoferesTable> {
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
        drift.RootTableManager<
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
          drift.PrefetchHooks Function({bool eventId, bool choferId})
        > {
  $$EventChoferesTableTableManager(_$AppDatabase db, $EventChoferesTable table)
    : super(
        drift.TableManagerState(
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
                drift.Value<String> eventId = const drift.Value.absent(),
                drift.Value<String> choferId = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
              }) => EventChoferesCompanion(
                eventId: eventId,
                choferId: choferId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String eventId,
                required String choferId,
                drift.Value<int> rowid = const drift.Value.absent(),
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
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends drift.TableManagerState<
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
    drift.ProcessedTableManager<
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
      drift.PrefetchHooks Function({bool eventId, bool choferId})
    >;
typedef $$EventColectivosTableCreateCompanionBuilder =
    EventColectivosCompanion Function({
      required String eventId,
      required String colectivoId,
      drift.Value<int> rowid,
    });
typedef $$EventColectivosTableUpdateCompanionBuilder =
    EventColectivosCompanion Function({
      drift.Value<String> eventId,
      drift.Value<String> colectivoId,
      drift.Value<int> rowid,
    });

final class $$EventColectivosTableReferences
    extends
        drift.BaseReferences<
          _$AppDatabase,
          $EventColectivosTable,
          EventColectivo
        > {
  $$EventColectivosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EventsTable _eventIdTable(_$AppDatabase db) => db.events.createAlias(
    drift.$_aliasNameGenerator(db.eventColectivos.eventId, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ColectivosTable _colectivoIdTable(_$AppDatabase db) =>
      db.colectivos.createAlias(
        drift.$_aliasNameGenerator(
          db.eventColectivos.colectivoId,
          db.colectivos.id,
        ),
      );

  $$ColectivosTableProcessedTableManager get colectivoId {
    final $_column = $_itemColumn<String>('colectivo_id')!;

    final manager = $$ColectivosTableTableManager(
      $_db,
      $_db.colectivos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_colectivoIdTable($_db));
    if (item == null) return manager;
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EventColectivosTableFilterComposer
    extends drift.Composer<_$AppDatabase, $EventColectivosTable> {
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
    extends drift.Composer<_$AppDatabase, $EventColectivosTable> {
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
    extends drift.Composer<_$AppDatabase, $EventColectivosTable> {
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
        drift.RootTableManager<
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
          drift.PrefetchHooks Function({bool eventId, bool colectivoId})
        > {
  $$EventColectivosTableTableManager(
    _$AppDatabase db,
    $EventColectivosTable table,
  ) : super(
        drift.TableManagerState(
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
                drift.Value<String> eventId = const drift.Value.absent(),
                drift.Value<String> colectivoId = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
              }) => EventColectivosCompanion(
                eventId: eventId,
                colectivoId: colectivoId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String eventId,
                required String colectivoId,
                drift.Value<int> rowid = const drift.Value.absent(),
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
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends drift.TableManagerState<
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
    drift.ProcessedTableManager<
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
      drift.PrefetchHooks Function({bool eventId, bool colectivoId})
    >;
typedef $$EncargadosTableCreateCompanionBuilder =
    EncargadosCompanion Function({
      required String id,
      required String name,
      drift.Value<String?> phone,
      drift.Value<double> balance,
      drift.Value<bool> isSynced,
      drift.Value<int> rowid,
    });
typedef $$EncargadosTableUpdateCompanionBuilder =
    EncargadosCompanion Function({
      drift.Value<String> id,
      drift.Value<String> name,
      drift.Value<String?> phone,
      drift.Value<double> balance,
      drift.Value<bool> isSynced,
      drift.Value<int> rowid,
    });

final class $$EncargadosTableReferences
    extends drift.BaseReferences<_$AppDatabase, $EncargadosTable, Encargado> {
  $$EncargadosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static drift.MultiTypedResultKey<
    $RecorridoSubscriptionsTable,
    List<RecorridoSubscription>
  >
  _recorridoSubscriptionsRefsTable(_$AppDatabase db) =>
      drift.MultiTypedResultKey.fromTable(
        db.recorridoSubscriptions,
        aliasName: drift.$_aliasNameGenerator(
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
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EncargadosTableFilterComposer
    extends drift.Composer<_$AppDatabase, $EncargadosTable> {
  $$EncargadosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<double> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.Expression<bool> recorridoSubscriptionsRefs(
    drift.Expression<bool> Function(
      $$RecorridoSubscriptionsTableFilterComposer f,
    )
    f,
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
    extends drift.Composer<_$AppDatabase, $EncargadosTable> {
  $$EncargadosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<double> get balance => $composableBuilder(
    column: $table.balance,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => drift.ColumnOrderings(column),
  );
}

class $$EncargadosTableAnnotationComposer
    extends drift.Composer<_$AppDatabase, $EncargadosTable> {
  $$EncargadosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  drift.GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  drift.GeneratedColumn<double> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  drift.GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  drift.Expression<T> recorridoSubscriptionsRefs<T extends Object>(
    drift.Expression<T> Function(
      $$RecorridoSubscriptionsTableAnnotationComposer a,
    )
    f,
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
        drift.RootTableManager<
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
          drift.PrefetchHooks Function({bool recorridoSubscriptionsRefs})
        > {
  $$EncargadosTableTableManager(_$AppDatabase db, $EncargadosTable table)
    : super(
        drift.TableManagerState(
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
                drift.Value<String> id = const drift.Value.absent(),
                drift.Value<String> name = const drift.Value.absent(),
                drift.Value<String?> phone = const drift.Value.absent(),
                drift.Value<double> balance = const drift.Value.absent(),
                drift.Value<bool> isSynced = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
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
                drift.Value<String?> phone = const drift.Value.absent(),
                drift.Value<double> balance = const drift.Value.absent(),
                drift.Value<bool> isSynced = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
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
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recorridoSubscriptionsRefs) db.recorridoSubscriptions,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recorridoSubscriptionsRefs)
                    await drift.$_getPrefetchedData<
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
    drift.ProcessedTableManager<
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
      drift.PrefetchHooks Function({bool recorridoSubscriptionsRefs})
    >;
typedef $$RecorridoSubscriptionsTableCreateCompanionBuilder =
    RecorridoSubscriptionsCompanion Function({
      required String id,
      required String recorridoId,
      required String encargadoId,
      required String subscriptionName,
      drift.Value<String?> address,
      drift.Value<int?> customPrice,
      drift.Value<bool> isActive,
      drift.Value<int> rowid,
    });
typedef $$RecorridoSubscriptionsTableUpdateCompanionBuilder =
    RecorridoSubscriptionsCompanion Function({
      drift.Value<String> id,
      drift.Value<String> recorridoId,
      drift.Value<String> encargadoId,
      drift.Value<String> subscriptionName,
      drift.Value<String?> address,
      drift.Value<int?> customPrice,
      drift.Value<bool> isActive,
      drift.Value<int> rowid,
    });

final class $$RecorridoSubscriptionsTableReferences
    extends
        drift.BaseReferences<
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
        drift.$_aliasNameGenerator(
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
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EncargadosTable _encargadoIdTable(_$AppDatabase db) =>
      db.encargados.createAlias(
        drift.$_aliasNameGenerator(
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
    return drift.ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecorridoSubscriptionsTableFilterComposer
    extends drift.Composer<_$AppDatabase, $RecorridoSubscriptionsTable> {
  $$RecorridoSubscriptionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get subscriptionName => $composableBuilder(
    column: $table.subscriptionName,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<int> get customPrice => $composableBuilder(
    column: $table.customPrice,
    builder: (column) => drift.ColumnFilters(column),
  );

  drift.ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => drift.ColumnFilters(column),
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
    extends drift.Composer<_$AppDatabase, $RecorridoSubscriptionsTable> {
  $$RecorridoSubscriptionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get subscriptionName => $composableBuilder(
    column: $table.subscriptionName,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<int> get customPrice => $composableBuilder(
    column: $table.customPrice,
    builder: (column) => drift.ColumnOrderings(column),
  );

  drift.ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => drift.ColumnOrderings(column),
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
    extends drift.Composer<_$AppDatabase, $RecorridoSubscriptionsTable> {
  $$RecorridoSubscriptionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  drift.GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  drift.GeneratedColumn<String> get subscriptionName => $composableBuilder(
    column: $table.subscriptionName,
    builder: (column) => column,
  );

  drift.GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  drift.GeneratedColumn<int> get customPrice => $composableBuilder(
    column: $table.customPrice,
    builder: (column) => column,
  );

  drift.GeneratedColumn<bool> get isActive =>
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
        drift.RootTableManager<
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
          drift.PrefetchHooks Function({bool recorridoId, bool encargadoId})
        > {
  $$RecorridoSubscriptionsTableTableManager(
    _$AppDatabase db,
    $RecorridoSubscriptionsTable table,
  ) : super(
        drift.TableManagerState(
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
                drift.Value<String> id = const drift.Value.absent(),
                drift.Value<String> recorridoId = const drift.Value.absent(),
                drift.Value<String> encargadoId = const drift.Value.absent(),
                drift.Value<String> subscriptionName =
                    const drift.Value.absent(),
                drift.Value<String?> address = const drift.Value.absent(),
                drift.Value<int?> customPrice = const drift.Value.absent(),
                drift.Value<bool> isActive = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
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
                drift.Value<String?> address = const drift.Value.absent(),
                drift.Value<int?> customPrice = const drift.Value.absent(),
                drift.Value<bool> isActive = const drift.Value.absent(),
                drift.Value<int> rowid = const drift.Value.absent(),
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
            return drift.PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends drift.TableManagerState<
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
    drift.ProcessedTableManager<
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
      drift.PrefetchHooks Function({bool recorridoId, bool encargadoId})
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
  $$EncargadosTableTableManager get encargados =>
      $$EncargadosTableTableManager(_db, _db.encargados);
  $$RecorridoSubscriptionsTableTableManager get recorridoSubscriptions =>
      $$RecorridoSubscriptionsTableTableManager(
        _db,
        _db.recorridoSubscriptions,
      );
}
