import 'dart:async';

import 'package:baio/constants/exceptions.dart';
import 'package:baio/constants/routes.dart';
import 'package:baio/features/authentication/presentation/login_screen.dart';
import 'package:baio/features/authentication/repository/auth_repository.dart';
import 'package:baio/features/sensor/presentation/sensor_list_screen.dart';
import 'package:baio/features/sensor/presentation/sensor_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

/// This class was imported from the migration guide for GoRouter 5.0
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    redirect: (BuildContext context, GoRouterState state) async {
      final user = await authRepository.getCurrentUser();
      final bool loggingIn = state.matchedLocation == '/login';

      if (user.isRight()) {
        return '/login';
      }

      if (loggingIn) {
        return '/';
      }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/login',
        name: Routes.login.name,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/',
        name: Routes.sensorList.name,
        builder: (context, state) => const SensorListScreen(),
        routes: [
          GoRoute(
              path: 'sensors/:id',
              name: Routes.sensor.name,
              builder: (context, state) {
                final sensorAddress = state.pathParameters['id']!;
                return SensorScreen(
                  sensorAddress: sensorAddress,
                );
              }),
        ],
      )
    ],
  );
}
