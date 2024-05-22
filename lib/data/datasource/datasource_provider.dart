import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sqlite/data/data.dart';

final taskDataSourceProvider = Provider<TaskDataSource>((ref) {
  return TaskDataSource();
});