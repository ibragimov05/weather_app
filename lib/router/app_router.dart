import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/features/home/presentation/pages/home_page.dart';
import 'package:weather_app/features/splash/presentation/pages/splash_page.dart';

part 'route_names.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: Routes.splash,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.splash,
      name: Routes.splash,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.home,
      name: Routes.home,
      parentNavigatorKey: rootNavigatorKey,
      builder: (_, __) => const HomePage(),
    ),
  ],
);
