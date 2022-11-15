typedef HealthRecordID = String;

class HealthRecord {
  HealthRecord({
    required this.id,
    required this.status,
    this.position,
    this.awakeStatus,
    this.overallHealth,
    this.repiratoryRateReal,
    this.repiratoryRateDL,
    this.pulseRate,
    this.temperature,
  });

  final HealthRecordID id;
  final String status;
  final String? position;
  final String? awakeStatus;
  final String? overallHealth;
  final int? repiratoryRateReal;
  final int? repiratoryRateDL;
  final int? pulseRate;
  final double? temperature;

  HealthRecord.fromMap(Map<String, dynamic> data
      : id = data["id"],
        status = data["status"],
        position = data["position"],
        awakeStatus = data["awakeStatus"],
        overallHealth = data["overallHealth"],
        repiratoryRateReal = data["repiratoryRateReal"],
        repiratoryRateDL = data["repiratoryRateDL"],
        pulseRate = data["pulseRate"],
        temperature = data["temperature"];
  )
  // toMap
}
