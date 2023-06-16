import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta.freezed.dart';
part 'meta.g.dart';

@freezed
class BaioMeta with _$BaioMeta {
  const factory BaioMeta({
    required int total,
    required int? page,
    required int? perPage,
  }) = _BaioMeta;

  factory BaioMeta.fromJson(Map<String, Object?> json) =>
      _$BaioMetaFromJson(json);
}
