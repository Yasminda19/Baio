// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exceptions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BaioException _$BaioExceptionFromJson(Map<String, dynamic> json) {
  return _BaioException.fromJson(json);
}

/// @nodoc
mixin _$BaioException {
  int get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaioExceptionCopyWith<BaioException> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaioExceptionCopyWith<$Res> {
  factory $BaioExceptionCopyWith(
          BaioException value, $Res Function(BaioException) then) =
      _$BaioExceptionCopyWithImpl<$Res, BaioException>;
  @useResult
  $Res call({int status, String message});
}

/// @nodoc
class _$BaioExceptionCopyWithImpl<$Res, $Val extends BaioException>
    implements $BaioExceptionCopyWith<$Res> {
  _$BaioExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BaioExceptionCopyWith<$Res>
    implements $BaioExceptionCopyWith<$Res> {
  factory _$$_BaioExceptionCopyWith(
          _$_BaioException value, $Res Function(_$_BaioException) then) =
      __$$_BaioExceptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status, String message});
}

/// @nodoc
class __$$_BaioExceptionCopyWithImpl<$Res>
    extends _$BaioExceptionCopyWithImpl<$Res, _$_BaioException>
    implements _$$_BaioExceptionCopyWith<$Res> {
  __$$_BaioExceptionCopyWithImpl(
      _$_BaioException _value, $Res Function(_$_BaioException) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
  }) {
    return _then(_$_BaioException(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BaioException implements _BaioException {
  const _$_BaioException({required this.status, required this.message});

  factory _$_BaioException.fromJson(Map<String, dynamic> json) =>
      _$$_BaioExceptionFromJson(json);

  @override
  final int status;
  @override
  final String message;

  @override
  String toString() {
    return 'BaioException(status: $status, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaioException &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaioExceptionCopyWith<_$_BaioException> get copyWith =>
      __$$_BaioExceptionCopyWithImpl<_$_BaioException>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BaioExceptionToJson(
      this,
    );
  }
}

abstract class _BaioException implements BaioException {
  const factory _BaioException(
      {required final int status,
      required final String message}) = _$_BaioException;

  factory _BaioException.fromJson(Map<String, dynamic> json) =
      _$_BaioException.fromJson;

  @override
  int get status;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_BaioExceptionCopyWith<_$_BaioException> get copyWith =>
      throw _privateConstructorUsedError;
}
