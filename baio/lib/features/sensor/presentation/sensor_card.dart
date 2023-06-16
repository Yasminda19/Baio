import 'package:baio/features/sensor/domain/sensor.dart';
import 'package:baio/features/sensor/repository/sensor_repository.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SensorCard extends ConsumerWidget {
  final Sensor sensor;

  const SensorCard({
    super.key,
    required this.sensor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 97,
            child: Container(
              height: 80.0,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(sensor.name ?? "untitled"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4.0, 4.0, 0, 8.0),
                    child: Chip(
                      label: Text(
                        sensor.address,
                        style: const TextStyle(fontSize: 10.0),
                      ),
                      backgroundColor: FlexColor.blueM3DarkPrimary,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: 80.0,
              color: FlexColor.greenLightPrimaryContainer,
            ),
          )
        ],
      ),
    );
  }
}
