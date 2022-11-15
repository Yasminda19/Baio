import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'features/authentication/data/fake_auth_repository.dart';
import 'features/authentication/presentation/sign_in_screen.dart';
import 'features/dashboard/presentation/dashboard_screen.dart';

final routerProvider = Provider.autoDispose<GoRouter>((ref) {
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        name: SignInScreen.routeName,
        path: SignInScreen.routeLocation,
        builder: (context, state) {
          return const SignInScreen();
        },
      ),
      GoRoute(
        name: DashboardScreen.routeName,
        path: DashboardScreen.routeLocation,
        builder: (context, state) {
          return const DashboardScreen();
        },
      ),
    ],
    // initialLocation: ,
    redirect: (context, state) {
      if (authState.isLoading || authState.hasError) return null;

      final isAuth = authState.valueOrNull != null;

      final isLoggingIn = state.location == SignInScreen.routeLocation;
      if (isLoggingIn) return isAuth ? DashboardScreen.routeLocation : null;

      return isAuth
          ? DashboardScreen.routeLocation
          : SignInScreen.routeLocation;
    },
  );
});

final _key = GlobalKey<NavigatorState>();
