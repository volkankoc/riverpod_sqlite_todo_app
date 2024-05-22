import 'package:go_router/go_router.dart';
import 'package:riverpod_sqlite/config/config.dart';
import 'package:riverpod_sqlite/screens/screens.dart';


final appRoutes = [
  GoRoute(
      path: RouteLocation.home,
      parentNavigatorKey: navigationKey,
      builder: (context, state) {
        return const HomeScreen();
      }),
  GoRoute(
      path: RouteLocation.createTask,
      parentNavigatorKey: navigationKey,
      builder: (context, state) {
        return const CreateTaskScreen();
      }),
];
