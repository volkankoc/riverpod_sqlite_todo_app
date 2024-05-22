import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sqlite/utils/utils.dart';

final categoryProvider = StateProvider<TaskCategories>((ref) {
  return TaskCategories.others;
});
