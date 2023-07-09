import 'package:baio/constants/exceptions.dart';
import 'package:baio/features/sensor/domain/sensor.dart';
import 'package:baio/features/sensor/presentation/sensor_card.dart';
import 'package:baio/features/sensor/repository/sensor_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SensorListScreen extends ConsumerWidget {
  const SensorListScreen({super.key});

  final emptySensor = const Sensor(address: "0x0", name: "Error");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sensorRepository = ref.watch(sensorRepositoryProvider);

    return Scaffold(
        appBar: AppBar(title: const Text("Sensors")),
        body: FutureBuilder(
          future: sensorRepository.getListSensor(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              var errorMessage = snapshot.error.toString();
              if (snapshot.error is BaioException) {
                errorMessage = (snapshot.error as BaioException).message;
              }
              return Text("Error: $errorMessage");
            }

            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            var data = snapshot.data;

            if (data == null || data.isEmpty) {
              return const SensorCard(
                  sensor: Sensor(address: "0x0", name: "No Sensors!"));
            }

            return CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    var sensor = data[index];

                    return GestureDetector(
                      onTap: () {
                        // ref.read(sensorProvider.notifier).state = sensor;
                        context.push("/sensors/${sensor.address}");
                      },
                      child: SensorCard(sensor: sensor),
                    );
                  }, childCount: data.length),
                )
              ],
            );
          },
        ));
  }
}
