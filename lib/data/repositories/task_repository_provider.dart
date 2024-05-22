import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final datasource = ref.watch(taskDataSourceProvider);
  return TaskRepositoryImpl(datasource);
});
