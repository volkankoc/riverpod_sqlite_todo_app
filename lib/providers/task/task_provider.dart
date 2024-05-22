import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sqlite/data/data.dart';
import 'package:riverpod_sqlite/providers/providers.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});
