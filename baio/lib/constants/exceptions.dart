import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';
part 'exceptions.g.dart';

@freezed
class BaioException with _$BaioException {
  const factory BaioException({
    required int status,
    required String message,
  }) = _BaioException;

  factory BaioException.fromJson(Map<String, Object?> json) =>
      _$BaioExceptionFromJson(json);
}
