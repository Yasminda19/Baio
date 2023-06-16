// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HealthRecord _$$_HealthRecordFromJson(Map<String, dynamic> json) =>
    _$_HealthRecord(
      id: json['id'] as int,
      datetime: json['datetime'] as int,
      health: json['health'] as String,
      heartRate: json['heartRate'] as int,
      respiratoryRate: json['respiratoryRate'] as int,
      temperature: (json['temperature'] as num).toDouble(),
      position: json['position'] as String,
      awakeStatus: json['awakeStatus'] as bool,
    );

Map<String, dynamic> _$$_HealthRecordToJson(_$_HealthRecord instance) =>
    <String, dynamic>{
      'id': instance.id,
      'datetime': instance.datetime,
      'health': instance.health,
      'heartRate': instance.heartRate,
      'respiratoryRate': instance.respiratoryRate,
      'temperature': instance.temperature,
      'position': instance.position,
      'awakeStatus': instance.awakeStatus,
    };

_$_HealthRecordListResults _$$_HealthRecordListResultsFromJson(
        Map<String, dynamic> json) =>
    _$_HealthRecordListResults(
      meta: BaioMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => HealthRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HealthRecordListResultsToJson(
        _$_HealthRecordListResults instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };
