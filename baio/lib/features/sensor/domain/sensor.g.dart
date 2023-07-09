// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sensor _$$_SensorFromJson(Map<String, dynamic> json) => _$_Sensor(
      name: json['name'] as String?,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$_SensorToJson(_$_Sensor instance) => <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
    };

_$_SensorListResults _$$_SensorListResultsFromJson(Map<String, dynamic> json) =>
    _$_SensorListResults(
      meta: json['meta'] == null
          ? null
          : BaioMeta.fromJson(json['meta'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Sensor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SensorListResultsToJson(
        _$_SensorListResults instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };
