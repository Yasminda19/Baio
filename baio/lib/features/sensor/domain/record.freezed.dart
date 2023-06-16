// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HealthRecord _$HealthRecordFromJson(Map<String, dynamic> json) {
  return _HealthRecord.fromJson(json);
}

/// @nodoc
mixin _$HealthRecord {
  int get id => throw _privateConstructorUsedError;
  int get datetime => throw _privateConstructorUsedError;
  String get health => throw _privateConstructorUsedError;
  int get heartRate => throw _privateConstructorUsedError;
  int get respiratoryRate => throw _privateConstructorUsedError;
  double get temperature => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  bool get awakeStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthRecordCopyWith<HealthRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthRecordCopyWith<$Res> {
  factory $HealthRecordCopyWith(
          HealthRecord value, $Res Function(HealthRecord) then) =
      _$HealthRecordCopyWithImpl<$Res, HealthRecord>;
  @useResult
  $Res call(
      {int id,
      int datetime,
      String health,
      int heartRate,
      int respiratoryRate,
      double temperature,
      String position,
      bool awakeStatus});
}

/// @nodoc
class _$HealthRecordCopyWithImpl<$Res, $Val extends HealthRecord>
    implements $HealthRecordCopyWith<$Res> {
  _$HealthRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? datetime = null,
    Object? health = null,
    Object? heartRate = null,
    Object? respiratoryRate = null,
    Object? temperature = null,
    Object? position = null,
    Object? awakeStatus = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as int,
      health: null == health
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as String,
      heartRate: null == heartRate
          ? _value.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int,
      respiratoryRate: null == respiratoryRate
          ? _value.respiratoryRate
          : respiratoryRate // ignore: cast_nullable_to_non_nullable
              as int,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      awakeStatus: null == awakeStatus
          ? _value.awakeStatus
          : awakeStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HealthRecordCopyWith<$Res>
    implements $HealthRecordCopyWith<$Res> {
  factory _$$_HealthRecordCopyWith(
          _$_HealthRecord value, $Res Function(_$_HealthRecord) then) =
      __$$_HealthRecordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int datetime,
      String health,
      int heartRate,
      int respiratoryRate,
      double temperature,
      String position,
      bool awakeStatus});
}

