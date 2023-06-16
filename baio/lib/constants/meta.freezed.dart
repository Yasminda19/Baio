// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BaioMeta _$BaioMetaFromJson(Map<String, dynamic> json) {
  return _BaioMeta.fromJson(json);
}

/// @nodoc
mixin _$BaioMeta {
  int get total => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int? get perPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaioMetaCopyWith<BaioMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaioMetaCopyWith<$Res> {
  factory $BaioMetaCopyWith(BaioMeta value, $Res Function(BaioMeta) then) =
      _$BaioMetaCopyWithImpl<$Res, BaioMeta>;
  @useResult
  $Res call({int total, int? page, int? perPage});
}

/// @nodoc
class _$BaioMetaCopyWithImpl<$Res, $Val extends BaioMeta>
    implements $BaioMetaCopyWith<$Res> {
  _$BaioMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = freezed,
    Object? perPage = freezed,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BaioMetaCopyWith<$Res> implements $BaioMetaCopyWith<$Res> {
  factory _$$_BaioMetaCopyWith(
          _$_BaioMeta value, $Res Function(_$_BaioMeta) then) =
      __$$_BaioMetaCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int? page, int? perPage});
}

/// @nodoc
class __$$_BaioMetaCopyWithImpl<$Res>
    extends _$BaioMetaCopyWithImpl<$Res, _$_BaioMeta>
    implements _$$_BaioMetaCopyWith<$Res> {
  __$$_BaioMetaCopyWithImpl(
      _$_BaioMeta _value, $Res Function(_$_BaioMeta) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = freezed,
    Object? perPage = freezed,
  }) {
    return _then(_$_BaioMeta(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BaioMeta implements _BaioMeta {
  const _$_BaioMeta(
      {required this.total, required this.page, required this.perPage});

  factory _$_BaioMeta.fromJson(Map<String, dynamic> json) =>
      _$$_BaioMetaFromJson(json);

  @override
  final int total;
  @override
  final int? page;
  @override
  final int? perPage;

  @override
  String toString() {
    return 'BaioMeta(total: $total, page: $page, perPage: $perPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaioMeta &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, page, perPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaioMetaCopyWith<_$_BaioMeta> get copyWith =>
      __$$_BaioMetaCopyWithImpl<_$_BaioMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BaioMetaToJson(
      this,
    );
  }
}

abstract class _BaioMeta implements BaioMeta {
  const factory _BaioMeta(
      {required final int total,
      required final int? page,
      required final int? perPage}) = _$_BaioMeta;

  factory _BaioMeta.fromJson(Map<String, dynamic> json) = _$_BaioMeta.fromJson;

  @override
  int get total;
  @override
  int? get page;
  @override
  int? get perPage;
  @override
  @JsonKey(ignore: true)
  _$$_BaioMetaCopyWith<_$_BaioMeta> get copyWith =>
      throw _privateConstructorUsedError;
}
