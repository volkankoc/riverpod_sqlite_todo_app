// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../data/models/task.dart';

class TaskState extends Equatable {
  final List<Task> tasks;
  const TaskState(this.tasks);
  const TaskState.initial({this.tasks = const []});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  TaskState copyWith({
    List<Task>? tasks,
  }) {
    return TaskState(
      tasks ?? this.tasks,
    );
  }
}
