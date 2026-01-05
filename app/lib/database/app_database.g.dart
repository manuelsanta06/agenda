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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dni,
    name,
    surname,
    mobileNumber,
    picturePath,
    is_active,
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
    } else if (isInserting) {
      context.missing(_dniMeta);
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
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      surname: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}surname'],
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
    );
  }

  @override
  $ChoferesTable createAlias(String alias) {
    return $ChoferesTable(attachedDatabase, alias);
  }
}

class Chofere extends DataClass implements Insertable<Chofere> {
  final String id;
  final String dni;
  final String? name;
  final String? surname;
  final String? mobileNumber;
  final String? picturePath;
  final bool is_active;
  const Chofere({
    required this.id,
    required this.dni,
    this.name,
    this.surname,
    this.mobileNumber,
    this.picturePath,
    required this.is_active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['dni'] = Variable<String>(dni);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || surname != null) {
      map['surname'] = Variable<String>(surname);
    }
    if (!nullToAbsent || mobileNumber != null) {
      map['mobile_number'] = Variable<String>(mobileNumber);
    }
    if (!nullToAbsent || picturePath != null) {
      map['picture_path'] = Variable<String>(picturePath);
    }
    map['is_active'] = Variable<bool>(is_active);
    return map;
  }

  ChoferesCompanion toCompanion(bool nullToAbsent) {
    return ChoferesCompanion(
      id: Value(id),
      dni: Value(dni),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      surname: surname == null && nullToAbsent
          ? const Value.absent()
          : Value(surname),
      mobileNumber: mobileNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(mobileNumber),
      picturePath: picturePath == null && nullToAbsent
          ? const Value.absent()
          : Value(picturePath),
      is_active: Value(is_active),
    );
  }

