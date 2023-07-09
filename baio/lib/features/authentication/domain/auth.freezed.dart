// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthLoginResult _$AuthLoginResultFromJson(Map<String, dynamic> json) {
  return _AuthLoginResult.fromJson(json);
}

/// @nodoc
mixin _$AuthLoginResult {
  String get token_type => throw _privateConstructorUsedError;
  String get access_token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthLoginResultCopyWith<AuthLoginResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthLoginResultCopyWith<$Res> {
  factory $AuthLoginResultCopyWith(
          AuthLoginResult value, $Res Function(AuthLoginResult) then) =
      _$AuthLoginResultCopyWithImpl<$Res, AuthLoginResult>;
  @useResult
  $Res call({String token_type, String access_token});
}

/// @nodoc
class _$AuthLoginResultCopyWithImpl<$Res, $Val extends AuthLoginResult>
    implements $AuthLoginResultCopyWith<$Res> {
  _$AuthLoginResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token_type = null,
    Object? access_token = null,
  }) {
    return _then(_value.copyWith(
      token_type: null == token_type
          ? _value.token_type
          : token_type // ignore: cast_nullable_to_non_nullable
              as String,
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthLoginResultCopyWith<$Res>
    implements $AuthLoginResultCopyWith<$Res> {
  factory _$$_AuthLoginResultCopyWith(
          _$_AuthLoginResult value, $Res Function(_$_AuthLoginResult) then) =
      __$$_AuthLoginResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token_type, String access_token});
}

/// @nodoc
class __$$_AuthLoginResultCopyWithImpl<$Res>
    extends _$AuthLoginResultCopyWithImpl<$Res, _$_AuthLoginResult>
    implements _$$_AuthLoginResultCopyWith<$Res> {
  __$$_AuthLoginResultCopyWithImpl(
      _$_AuthLoginResult _value, $Res Function(_$_AuthLoginResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token_type = null,
    Object? access_token = null,
  }) {
    return _then(_$_AuthLoginResult(
      token_type: null == token_type
          ? _value.token_type
          : token_type // ignore: cast_nullable_to_non_nullable
              as String,
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthLoginResult implements _AuthLoginResult {
  const _$_AuthLoginResult(
      {required this.token_type, required this.access_token});

  factory _$_AuthLoginResult.fromJson(Map<String, dynamic> json) =>
      _$$_AuthLoginResultFromJson(json);

  @override
  final String token_type;
  @override
  final String access_token;

  @override
  String toString() {
    return 'AuthLoginResult(token_type: $token_type, access_token: $access_token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthLoginResult &&
            (identical(other.token_type, token_type) ||
                other.token_type == token_type) &&
            (identical(other.access_token, access_token) ||
                other.access_token == access_token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token_type, access_token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthLoginResultCopyWith<_$_AuthLoginResult> get copyWith =>
      __$$_AuthLoginResultCopyWithImpl<_$_AuthLoginResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthLoginResultToJson(
      this,
    );
  }
}

abstract class _AuthLoginResult implements AuthLoginResult {
  const factory _AuthLoginResult(
      {required final String token_type,
      required final String access_token}) = _$_AuthLoginResult;

  factory _AuthLoginResult.fromJson(Map<String, dynamic> json) =
      _$_AuthLoginResult.fromJson;

  @override
  String get token_type;
  @override
  String get access_token;
  @override
  @JsonKey(ignore: true)
  _$$_AuthLoginResultCopyWith<_$_AuthLoginResult> get copyWith =>
      throw _privateConstructorUsedError;
}
