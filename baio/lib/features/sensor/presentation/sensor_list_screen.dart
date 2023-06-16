import 'package:baio/constants/sizes.dart';
import 'package:baio/features/sensor/domain/sensor.dart';
import 'package:baio/features/sensor/presentation/sensor_card.dart';
import 'package:baio/features/sensor/repository/sensor_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SensorListScreen extends HookConsumerWidget {
  const SensorListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Sensor> sensors = <Sensor>[
      const Sensor(
          name: "budi", address: "0x331E1882e0FC0fa68fF8b42cB684b77638D6941C"),
      const Sensor(
          name: "salamah",
          address: "0x331E1882e0FC0fa68fF8b42cB684b77638D6941C"),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Sensors"),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              var sensor = sensors[index];
              return GestureDetector(
                onTap: () {
                  // ref.read(sensorProvider.notifier).state = sensor;
                  context.push("/sensors/${sensor.address}");
                },
                child: SensorCard(sensor: sensors[index]),
              );
            }, childCount: 2),
          )
        ],
      ),
    );
  }
}