  factory Chofere.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Chofere(
      id: serializer.fromJson<String>(json['id']),
      dni: serializer.fromJson<String>(json['dni']),
      name: serializer.fromJson<String?>(json['name']),
      surname: serializer.fromJson<String?>(json['surname']),
      mobileNumber: serializer.fromJson<String?>(json['mobileNumber']),
      picturePath: serializer.fromJson<String?>(json['picturePath']),
      is_active: serializer.fromJson<bool>(json['is_active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'dni': serializer.toJson<String>(dni),
      'name': serializer.toJson<String?>(name),
      'surname': serializer.toJson<String?>(surname),
      'mobileNumber': serializer.toJson<String?>(mobileNumber),
      'picturePath': serializer.toJson<String?>(picturePath),
      'is_active': serializer.toJson<bool>(is_active),
    };
  }

  Chofere copyWith({
    String? id,
    String? dni,
    Value<String?> name = const Value.absent(),
    Value<String?> surname = const Value.absent(),
    Value<String?> mobileNumber = const Value.absent(),
    Value<String?> picturePath = const Value.absent(),
    bool? is_active,
  }) => Chofere(
    id: id ?? this.id,
    dni: dni ?? this.dni,
    name: name.present ? name.value : this.name,
    surname: surname.present ? surname.value : this.surname,
    mobileNumber: mobileNumber.present ? mobileNumber.value : this.mobileNumber,
    picturePath: picturePath.present ? picturePath.value : this.picturePath,
    is_active: is_active ?? this.is_active,
  );
  Chofere copyWithCompanion(ChoferesCompanion data) {
    return Chofere(
      id: data.id.present ? data.id.value : this.id,
      dni: data.dni.present ? data.dni.value : this.dni,
      name: data.name.present ? data.name.value : this.name,
      surname: data.surname.present ? data.surname.value : this.surname,
      mobileNumber: data.mobileNumber.present
          ? data.mobileNumber.value
          : this.mobileNumber,
      picturePath: data.picturePath.present
          ? data.picturePath.value
          : this.picturePath,
      is_active: data.is_active.present ? data.is_active.value : this.is_active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Chofere(')
          ..write('id: $id, ')
          ..write('dni: $dni, ')
          ..write('name: $name, ')
          ..write('surname: $surname, ')
          ..write('mobileNumber: $mobileNumber, ')
          ..write('picturePath: $picturePath, ')
          ..write('is_active: $is_active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, dni, name, surname, mobileNumber, picturePath, is_active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Chofere &&
          other.id == this.id &&
          other.dni == this.dni &&
          other.name == this.name &&
          other.surname == this.surname &&
          other.mobileNumber == this.mobileNumber &&
          other.picturePath == this.picturePath &&
          other.is_active == this.is_active);
}

class ChoferesCompanion extends UpdateCompanion<Chofere> {
  final Value<String> id;
  final Value<String> dni;
  final Value<String?> name;
  final Value<String?> surname;
  final Value<String?> mobileNumber;
  final Value<String?> picturePath;
  final Value<bool> is_active;
  final Value<int> rowid;
  const ChoferesCompanion({
    this.id = const Value.absent(),
    this.dni = const Value.absent(),
    this.name = const Value.absent(),
    this.surname = const Value.absent(),
    this.mobileNumber = const Value.absent(),
    this.picturePath = const Value.absent(),
    this.is_active = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ChoferesCompanion.insert({
    required String id,
    required String dni,
    this.name = const Value.absent(),
    this.surname = const Value.absent(),
    this.mobileNumber = const Value.absent(),
    this.picturePath = const Value.absent(),
    this.is_active = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       dni = Value(dni);
  static Insertable<Chofere> custom({
    Expression<String>? id,
    Expression<String>? dni,
    Expression<String>? name,
    Expression<String>? surname,
    Expression<String>? mobileNumber,
    Expression<String>? picturePath,
    Expression<bool>? is_active,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dni != null) 'dni': dni,
      if (name != null) 'name': name,
      if (surname != null) 'surname': surname,
      if (mobileNumber != null) 'mobile_number': mobileNumber,
      if (picturePath != null) 'picture_path': picturePath,
      if (is_active != null) 'is_active': is_active,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ChoferesCompanion copyWith({
    Value<String>? id,
    Value<String>? dni,
    Value<String?>? name,
    Value<String?>? surname,
    Value<String?>? mobileNumber,
    Value<String?>? picturePath,
    Value<bool>? is_active,
    Value<int>? rowid,
  }) {
    return ChoferesCompanion(
      id: id ?? this.id,
      dni: dni ?? this.dni,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      picturePath: picturePath ?? this.picturePath,
      is_active: is_active ?? this.is_active,
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
    if (mobileNumber.present) {
      map['mobile_number'] = Variable<String>(mobileNumber.value);
    }
    if (picturePath.present) {
      map['picture_path'] = Variable<String>(picturePath.value);
    }
    if (is_active.present) {
      map['is_active'] = Variable<bool>(is_active.value);
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
          ..write('mobileNumber: $mobileNumber, ')
          ..write('picturePath: $picturePath, ')
          ..write('is_active: $is_active, ')
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    plate,
    name,
    number,
    fuelAmount,
    fuelDate,
    is_active,
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
  const Colectivo({
    required this.id,
    required this.plate,
    this.name,
    this.number,
    this.fuelAmount,
    this.fuelDate,
    required this.is_active,
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
  }) => Colectivo(
    id: id ?? this.id,
    plate: plate ?? this.plate,
    name: name.present ? name.value : this.name,
    number: number.present ? number.value : this.number,
    fuelAmount: fuelAmount.present ? fuelAmount.value : this.fuelAmount,
    fuelDate: fuelDate.present ? fuelDate.value : this.fuelDate,
    is_active: is_active ?? this.is_active,
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
          ..write('is_active: $is_active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, plate, name, number, fuelAmount, fuelDate, is_active);
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
          other.is_active == this.is_active);
}

class ColectivosCompanion extends UpdateCompanion<Colectivo> {
  final Value<String> id;
  final Value<String> plate;
  final Value<String?> name;
  final Value<int?> number;
  final Value<String?> fuelAmount;
  final Value<DateTime?> fuelDate;
  final Value<bool> is_active;
  final Value<int> rowid;
  const ColectivosCompanion({
    this.id = const Value.absent(),
    this.plate = const Value.absent(),
    this.name = const Value.absent(),
    this.number = const Value.absent(),
    this.fuelAmount = const Value.absent(),
    this.fuelDate = const Value.absent(),
    this.is_active = const Value.absent(),
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
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventosTable extends Eventos with TableInfo<$EventosTable, Evento> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventosTable(this.attachedDatabase, [this._alias]);
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
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
  static const VerificationMeta _endMeta = const VerificationMeta('end');
  @override
  late final GeneratedColumn<DateTime> end = GeneratedColumn<DateTime>(
    'end',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
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
  static const VerificationMeta _daysMeta = const VerificationMeta('days');
  @override
  late final GeneratedColumn<String> days = GeneratedColumn<String>(
    'days',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    start,
    end,
    repeat,
    days,
    isSynced,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'eventos';
  @override
  VerificationContext validateIntegrity(
    Insertable<Evento> instance, {
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
    }
    if (data.containsKey('start')) {
      context.handle(
        _startMeta,
        start.isAcceptableOrUnknown(data['start']!, _startMeta),
      );
    }
    if (data.containsKey('end')) {
      context.handle(
        _endMeta,
        end.isAcceptableOrUnknown(data['end']!, _endMeta),
      );
    }
    if (data.containsKey('repeat')) {
      context.handle(
        _repeatMeta,
        repeat.isAcceptableOrUnknown(data['repeat']!, _repeatMeta),
      );
    }
    if (data.containsKey('days')) {
      context.handle(
        _daysMeta,
        days.isAcceptableOrUnknown(data['days']!, _daysMeta),
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
  Evento map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Evento(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      start: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start'],
      ),
      end: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end'],
      ),
      repeat: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}repeat'],
      )!,
      days: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}days'],
      ),
      isSynced: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_synced'],
      )!,
    );
  }

  @override
  $EventosTable createAlias(String alias) {
    return $EventosTable(attachedDatabase, alias);
  }
}

class Evento extends DataClass implements Insertable<Evento> {
  final String id;
  final String? name;
  final DateTime? start;
  final DateTime? end;
  final bool repeat;
  final String? days;
  final bool isSynced;
  const Evento({
    required this.id,
    this.name,
    this.start,
    this.end,
    required this.repeat,
    this.days,
    required this.isSynced,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || start != null) {
      map['start'] = Variable<DateTime>(start);
    }
    if (!nullToAbsent || end != null) {
      map['end'] = Variable<DateTime>(end);
    }
    map['repeat'] = Variable<bool>(repeat);
    if (!nullToAbsent || days != null) {
      map['days'] = Variable<String>(days);
    }
    map['is_synced'] = Variable<bool>(isSynced);
    return map;
  }

  EventosCompanion toCompanion(bool nullToAbsent) {
    return EventosCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      start: start == null && nullToAbsent
          ? const Value.absent()
          : Value(start),
      end: end == null && nullToAbsent ? const Value.absent() : Value(end),
      repeat: Value(repeat),
      days: days == null && nullToAbsent ? const Value.absent() : Value(days),
      isSynced: Value(isSynced),
    );
  }

  factory Evento.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Evento(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      start: serializer.fromJson<DateTime?>(json['start']),
      end: serializer.fromJson<DateTime?>(json['end']),
      repeat: serializer.fromJson<bool>(json['repeat']),
      days: serializer.fromJson<String?>(json['days']),
      isSynced: serializer.fromJson<bool>(json['isSynced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String?>(name),
      'start': serializer.toJson<DateTime?>(start),
      'end': serializer.toJson<DateTime?>(end),
      'repeat': serializer.toJson<bool>(repeat),
      'days': serializer.toJson<String?>(days),
      'isSynced': serializer.toJson<bool>(isSynced),
    };
  }

  Evento copyWith({
    String? id,
    Value<String?> name = const Value.absent(),
    Value<DateTime?> start = const Value.absent(),
    Value<DateTime?> end = const Value.absent(),
    bool? repeat,
    Value<String?> days = const Value.absent(),
    bool? isSynced,
  }) => Evento(
    id: id ?? this.id,
    name: name.present ? name.value : this.name,
    start: start.present ? start.value : this.start,
    end: end.present ? end.value : this.end,
    repeat: repeat ?? this.repeat,
    days: days.present ? days.value : this.days,
    isSynced: isSynced ?? this.isSynced,
  );
  Evento copyWithCompanion(EventosCompanion data) {
    return Evento(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      start: data.start.present ? data.start.value : this.start,
      end: data.end.present ? data.end.value : this.end,
      repeat: data.repeat.present ? data.repeat.value : this.repeat,
      days: data.days.present ? data.days.value : this.days,
      isSynced: data.isSynced.present ? data.isSynced.value : this.isSynced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Evento(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('repeat: $repeat, ')
          ..write('days: $days, ')
          ..write('isSynced: $isSynced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, start, end, repeat, days, isSynced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Evento &&
          other.id == this.id &&
          other.name == this.name &&
          other.start == this.start &&
          other.end == this.end &&
          other.repeat == this.repeat &&
          other.days == this.days &&
          other.isSynced == this.isSynced);
}

class EventosCompanion extends UpdateCompanion<Evento> {
  final Value<String> id;
  final Value<String?> name;
  final Value<DateTime?> start;
  final Value<DateTime?> end;
  final Value<bool> repeat;
  final Value<String?> days;
  final Value<bool> isSynced;
  final Value<int> rowid;
  const EventosCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
    this.repeat = const Value.absent(),
    this.days = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventosCompanion.insert({
    required String id,
    this.name = const Value.absent(),
    this.start = const Value.absent(),
    this.end = const Value.absent(),
    this.repeat = const Value.absent(),
    this.days = const Value.absent(),
    this.isSynced = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<Evento> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<DateTime>? start,
    Expression<DateTime>? end,
    Expression<bool>? repeat,
    Expression<String>? days,
    Expression<bool>? isSynced,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (start != null) 'start': start,
      if (end != null) 'end': end,
      if (repeat != null) 'repeat': repeat,
      if (days != null) 'days': days,
      if (isSynced != null) 'is_synced': isSynced,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventosCompanion copyWith({
    Value<String>? id,
    Value<String?>? name,
    Value<DateTime?>? start,
    Value<DateTime?>? end,
    Value<bool>? repeat,
    Value<String?>? days,
    Value<bool>? isSynced,
    Value<int>? rowid,
  }) {
    return EventosCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      start: start ?? this.start,
      end: end ?? this.end,
      repeat: repeat ?? this.repeat,
      days: days ?? this.days,
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
    if (start.present) {
      map['start'] = Variable<DateTime>(start.value);
    }
    if (end.present) {
      map['end'] = Variable<DateTime>(end.value);
    }
    if (repeat.present) {
      map['repeat'] = Variable<bool>(repeat.value);
    }
    if (days.present) {
      map['days'] = Variable<String>(days.value);
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
    return (StringBuffer('EventosCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('start: $start, ')
          ..write('end: $end, ')
          ..write('repeat: $repeat, ')
          ..write('days: $days, ')
          ..write('isSynced: $isSynced, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ParadasTable extends Paradas with TableInfo<$ParadasTable, Parada> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParadasTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES eventos (id)',
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
  List<GeneratedColumn> get $columns => [id, name, eventId, orderIndex];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'paradas';
  @override
  VerificationContext validateIntegrity(
    Insertable<Parada> instance, {
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
  Parada map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Parada(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
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
  $ParadasTable createAlias(String alias) {
    return $ParadasTable(attachedDatabase, alias);
  }
}

class Parada extends DataClass implements Insertable<Parada> {
  final String id;
  final String name;
  final String eventId;
  final int orderIndex;
  const Parada({
    required this.id,
    required this.name,
    required this.eventId,
    required this.orderIndex,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['event_id'] = Variable<String>(eventId);
    map['order_index'] = Variable<int>(orderIndex);
    return map;
  }

  ParadasCompanion toCompanion(bool nullToAbsent) {
    return ParadasCompanion(
      id: Value(id),
      name: Value(name),
      eventId: Value(eventId),
      orderIndex: Value(orderIndex),
    );
  }

  factory Parada.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Parada(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
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
      'eventId': serializer.toJson<String>(eventId),
      'orderIndex': serializer.toJson<int>(orderIndex),
    };
  }

  Parada copyWith({
    String? id,
    String? name,
    String? eventId,
    int? orderIndex,
  }) => Parada(
    id: id ?? this.id,
    name: name ?? this.name,
    eventId: eventId ?? this.eventId,
    orderIndex: orderIndex ?? this.orderIndex,
  );
  Parada copyWithCompanion(ParadasCompanion data) {
    return Parada(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Parada(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('eventId: $eventId, ')
          ..write('orderIndex: $orderIndex')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, eventId, orderIndex);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Parada &&
          other.id == this.id &&
          other.name == this.name &&
          other.eventId == this.eventId &&
          other.orderIndex == this.orderIndex);
}

class ParadasCompanion extends UpdateCompanion<Parada> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> eventId;
  final Value<int> orderIndex;
  final Value<int> rowid;
  const ParadasCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.eventId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ParadasCompanion.insert({
    required String id,
    required String name,
    required String eventId,
    required int orderIndex,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       eventId = Value(eventId),
       orderIndex = Value(orderIndex);
  static Insertable<Parada> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? eventId,
    Expression<int>? orderIndex,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (eventId != null) 'event_id': eventId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ParadasCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? eventId,
    Value<int>? orderIndex,
    Value<int>? rowid,
  }) {
    return ParadasCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return (StringBuffer('ParadasCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('eventId: $eventId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventoChoferesTable extends EventoChoferes
    with TableInfo<$EventoChoferesTable, EventoChofere> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventoChoferesTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES eventos (id)',
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
      'REFERENCES choferes (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [eventId, choferId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'evento_choferes';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventoChofere> instance, {
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
  EventoChofere map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventoChofere(
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
  $EventoChoferesTable createAlias(String alias) {
    return $EventoChoferesTable(attachedDatabase, alias);
  }
}

class EventoChofere extends DataClass implements Insertable<EventoChofere> {
  final String eventId;
  final String choferId;
  const EventoChofere({required this.eventId, required this.choferId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['event_id'] = Variable<String>(eventId);
    map['chofer_id'] = Variable<String>(choferId);
    return map;
  }

  EventoChoferesCompanion toCompanion(bool nullToAbsent) {
    return EventoChoferesCompanion(
      eventId: Value(eventId),
      choferId: Value(choferId),
    );
  }

  factory EventoChofere.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventoChofere(
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

  EventoChofere copyWith({String? eventId, String? choferId}) => EventoChofere(
    eventId: eventId ?? this.eventId,
    choferId: choferId ?? this.choferId,
  );
  EventoChofere copyWithCompanion(EventoChoferesCompanion data) {
    return EventoChofere(
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      choferId: data.choferId.present ? data.choferId.value : this.choferId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventoChofere(')
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
      (other is EventoChofere &&
          other.eventId == this.eventId &&
          other.choferId == this.choferId);
}

class EventoChoferesCompanion extends UpdateCompanion<EventoChofere> {
  final Value<String> eventId;
  final Value<String> choferId;
  final Value<int> rowid;
  const EventoChoferesCompanion({
    this.eventId = const Value.absent(),
    this.choferId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventoChoferesCompanion.insert({
    required String eventId,
    required String choferId,
    this.rowid = const Value.absent(),
  }) : eventId = Value(eventId),
       choferId = Value(choferId);
  static Insertable<EventoChofere> custom({
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

  EventoChoferesCompanion copyWith({
    Value<String>? eventId,
    Value<String>? choferId,
    Value<int>? rowid,
  }) {
    return EventoChoferesCompanion(
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
    return (StringBuffer('EventoChoferesCompanion(')
          ..write('eventId: $eventId, ')
          ..write('choferId: $choferId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventoColectivosTable extends EventoColectivos
    with TableInfo<$EventoColectivosTable, EventoColectivo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventoColectivosTable(this.attachedDatabase, [this._alias]);
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
      'REFERENCES eventos (id)',
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
      'REFERENCES colectivos (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [eventId, colectivoId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'evento_colectivos';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventoColectivo> instance, {
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
  EventoColectivo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventoColectivo(
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
  $EventoColectivosTable createAlias(String alias) {
    return $EventoColectivosTable(attachedDatabase, alias);
  }
}

class EventoColectivo extends DataClass implements Insertable<EventoColectivo> {
  final String eventId;
  final String colectivoId;
  const EventoColectivo({required this.eventId, required this.colectivoId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['event_id'] = Variable<String>(eventId);
    map['colectivo_id'] = Variable<String>(colectivoId);
    return map;
  }

  EventoColectivosCompanion toCompanion(bool nullToAbsent) {
    return EventoColectivosCompanion(
      eventId: Value(eventId),
      colectivoId: Value(colectivoId),
    );
  }

  factory EventoColectivo.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventoColectivo(
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

  EventoColectivo copyWith({String? eventId, String? colectivoId}) =>
      EventoColectivo(
        eventId: eventId ?? this.eventId,
        colectivoId: colectivoId ?? this.colectivoId,
      );
  EventoColectivo copyWithCompanion(EventoColectivosCompanion data) {
    return EventoColectivo(
      eventId: data.eventId.present ? data.eventId.value : this.eventId,
      colectivoId: data.colectivoId.present
          ? data.colectivoId.value
          : this.colectivoId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventoColectivo(')
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
      (other is EventoColectivo &&
          other.eventId == this.eventId &&
          other.colectivoId == this.colectivoId);
}

class EventoColectivosCompanion extends UpdateCompanion<EventoColectivo> {
  final Value<String> eventId;
  final Value<String> colectivoId;
  final Value<int> rowid;
  const EventoColectivosCompanion({
    this.eventId = const Value.absent(),
    this.colectivoId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventoColectivosCompanion.insert({
    required String eventId,
    required String colectivoId,
    this.rowid = const Value.absent(),
  }) : eventId = Value(eventId),
       colectivoId = Value(colectivoId);
  static Insertable<EventoColectivo> custom({
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

  EventoColectivosCompanion copyWith({
    Value<String>? eventId,
    Value<String>? colectivoId,
    Value<int>? rowid,
  }) {
    return EventoColectivosCompanion(
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
    return (StringBuffer('EventoColectivosCompanion(')
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
  late final $EventosTable eventos = $EventosTable(this);
  late final $ParadasTable paradas = $ParadasTable(this);
  late final $EventoChoferesTable eventoChoferes = $EventoChoferesTable(this);
  late final $EventoColectivosTable eventoColectivos = $EventoColectivosTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    choferes,
    colectivos,
    eventos,
    paradas,
    eventoChoferes,
    eventoColectivos,
  ];
}

typedef $$ChoferesTableCreateCompanionBuilder =
    ChoferesCompanion Function({
      required String id,
      required String dni,
      Value<String?> name,
      Value<String?> surname,
      Value<String?> mobileNumber,
      Value<String?> picturePath,
      Value<bool> is_active,
      Value<int> rowid,
    });
typedef $$ChoferesTableUpdateCompanionBuilder =
    ChoferesCompanion Function({
      Value<String> id,
      Value<String> dni,
      Value<String?> name,
      Value<String?> surname,
      Value<String?> mobileNumber,
      Value<String?> picturePath,
      Value<bool> is_active,
      Value<int> rowid,
    });

final class $$ChoferesTableReferences
    extends BaseReferences<_$AppDatabase, $ChoferesTable, Chofere> {
  $$ChoferesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventoChoferesTable, List<EventoChofere>>
  _eventoChoferesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventoChoferes,
    aliasName: $_aliasNameGenerator(db.choferes.id, db.eventoChoferes.choferId),
  );

  $$EventoChoferesTableProcessedTableManager get eventoChoferesRefs {
    final manager = $$EventoChoferesTableTableManager(
      $_db,
      $_db.eventoChoferes,
    ).filter((f) => f.choferId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventoChoferesRefsTable($_db));
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

  Expression<bool> eventoChoferesRefs(
    Expression<bool> Function($$EventoChoferesTableFilterComposer f) f,
  ) {
    final $$EventoChoferesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventoChoferes,
      getReferencedColumn: (t) => t.choferId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventoChoferesTableFilterComposer(
            $db: $db,
            $table: $db.eventoChoferes,
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

  Expression<T> eventoChoferesRefs<T extends Object>(
    Expression<T> Function($$EventoChoferesTableAnnotationComposer a) f,
  ) {
    final $$EventoChoferesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventoChoferes,
      getReferencedColumn: (t) => t.choferId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventoChoferesTableAnnotationComposer(
            $db: $db,
            $table: $db.eventoChoferes,
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
          PrefetchHooks Function({bool eventoChoferesRefs})
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
                Value<String> dni = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> surname = const Value.absent(),
                Value<String?> mobileNumber = const Value.absent(),
                Value<String?> picturePath = const Value.absent(),
                Value<bool> is_active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChoferesCompanion(
                id: id,
                dni: dni,
                name: name,
                surname: surname,
                mobileNumber: mobileNumber,
                picturePath: picturePath,
                is_active: is_active,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String dni,
                Value<String?> name = const Value.absent(),
                Value<String?> surname = const Value.absent(),
                Value<String?> mobileNumber = const Value.absent(),
                Value<String?> picturePath = const Value.absent(),
                Value<bool> is_active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ChoferesCompanion.insert(
                id: id,
                dni: dni,
                name: name,
                surname: surname,
                mobileNumber: mobileNumber,
                picturePath: picturePath,
                is_active: is_active,
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
          prefetchHooksCallback: ({eventoChoferesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (eventoChoferesRefs) db.eventoChoferes,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventoChoferesRefs)
                    await $_getPrefetchedData<
                      Chofere,
                      $ChoferesTable,
                      EventoChofere
                    >(
                      currentTable: table,
                      referencedTable: $$ChoferesTableReferences
                          ._eventoChoferesRefsTable(db),
                      managerFromTypedResult: (p0) => $$ChoferesTableReferences(
                        db,
                        table,
                        p0,
                      ).eventoChoferesRefs,
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
      PrefetchHooks Function({bool eventoChoferesRefs})
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
      Value<int> rowid,
    });

final class $$ColectivosTableReferences
    extends BaseReferences<_$AppDatabase, $ColectivosTable, Colectivo> {
  $$ColectivosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventoColectivosTable, List<EventoColectivo>>
  _eventoColectivosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventoColectivos,
    aliasName: $_aliasNameGenerator(
      db.colectivos.id,
      db.eventoColectivos.colectivoId,
    ),
  );

  $$EventoColectivosTableProcessedTableManager get eventoColectivosRefs {
    final manager = $$EventoColectivosTableTableManager(
      $_db,
      $_db.eventoColectivos,
    ).filter((f) => f.colectivoId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _eventoColectivosRefsTable($_db),
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

  Expression<bool> eventoColectivosRefs(
    Expression<bool> Function($$EventoColectivosTableFilterComposer f) f,
  ) {
    final $$EventoColectivosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventoColectivos,
      getReferencedColumn: (t) => t.colectivoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventoColectivosTableFilterComposer(
            $db: $db,
            $table: $db.eventoColectivos,
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

  Expression<T> eventoColectivosRefs<T extends Object>(
    Expression<T> Function($$EventoColectivosTableAnnotationComposer a) f,
  ) {
    final $$EventoColectivosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventoColectivos,
      getReferencedColumn: (t) => t.colectivoId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventoColectivosTableAnnotationComposer(
            $db: $db,
            $table: $db.eventoColectivos,
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
          PrefetchHooks Function({bool eventoColectivosRefs})
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
                Value<int> rowid = const Value.absent(),
              }) => ColectivosCompanion(
                id: id,
                plate: plate,
                name: name,
                number: number,
                fuelAmount: fuelAmount,
                fuelDate: fuelDate,
                is_active: is_active,
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
                Value<int> rowid = const Value.absent(),
              }) => ColectivosCompanion.insert(
                id: id,
                plate: plate,
                name: name,
                number: number,
                fuelAmount: fuelAmount,
                fuelDate: fuelDate,
                is_active: is_active,
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
          prefetchHooksCallback: ({eventoColectivosRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (eventoColectivosRefs) db.eventoColectivos,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventoColectivosRefs)
                    await $_getPrefetchedData<
                      Colectivo,
                      $ColectivosTable,
                      EventoColectivo
                    >(
                      currentTable: table,
                      referencedTable: $$ColectivosTableReferences
                          ._eventoColectivosRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ColectivosTableReferences(
                            db,
                            table,
                            p0,
                          ).eventoColectivosRefs,
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
      PrefetchHooks Function({bool eventoColectivosRefs})
    >;
typedef $$EventosTableCreateCompanionBuilder =
    EventosCompanion Function({
      required String id,
      Value<String?> name,
      Value<DateTime?> start,
      Value<DateTime?> end,
      Value<bool> repeat,
      Value<String?> days,
      Value<bool> isSynced,
      Value<int> rowid,
    });
typedef $$EventosTableUpdateCompanionBuilder =
    EventosCompanion Function({
      Value<String> id,
      Value<String?> name,
      Value<DateTime?> start,
      Value<DateTime?> end,
      Value<bool> repeat,
      Value<String?> days,
      Value<bool> isSynced,
      Value<int> rowid,
    });

final class $$EventosTableReferences
    extends BaseReferences<_$AppDatabase, $EventosTable, Evento> {
  $$EventosTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ParadasTable, List<Parada>> _paradasRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.paradas,
    aliasName: $_aliasNameGenerator(db.eventos.id, db.paradas.eventId),
  );

  $$ParadasTableProcessedTableManager get paradasRefs {
    final manager = $$ParadasTableTableManager(
      $_db,
      $_db.paradas,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_paradasRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EventoChoferesTable, List<EventoChofere>>
  _eventoChoferesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventoChoferes,
    aliasName: $_aliasNameGenerator(db.eventos.id, db.eventoChoferes.eventId),
  );

  $$EventoChoferesTableProcessedTableManager get eventoChoferesRefs {
    final manager = $$EventoChoferesTableTableManager(
      $_db,
      $_db.eventoChoferes,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventoChoferesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EventoColectivosTable, List<EventoColectivo>>
  _eventoColectivosRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventoColectivos,
    aliasName: $_aliasNameGenerator(db.eventos.id, db.eventoColectivos.eventId),
  );

  $$EventoColectivosTableProcessedTableManager get eventoColectivosRefs {
    final manager = $$EventoColectivosTableTableManager(
      $_db,
      $_db.eventoColectivos,
    ).filter((f) => f.eventId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _eventoColectivosRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EventosTableFilterComposer
    extends Composer<_$AppDatabase, $EventosTable> {
  $$EventosTableFilterComposer({
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

  ColumnFilters<DateTime> get end => $composableBuilder(
    column: $table.end,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get repeat => $composableBuilder(
    column: $table.repeat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get days => $composableBuilder(
    column: $table.days,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> paradasRefs(
    Expression<bool> Function($$ParadasTableFilterComposer f) f,
  ) {
    final $$ParadasTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.paradas,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParadasTableFilterComposer(
            $db: $db,
            $table: $db.paradas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> eventoChoferesRefs(
    Expression<bool> Function($$EventoChoferesTableFilterComposer f) f,
  ) {
    final $$EventoChoferesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventoChoferes,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventoChoferesTableFilterComposer(
            $db: $db,
            $table: $db.eventoChoferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> eventoColectivosRefs(
    Expression<bool> Function($$EventoColectivosTableFilterComposer f) f,
  ) {
    final $$EventoColectivosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventoColectivos,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventoColectivosTableFilterComposer(
            $db: $db,
            $table: $db.eventoColectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventosTableOrderingComposer
    extends Composer<_$AppDatabase, $EventosTable> {
  $$EventosTableOrderingComposer({
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

  ColumnOrderings<DateTime> get end => $composableBuilder(
    column: $table.end,
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

  ColumnOrderings<bool> get isSynced => $composableBuilder(
    column: $table.isSynced,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EventosTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventosTable> {
  $$EventosTableAnnotationComposer({
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

  GeneratedColumn<DateTime> get end =>
      $composableBuilder(column: $table.end, builder: (column) => column);

  GeneratedColumn<bool> get repeat =>
      $composableBuilder(column: $table.repeat, builder: (column) => column);

  GeneratedColumn<String> get days =>
      $composableBuilder(column: $table.days, builder: (column) => column);

  GeneratedColumn<bool> get isSynced =>
      $composableBuilder(column: $table.isSynced, builder: (column) => column);

  Expression<T> paradasRefs<T extends Object>(
    Expression<T> Function($$ParadasTableAnnotationComposer a) f,
  ) {
    final $$ParadasTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.paradas,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParadasTableAnnotationComposer(
            $db: $db,
            $table: $db.paradas,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> eventoChoferesRefs<T extends Object>(
    Expression<T> Function($$EventoChoferesTableAnnotationComposer a) f,
  ) {
    final $$EventoChoferesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventoChoferes,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventoChoferesTableAnnotationComposer(
            $db: $db,
            $table: $db.eventoChoferes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> eventoColectivosRefs<T extends Object>(
    Expression<T> Function($$EventoColectivosTableAnnotationComposer a) f,
  ) {
    final $$EventoColectivosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventoColectivos,
      getReferencedColumn: (t) => t.eventId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventoColectivosTableAnnotationComposer(
            $db: $db,
            $table: $db.eventoColectivos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventosTable,
          Evento,
          $$EventosTableFilterComposer,
          $$EventosTableOrderingComposer,
          $$EventosTableAnnotationComposer,
          $$EventosTableCreateCompanionBuilder,
          $$EventosTableUpdateCompanionBuilder,
          (Evento, $$EventosTableReferences),
          Evento,
          PrefetchHooks Function({
            bool paradasRefs,
            bool eventoChoferesRefs,
            bool eventoColectivosRefs,
          })
        > {
  $$EventosTableTableManager(_$AppDatabase db, $EventosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<DateTime?> start = const Value.absent(),
                Value<DateTime?> end = const Value.absent(),
                Value<bool> repeat = const Value.absent(),
                Value<String?> days = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventosCompanion(
                id: id,
                name: name,
                start: start,
                end: end,
                repeat: repeat,
                days: days,
                isSynced: isSynced,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String?> name = const Value.absent(),
                Value<DateTime?> start = const Value.absent(),
                Value<DateTime?> end = const Value.absent(),
                Value<bool> repeat = const Value.absent(),
                Value<String?> days = const Value.absent(),
                Value<bool> isSynced = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventosCompanion.insert(
                id: id,
                name: name,
                start: start,
                end: end,
                repeat: repeat,
                days: days,
                isSynced: isSynced,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EventosTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                paradasRefs = false,
                eventoChoferesRefs = false,
                eventoColectivosRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (paradasRefs) db.paradas,
                    if (eventoChoferesRefs) db.eventoChoferes,
                    if (eventoColectivosRefs) db.eventoColectivos,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (paradasRefs)
                        await $_getPrefetchedData<
                          Evento,
                          $EventosTable,
                          Parada
                        >(
                          currentTable: table,
                          referencedTable: $$EventosTableReferences
                              ._paradasRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EventosTableReferences(
                                db,
                                table,
                                p0,
                              ).paradasRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.eventId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (eventoChoferesRefs)
                        await $_getPrefetchedData<
                          Evento,
                          $EventosTable,
                          EventoChofere
                        >(
                          currentTable: table,
                          referencedTable: $$EventosTableReferences
                              ._eventoChoferesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EventosTableReferences(
                                db,
                                table,
                                p0,
                              ).eventoChoferesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.eventId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (eventoColectivosRefs)
                        await $_getPrefetchedData<
                          Evento,
                          $EventosTable,
                          EventoColectivo
                        >(
                          currentTable: table,
                          referencedTable: $$EventosTableReferences
                              ._eventoColectivosRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EventosTableReferences(
                                db,
                                table,
                                p0,
                              ).eventoColectivosRefs,
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

typedef $$EventosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventosTable,
      Evento,
      $$EventosTableFilterComposer,
      $$EventosTableOrderingComposer,
      $$EventosTableAnnotationComposer,
      $$EventosTableCreateCompanionBuilder,
      $$EventosTableUpdateCompanionBuilder,
      (Evento, $$EventosTableReferences),
      Evento,
      PrefetchHooks Function({
        bool paradasRefs,
        bool eventoChoferesRefs,
        bool eventoColectivosRefs,
      })
    >;
typedef $$ParadasTableCreateCompanionBuilder =
    ParadasCompanion Function({
      required String id,
      required String name,
      required String eventId,
      required int orderIndex,
      Value<int> rowid,
    });
typedef $$ParadasTableUpdateCompanionBuilder =
    ParadasCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> eventId,
      Value<int> orderIndex,
      Value<int> rowid,
    });

final class $$ParadasTableReferences
    extends BaseReferences<_$AppDatabase, $ParadasTable, Parada> {
  $$ParadasTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EventosTable _eventIdTable(_$AppDatabase db) => db.eventos
      .createAlias($_aliasNameGenerator(db.paradas.eventId, db.eventos.id));

  $$EventosTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventosTableTableManager(
      $_db,
      $_db.eventos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ParadasTableFilterComposer
    extends Composer<_$AppDatabase, $ParadasTable> {
  $$ParadasTableFilterComposer({
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

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  $$EventosTableFilterComposer get eventId {
    final $$EventosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventosTableFilterComposer(
            $db: $db,
            $table: $db.eventos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ParadasTableOrderingComposer
    extends Composer<_$AppDatabase, $ParadasTable> {
  $$ParadasTableOrderingComposer({
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

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  $$EventosTableOrderingComposer get eventId {
    final $$EventosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventosTableOrderingComposer(
            $db: $db,
            $table: $db.eventos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ParadasTableAnnotationComposer
    extends Composer<_$AppDatabase, $ParadasTable> {
  $$ParadasTableAnnotationComposer({
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

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  $$EventosTableAnnotationComposer get eventId {
    final $$EventosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventosTableAnnotationComposer(
            $db: $db,
            $table: $db.eventos,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ParadasTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ParadasTable,
          Parada,
          $$ParadasTableFilterComposer,
          $$ParadasTableOrderingComposer,
          $$ParadasTableAnnotationComposer,
          $$ParadasTableCreateCompanionBuilder,
          $$ParadasTableUpdateCompanionBuilder,
          (Parada, $$ParadasTableReferences),
          Parada,
          PrefetchHooks Function({bool eventId})
        > {
  $$ParadasTableTableManager(_$AppDatabase db, $ParadasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ParadasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ParadasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ParadasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> eventId = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ParadasCompanion(
                id: id,
                name: name,
                eventId: eventId,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String eventId,
                required int orderIndex,
                Value<int> rowid = const Value.absent(),
              }) => ParadasCompanion.insert(
                id: id,
                name: name,
                eventId: eventId,
                orderIndex: orderIndex,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ParadasTableReferences(db, table, e),
                ),
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
                                referencedTable: $$ParadasTableReferences
                                    ._eventIdTable(db),
                                referencedColumn: $$ParadasTableReferences
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

typedef $$ParadasTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ParadasTable,
      Parada,
      $$ParadasTableFilterComposer,
      $$ParadasTableOrderingComposer,
      $$ParadasTableAnnotationComposer,
      $$ParadasTableCreateCompanionBuilder,
      $$ParadasTableUpdateCompanionBuilder,
      (Parada, $$ParadasTableReferences),
      Parada,
      PrefetchHooks Function({bool eventId})
    >;
typedef $$EventoChoferesTableCreateCompanionBuilder =
    EventoChoferesCompanion Function({
      required String eventId,
      required String choferId,
      Value<int> rowid,
    });
typedef $$EventoChoferesTableUpdateCompanionBuilder =
    EventoChoferesCompanion Function({
      Value<String> eventId,
      Value<String> choferId,
      Value<int> rowid,
    });

final class $$EventoChoferesTableReferences
    extends BaseReferences<_$AppDatabase, $EventoChoferesTable, EventoChofere> {
  $$EventoChoferesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EventosTable _eventIdTable(_$AppDatabase db) =>
      db.eventos.createAlias(
        $_aliasNameGenerator(db.eventoChoferes.eventId, db.eventos.id),
      );

  $$EventosTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventosTableTableManager(
      $_db,
      $_db.eventos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ChoferesTable _choferIdTable(_$AppDatabase db) =>
      db.choferes.createAlias(
        $_aliasNameGenerator(db.eventoChoferes.choferId, db.choferes.id),
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

class $$EventoChoferesTableFilterComposer
    extends Composer<_$AppDatabase, $EventoChoferesTable> {
  $$EventoChoferesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventosTableFilterComposer get eventId {
    final $$EventosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventosTableFilterComposer(
            $db: $db,
            $table: $db.eventos,
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

class $$EventoChoferesTableOrderingComposer
    extends Composer<_$AppDatabase, $EventoChoferesTable> {
  $$EventoChoferesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventosTableOrderingComposer get eventId {
    final $$EventosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventosTableOrderingComposer(
            $db: $db,
            $table: $db.eventos,
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

class $$EventoChoferesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventoChoferesTable> {
  $$EventoChoferesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventosTableAnnotationComposer get eventId {
    final $$EventosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventosTableAnnotationComposer(
            $db: $db,
            $table: $db.eventos,
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

class $$EventoChoferesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventoChoferesTable,
          EventoChofere,
          $$EventoChoferesTableFilterComposer,
          $$EventoChoferesTableOrderingComposer,
          $$EventoChoferesTableAnnotationComposer,
          $$EventoChoferesTableCreateCompanionBuilder,
          $$EventoChoferesTableUpdateCompanionBuilder,
          (EventoChofere, $$EventoChoferesTableReferences),
          EventoChofere,
          PrefetchHooks Function({bool eventId, bool choferId})
        > {
  $$EventoChoferesTableTableManager(
    _$AppDatabase db,
    $EventoChoferesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventoChoferesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventoChoferesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventoChoferesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> eventId = const Value.absent(),
                Value<String> choferId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventoChoferesCompanion(
                eventId: eventId,
                choferId: choferId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String eventId,
                required String choferId,
                Value<int> rowid = const Value.absent(),
              }) => EventoChoferesCompanion.insert(
                eventId: eventId,
                choferId: choferId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EventoChoferesTableReferences(db, table, e),
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
                                referencedTable: $$EventoChoferesTableReferences
                                    ._eventIdTable(db),
                                referencedColumn:
                                    $$EventoChoferesTableReferences
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
                                referencedTable: $$EventoChoferesTableReferences
                                    ._choferIdTable(db),
                                referencedColumn:
                                    $$EventoChoferesTableReferences
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

typedef $$EventoChoferesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventoChoferesTable,
      EventoChofere,
      $$EventoChoferesTableFilterComposer,
      $$EventoChoferesTableOrderingComposer,
      $$EventoChoferesTableAnnotationComposer,
      $$EventoChoferesTableCreateCompanionBuilder,
      $$EventoChoferesTableUpdateCompanionBuilder,
      (EventoChofere, $$EventoChoferesTableReferences),
      EventoChofere,
      PrefetchHooks Function({bool eventId, bool choferId})
    >;
typedef $$EventoColectivosTableCreateCompanionBuilder =
    EventoColectivosCompanion Function({
      required String eventId,
      required String colectivoId,
      Value<int> rowid,
    });
typedef $$EventoColectivosTableUpdateCompanionBuilder =
    EventoColectivosCompanion Function({
      Value<String> eventId,
      Value<String> colectivoId,
      Value<int> rowid,
    });

final class $$EventoColectivosTableReferences
    extends
        BaseReferences<_$AppDatabase, $EventoColectivosTable, EventoColectivo> {
  $$EventoColectivosTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EventosTable _eventIdTable(_$AppDatabase db) =>
      db.eventos.createAlias(
        $_aliasNameGenerator(db.eventoColectivos.eventId, db.eventos.id),
      );

  $$EventosTableProcessedTableManager get eventId {
    final $_column = $_itemColumn<String>('event_id')!;

    final manager = $$EventosTableTableManager(
      $_db,
      $_db.eventos,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ColectivosTable _colectivoIdTable(_$AppDatabase db) =>
      db.colectivos.createAlias(
        $_aliasNameGenerator(db.eventoColectivos.colectivoId, db.colectivos.id),
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

class $$EventoColectivosTableFilterComposer
    extends Composer<_$AppDatabase, $EventoColectivosTable> {
  $$EventoColectivosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventosTableFilterComposer get eventId {
    final $$EventosTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventosTableFilterComposer(
            $db: $db,
            $table: $db.eventos,
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

class $$EventoColectivosTableOrderingComposer
    extends Composer<_$AppDatabase, $EventoColectivosTable> {
  $$EventoColectivosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventosTableOrderingComposer get eventId {
    final $$EventosTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventosTableOrderingComposer(
            $db: $db,
            $table: $db.eventos,
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

class $$EventoColectivosTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventoColectivosTable> {
  $$EventoColectivosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventosTableAnnotationComposer get eventId {
    final $$EventosTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventId,
      referencedTable: $db.eventos,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventosTableAnnotationComposer(
            $db: $db,
            $table: $db.eventos,
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

class $$EventoColectivosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventoColectivosTable,
          EventoColectivo,
          $$EventoColectivosTableFilterComposer,
          $$EventoColectivosTableOrderingComposer,
          $$EventoColectivosTableAnnotationComposer,
          $$EventoColectivosTableCreateCompanionBuilder,
          $$EventoColectivosTableUpdateCompanionBuilder,
          (EventoColectivo, $$EventoColectivosTableReferences),
          EventoColectivo,
          PrefetchHooks Function({bool eventId, bool colectivoId})
        > {
  $$EventoColectivosTableTableManager(
    _$AppDatabase db,
    $EventoColectivosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventoColectivosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventoColectivosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventoColectivosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> eventId = const Value.absent(),
                Value<String> colectivoId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventoColectivosCompanion(
                eventId: eventId,
                colectivoId: colectivoId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String eventId,
                required String colectivoId,
                Value<int> rowid = const Value.absent(),
              }) => EventoColectivosCompanion.insert(
                eventId: eventId,
                colectivoId: colectivoId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$EventoColectivosTableReferences(db, table, e),
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
                                    $$EventoColectivosTableReferences
                                        ._eventIdTable(db),
                                referencedColumn:
                                    $$EventoColectivosTableReferences
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
                                    $$EventoColectivosTableReferences
                                        ._colectivoIdTable(db),
                                referencedColumn:
                                    $$EventoColectivosTableReferences
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

typedef $$EventoColectivosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventoColectivosTable,
      EventoColectivo,
      $$EventoColectivosTableFilterComposer,
      $$EventoColectivosTableOrderingComposer,
      $$EventoColectivosTableAnnotationComposer,
      $$EventoColectivosTableCreateCompanionBuilder,
      $$EventoColectivosTableUpdateCompanionBuilder,
      (EventoColectivo, $$EventoColectivosTableReferences),
      EventoColectivo,
      PrefetchHooks Function({bool eventId, bool colectivoId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ChoferesTableTableManager get choferes =>
      $$ChoferesTableTableManager(_db, _db.choferes);
  $$ColectivosTableTableManager get colectivos =>
      $$ColectivosTableTableManager(_db, _db.colectivos);
  $$EventosTableTableManager get eventos =>
      $$EventosTableTableManager(_db, _db.eventos);
  $$ParadasTableTableManager get paradas =>
      $$ParadasTableTableManager(_db, _db.paradas);
  $$EventoChoferesTableTableManager get eventoChoferes =>
      $$EventoChoferesTableTableManager(_db, _db.eventoChoferes);
  $$EventoColectivosTableTableManager get eventoColectivos =>
      $$EventoColectivosTableTableManager(_db, _db.eventoColectivos);
}
