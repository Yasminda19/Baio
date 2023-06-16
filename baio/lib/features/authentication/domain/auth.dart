import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class AuthLoginResult with _$AuthLoginResult {
  const factory AuthLoginResult({
    required int tokenType,
    required String accessToken,
  }) = _AuthLoginResult;

  factory AuthLoginResult.fromJson(Map<String, Object?> json) =>
      _$AuthLoginResultFromJson(json);
}