/// @nodoc
class __$$_HealthRecordCopyWithImpl<$Res>
    extends _$HealthRecordCopyWithImpl<$Res, _$_HealthRecord>
    implements _$$_HealthRecordCopyWith<$Res> {
  __$$_HealthRecordCopyWithImpl(
      _$_HealthRecord _value, $Res Function(_$_HealthRecord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? datetime = null,
    Object? health = null,
    Object? heartRate = null,
    Object? respiratoryRate = null,
    Object? temperature = null,
    Object? position = null,
    Object? awakeStatus = null,
  }) {
    return _then(_$_HealthRecord(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as int,
      health: null == health
          ? _value.health
          : health // ignore: cast_nullable_to_non_nullable
              as String,
      heartRate: null == heartRate
          ? _value.heartRate
          : heartRate // ignore: cast_nullable_to_non_nullable
              as int,
      respiratoryRate: null == respiratoryRate
          ? _value.respiratoryRate
          : respiratoryRate // ignore: cast_nullable_to_non_nullable
              as int,
      temperature: null == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      awakeStatus: null == awakeStatus
          ? _value.awakeStatus
          : awakeStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthRecord implements _HealthRecord {
  const _$_HealthRecord(
      {required this.id,
      required this.datetime,
      required this.health,
      required this.heartRate,
      required this.respiratoryRate,
      required this.temperature,
      required this.position,
      required this.awakeStatus});

  factory _$_HealthRecord.fromJson(Map<String, dynamic> json) =>
      _$$_HealthRecordFromJson(json);

  @override
  final int id;
  @override
  final int datetime;
  @override
  final String health;
  @override
  final int heartRate;
  @override
  final int respiratoryRate;
  @override
  final double temperature;
  @override
  final String position;
  @override
  final bool awakeStatus;

  @override
  String toString() {
    return 'HealthRecord(id: $id, datetime: $datetime, health: $health, heartRate: $heartRate, respiratoryRate: $respiratoryRate, temperature: $temperature, position: $position, awakeStatus: $awakeStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HealthRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.health, health) || other.health == health) &&
            (identical(other.heartRate, heartRate) ||
                other.heartRate == heartRate) &&
            (identical(other.respiratoryRate, respiratoryRate) ||
                other.respiratoryRate == respiratoryRate) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.awakeStatus, awakeStatus) ||
                other.awakeStatus == awakeStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, datetime, health, heartRate,
      respiratoryRate, temperature, position, awakeStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HealthRecordCopyWith<_$_HealthRecord> get copyWith =>
      __$$_HealthRecordCopyWithImpl<_$_HealthRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HealthRecordToJson(
      this,
    );
  }
}

abstract class _HealthRecord implements HealthRecord {
  const factory _HealthRecord(
      {required final int id,
      required final int datetime,
      required final String health,
      required final int heartRate,
      required final int respiratoryRate,
      required final double temperature,
      required final String position,
      required final bool awakeStatus}) = _$_HealthRecord;

  factory _HealthRecord.fromJson(Map<String, dynamic> json) =
      _$_HealthRecord.fromJson;

  @override
  int get id;
  @override
  int get datetime;
  @override
  String get health;
  @override
  int get heartRate;
  @override
  int get respiratoryRate;
  @override
  double get temperature;
  @override
  String get position;
  @override
  bool get awakeStatus;
  @override
  @JsonKey(ignore: true)
  _$$_HealthRecordCopyWith<_$_HealthRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

HealthRecordListResults _$HealthRecordListResultsFromJson(
    Map<String, dynamic> json) {
  return _HealthRecordListResults.fromJson(json);
}

/// @nodoc
mixin _$HealthRecordListResults {
  BaioMeta get meta => throw _privateConstructorUsedError;
  List<HealthRecord> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HealthRecordListResultsCopyWith<HealthRecordListResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthRecordListResultsCopyWith<$Res> {
  factory $HealthRecordListResultsCopyWith(HealthRecordListResults value,
          $Res Function(HealthRecordListResults) then) =
      _$HealthRecordListResultsCopyWithImpl<$Res, HealthRecordListResults>;
  @useResult
  $Res call({BaioMeta meta, List<HealthRecord> data});

  $BaioMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$HealthRecordListResultsCopyWithImpl<$Res,
        $Val extends HealthRecordListResults>
    implements $HealthRecordListResultsCopyWith<$Res> {
  _$HealthRecordListResultsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as BaioMeta,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<HealthRecord>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BaioMetaCopyWith<$Res> get meta {
    return $BaioMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HealthRecordListResultsCopyWith<$Res>
    implements $HealthRecordListResultsCopyWith<$Res> {
  factory _$$_HealthRecordListResultsCopyWith(_$_HealthRecordListResults value,
          $Res Function(_$_HealthRecordListResults) then) =
      __$$_HealthRecordListResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaioMeta meta, List<HealthRecord> data});

  @override
  $BaioMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$_HealthRecordListResultsCopyWithImpl<$Res>
    extends _$HealthRecordListResultsCopyWithImpl<$Res,
        _$_HealthRecordListResults>
    implements _$$_HealthRecordListResultsCopyWith<$Res> {
  __$$_HealthRecordListResultsCopyWithImpl(_$_HealthRecordListResults _value,
      $Res Function(_$_HealthRecordListResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? data = null,
  }) {
    return _then(_$_HealthRecordListResults(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as BaioMeta,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<HealthRecord>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HealthRecordListResults implements _HealthRecordListResults {
  const _$_HealthRecordListResults(
      {required this.meta, required final List<HealthRecord> data})
      : _data = data;

  factory _$_HealthRecordListResults.fromJson(Map<String, dynamic> json) =>
      _$$_HealthRecordListResultsFromJson(json);

  @override
  final BaioMeta meta;
  final List<HealthRecord> _data;
  @override
  List<HealthRecord> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'HealthRecordListResults(meta: $meta, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HealthRecordListResults &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, meta, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HealthRecordListResultsCopyWith<_$_HealthRecordListResults>
      get copyWith =>
          __$$_HealthRecordListResultsCopyWithImpl<_$_HealthRecordListResults>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HealthRecordListResultsToJson(
      this,
    );
  }
}

abstract class _HealthRecordListResults implements HealthRecordListResults {
  const factory _HealthRecordListResults(
      {required final BaioMeta meta,
      required final List<HealthRecord> data}) = _$_HealthRecordListResults;

  factory _HealthRecordListResults.fromJson(Map<String, dynamic> json) =
      _$_HealthRecordListResults.fromJson;

  @override
  BaioMeta get meta;
  @override
  List<HealthRecord> get data;
  @override
  @JsonKey(ignore: true)
  _$$_HealthRecordListResultsCopyWith<_$_HealthRecordListResults>
      get copyWith => throw _privateConstructorUsedError;
}
