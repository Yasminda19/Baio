import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class AuthLoginResult with _$AuthLoginResult {
  const factory AuthLoginResult({
    required String token_type,
    required String access_token,
  }) = _AuthLoginResult;

  factory AuthLoginResult.fromJson(Map<String, Object?> json) =>
      _$AuthLoginResultFromJson(json);
}
