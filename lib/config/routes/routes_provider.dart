import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_sqlite/config/config.dart';


final navigationKey = GlobalKey<NavigatorState>();

final routesProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteLocation.home,
    navigatorKey: navigationKey,
    routes: appRoutes,
  );
});
