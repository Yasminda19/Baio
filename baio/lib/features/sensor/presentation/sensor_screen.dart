import 'package:baio/constants/exceptions.dart';
import 'package:baio/features/sensor/domain/record.dart';
import 'package:baio/features/sensor/domain/sensor.dart';
import 'package:baio/features/sensor/presentation/sensor_card.dart';
import 'package:baio/features/sensor/repository/sensor_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

class SensorScreen extends ConsumerStatefulWidget {
  final String sensorAddress;
  const SensorScreen({super.key, required this.sensorAddress});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SensorScreenState();
}

class _SensorScreenState extends ConsumerState<SensorScreen> {
  // final sensorProvider = FutureProvider.autoDispose<Sensor>((ref) {
  //   final sensorRepository = ref.watch(sensorRepositoryProvider);
  //   return sensorRepository.getSensor(sensorAddress);
  // });

  // final sensorHealthRecordProvider =
  //     FutureProvider.autoDispose<List<HealthRecord>>((ref) {
  //   final sensorRepository = ref.watch(sensorRepositoryProvider);
  //   return sensorRepository.getHealthRecord(sensorAddress);
  // });

  // final sensor = ref.watch(sensorProvider);

  // final sensorHealthRecord = ref.watch(sensorHealthRecordProvider);
  // const factory HealthRecord({
  //   required int id,
  //   required int datetime,
  //   required String health,
  //   required int heartRate,
  //   required int respiratoryRate,
  //   required double temperature,
  //   required String position,
  //   required bool awakeStatus,
  // }) = _HealthRecord;
  // final List<PlutoColumn> columns = <PlutoColumn>[
  //   PlutoColumn(
  //     title: 'Id',
  //     field: 'id',
  //     type: PlutoColumnType.number(),
  //   ),
  //   PlutoColumn(
  //     title: 'DateTime',
  //     field: 'datetime',
  //     type: PlutoColumnType.date(),
  //   ),
  //   PlutoColumn(
  //     title: 'Health',
  //     field: 'health',
  //     type: PlutoColumnType.text(),
  //   ),
  //   PlutoColumn(
  //     title: 'Heart Rate',
  //     field: 'heartRate',
  //     type: PlutoColumnType.number(),
  //   ),
  //   PlutoColumn(
  //     title: 'Respiratory Rate',
  //     field: 'respiratoryRate',
  //     type: PlutoColumnType.number(),
  //   ),
  //   PlutoColumn(
  //     title: 'Temperature',
  //     field: 'temperature',
  //     type: PlutoColumnType.number(format: "##.##"),
  //   ),
  //   PlutoColumn(
  //     title: 'Position',
  //     field: 'position',
  //     type: PlutoColumnType.text(),
  //   ),
  // ];

  // final List<PlutoRow> rows = [
  //   PlutoRow(
  //     cells: {
  //       'id': PlutoCell(value: 1),
  //       'datetime': PlutoCell(value: '2021-01-01'),
  //       'health': PlutoCell(value: 'Healthy'),
  //       'heartRate': PlutoCell(value: 103),
  //       'respiratoryRate': PlutoCell(value: 90),
  //       'temperature': PlutoCell(value: 36.5),
  //       'position': PlutoCell(value: 'Terlentang'),
  //     },
  //   ),
  // ];

  final columns = [
    PlutoColumn(
      title: 'Column 1',
      field: 'column1',
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Column 2',
      field: 'column2',
      type: PlutoColumnType.text(),
    ),
    // Add more columns as needed.
  ];

  final rows = [
    PlutoRow(cells: {
      'column1': PlutoCell(value: 'Value 1'),
      'column2': PlutoCell(value: 'Value 2'),
    }),
    PlutoRow(cells: {
      'column1': PlutoCell(value: 'Value 3'),
      'column2': PlutoCell(value: 'Value 4'),
    }),
    // Add more rows as needed.
  ];

  /// [PlutoGridStateManager] has many methods and properties to dynamically manipulate the grid.
  /// You can manipulate the grid dynamically at runtime by passing this through the [onLoaded] callback.
  late final PlutoGridStateManager stateManager;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate.fixed([
            // const SliverAppBar(
            //   title: Text("Sensor"),
            // ),
            SensorCard(sensor: Sensor(name: "", address: widget.sensorAddress)),
            Container(
              padding: const EdgeInsets.all(15.0),
              height: 500.0,
              child: PlutoGrid(
                columns: columns,
                rows: rows,
                configuration: const PlutoGridConfiguration(),
              ),
            )
            // sensor.when(
            //   data: (data) => SensorCard(sensor: data),
            //   loading: () => Container(
            //     height: 80.0,
            //     alignment: Alignment.center,
            //     child: const Text("Loading"),
            //   ),
            //   error: (error, stackTrace) => Container(
            //     height: 80.0,
            //     alignment: Alignment.center,
            //     child: Text(error.toString()),
            //   ),
            // )
          ])),
        ],
      ),
    );
  }
}
