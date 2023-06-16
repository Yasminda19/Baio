// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sensor _$SensorFromJson(Map<String, dynamic> json) {
  return _Sensor.fromJson(json);
}

/// @nodoc
mixin _$Sensor {
  String? get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SensorCopyWith<Sensor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorCopyWith<$Res> {
  factory $SensorCopyWith(Sensor value, $Res Function(Sensor) then) =
      _$SensorCopyWithImpl<$Res, Sensor>;
  @useResult
  $Res call({String? name, String address});
}

/// @nodoc
class _$SensorCopyWithImpl<$Res, $Val extends Sensor>
    implements $SensorCopyWith<$Res> {
  _$SensorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SensorCopyWith<$Res> implements $SensorCopyWith<$Res> {
  factory _$$_SensorCopyWith(_$_Sensor value, $Res Function(_$_Sensor) then) =
      __$$_SensorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String address});
}

/// @nodoc
class __$$_SensorCopyWithImpl<$Res>
    extends _$SensorCopyWithImpl<$Res, _$_Sensor>
    implements _$$_SensorCopyWith<$Res> {
  __$$_SensorCopyWithImpl(_$_Sensor _value, $Res Function(_$_Sensor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? address = null,
  }) {
    return _then(_$_Sensor(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sensor implements _Sensor {
  const _$_Sensor({required this.name, required this.address});

  factory _$_Sensor.fromJson(Map<String, dynamic> json) =>
      _$$_SensorFromJson(json);

  @override
  final String? name;
  @override
  final String address;

  @override
  String toString() {
    return 'Sensor(name: $name, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Sensor &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SensorCopyWith<_$_Sensor> get copyWith =>
      __$$_SensorCopyWithImpl<_$_Sensor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SensorToJson(
      this,
    );
  }
}

abstract class _Sensor implements Sensor {
  const factory _Sensor(
      {required final String? name, required final String address}) = _$_Sensor;

  factory _Sensor.fromJson(Map<String, dynamic> json) = _$_Sensor.fromJson;

  @override
  String? get name;
  @override
  String get address;
  @override
  @JsonKey(ignore: true)
  _$$_SensorCopyWith<_$_Sensor> get copyWith =>
      throw _privateConstructorUsedError;
}

SensorListResults _$SensorListResultsFromJson(Map<String, dynamic> json) {
  return _SensorListResults.fromJson(json);
}

/// @nodoc
mixin _$SensorListResults {
  BaioMeta get meta => throw _privateConstructorUsedError;
  List<Sensor> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SensorListResultsCopyWith<SensorListResults> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorListResultsCopyWith<$Res> {
  factory $SensorListResultsCopyWith(
          SensorListResults value, $Res Function(SensorListResults) then) =
      _$SensorListResultsCopyWithImpl<$Res, SensorListResults>;
  @useResult
  $Res call({BaioMeta meta, List<Sensor> data});

  $BaioMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$SensorListResultsCopyWithImpl<$Res, $Val extends SensorListResults>
    implements $SensorListResultsCopyWith<$Res> {
  _$SensorListResultsCopyWithImpl(this._value, this._then);

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
              as List<Sensor>,
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
abstract class _$$_SensorListResultsCopyWith<$Res>
    implements $SensorListResultsCopyWith<$Res> {
  factory _$$_SensorListResultsCopyWith(_$_SensorListResults value,
          $Res Function(_$_SensorListResults) then) =
      __$$_SensorListResultsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BaioMeta meta, List<Sensor> data});

  @override
  $BaioMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$_SensorListResultsCopyWithImpl<$Res>
    extends _$SensorListResultsCopyWithImpl<$Res, _$_SensorListResults>
    implements _$$_SensorListResultsCopyWith<$Res> {
  __$$_SensorListResultsCopyWithImpl(
      _$_SensorListResults _value, $Res Function(_$_SensorListResults) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? data = null,
  }) {
    return _then(_$_SensorListResults(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as BaioMeta,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Sensor>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SensorListResults implements _SensorListResults {
  const _$_SensorListResults(
      {required this.meta, required final List<Sensor> data})
      : _data = data;

  factory _$_SensorListResults.fromJson(Map<String, dynamic> json) =>
      _$$_SensorListResultsFromJson(json);

  @override
  final BaioMeta meta;
  final List<Sensor> _data;
  @override
  List<Sensor> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'SensorListResults(meta: $meta, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SensorListResults &&
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
  _$$_SensorListResultsCopyWith<_$_SensorListResults> get copyWith =>
      __$$_SensorListResultsCopyWithImpl<_$_SensorListResults>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SensorListResultsToJson(
      this,
    );
  }
}

abstract class _SensorListResults implements SensorListResults {
  const factory _SensorListResults(
      {required final BaioMeta meta,
      required final List<Sensor> data}) = _$_SensorListResults;

  factory _SensorListResults.fromJson(Map<String, dynamic> json) =
      _$_SensorListResults.fromJson;

  @override
  BaioMeta get meta;
  @override
  List<Sensor> get data;
  @override
  @JsonKey(ignore: true)
  _$$_SensorListResultsCopyWith<_$_SensorListResults> get copyWith =>
      throw _privateConstructorUsedError;
}
