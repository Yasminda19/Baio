import 'package:baio/constants/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'record.freezed.dart';
part 'record.g.dart';

@freezed
class HealthRecord with _$HealthRecord {
  const factory HealthRecord({
    required int id,
    required int datetime,
    required String health,
    required int heartRate,
    required int respiratoryRate,
    required double temperature,
    required String position,
    required bool awakeStatus,
  }) = _HealthRecord;

  factory HealthRecord.fromJson(Map<String, Object?> json) =>
      _$HealthRecordFromJson(json);
}

@freezed
class HealthRecordListResults with _$HealthRecordListResults {
  const factory HealthRecordListResults({
    required BaioMeta meta,
    required List<HealthRecord> data,
  }) = _HealthRecordListResults;

  factory HealthRecordListResults.fromJson(Map<String, Object?> json) =>
      _$HealthRecordListResultsFromJson(json);
}
