// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthLoginResult _$$_AuthLoginResultFromJson(Map<String, dynamic> json) =>
    _$_AuthLoginResult(
      tokenType: json['tokenType'] as int,
      accessToken: json['accessToken'] as String,
    );

Map<String, dynamic> _$$_AuthLoginResultToJson(_$_AuthLoginResult instance) =>
    <String, dynamic>{
      'tokenType': instance.tokenType,
      'accessToken': instance.accessToken,
    };
