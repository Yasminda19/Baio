// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthLoginResult _$$_AuthLoginResultFromJson(Map<String, dynamic> json) =>
    _$_AuthLoginResult(
      token_type: json['token_type'] as String,
      access_token: json['access_token'] as String,
    );

Map<String, dynamic> _$$_AuthLoginResultToJson(_$_AuthLoginResult instance) =>
    <String, dynamic>{
      'token_type': instance.token_type,
      'access_token': instance.access_token,
    };
