import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sqlite/config/config.dart';
import 'package:riverpod_sqlite/config/routes/routes.dart';


class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final routeConfig=ref.watch(routesProvider);
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: routeConfig,
    );
  }
}
