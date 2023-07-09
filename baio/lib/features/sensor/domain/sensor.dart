import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:baio/constants/meta.dart';

part 'sensor.freezed.dart';
part 'sensor.g.dart';

@freezed
class Sensor with _$Sensor {
  const factory Sensor({
    required String? name,
    required String address,
  }) = _Sensor;

  factory Sensor.fromJson(Map<String, Object?> json) => _$SensorFromJson(json);
}

@freezed
class SensorListResults with _$SensorListResults {
  const factory SensorListResults({
    required BaioMeta? meta,
    required List<Sensor> data,
  }) = _SensorListResults;

  factory SensorListResults.fromJson(Map<String, Object?> json) =>
      _$SensorListResultsFromJson(json);
}
