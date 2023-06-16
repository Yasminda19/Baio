import 'dart:convert' as convert;
import 'dart:io';

import 'package:baio/constants/exceptions.dart';
import 'package:baio/core/baio.dart';
import 'package:baio/features/authentication/repository/auth_repository.dart';
import 'package:baio/features/sensor/domain/record.dart';
import 'package:baio/features/sensor/domain/sensor.dart';
import 'package:http/http.dart' as http;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sensor_repository.g.dart';

abstract class SensorRepository {
  Future<List<Sensor>> getListSensor();
  Future<Sensor> getSensor(String sensorAddress);
  Future<List<HealthRecord>> getHealthRecord(String sensorAddress);
}

class BaioSensorRepository implements SensorRepository {
  final BaioClient _client;

  BaioSensorRepository(this._client);

  static final sensorListEndpoint =
      Uri.parse('http://localhost:5000/api/v1/sensors');

  @override
  Future<List<Sensor>> getListSensor() async {
    var response = await _client.get(sensorListEndpoint);
    var json = convert.jsonDecode(response.body);

    if (response.statusCode != HttpStatus.ok) {
      throw BaioException.fromJson(json);
    }

    var res = SensorListResults.fromJson(json);
    return res.data;
  }

  @override
  Future<Sensor> getSensor(String sensorAddress) async {
    var sensorEndpoint =
        Uri.parse("http://localhost:5000/api/v1/sensors/$sensorAddress");
    var response = await _client.get(sensorEndpoint);
    var json = convert.jsonDecode(response.body);

    if (response.statusCode != HttpStatus.ok) {
      throw BaioException.fromJson(json);
    }

    return Sensor.fromJson(json);
  }

  @override
  Future<List<HealthRecord>> getHealthRecord(String sensorAddress) async {
    var sensorHealthRecordEndpoint = Uri.parse(
        "http://localhost:5000/api/v1/sensors/$sensorAddress/records");
    var response = await _client.get(sensorHealthRecordEndpoint);
    var json = convert.jsonDecode(response.body);

    if (response.statusCode != HttpStatus.ok) {
      throw BaioException.fromJson(json);
    }

    var res = HealthRecordListResults.fromJson(json);
    return res.data;
  }
}

@riverpod
BaioSensorRepository sensorRepository(SensorRepositoryRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return BaioSensorRepository(authRepository.client!);
}
