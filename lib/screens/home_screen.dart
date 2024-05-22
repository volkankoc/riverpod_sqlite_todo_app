import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_sqlite/config/config.dart';
import 'package:riverpod_sqlite/data/models/task.dart';
import 'package:riverpod_sqlite/utils/utils.dart';
import 'package:riverpod_sqlite/widgets/widgets.dart';

import '../providers/task/task_provider.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    final taskState=ref.watch(taskProvider);
    final completedTask=_completedTasks(taskState.tasks);
    final incompletedTask=_incompletedTasks(taskState.tasks);

    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: deviceSize.height * 0.3,
              width: deviceSize.width,
              color: colors.primary,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DisplayWhiteText(text: 'Ağustos 7 2027', fontSize: 20),
                  DisplayWhiteText(
                      text: 'My Todo List',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 150,
          left: 0,
          right: 0,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   DisplayListOfTasks(
                    tasks: incompletedTask
                  ),
                  const Gap(20),
                  const Text('Completed'),
                  const Gap(20),
                   DisplayListOfTasks(
                    tasks: completedTask,
                    isCompletedTask: true,
                  ),
                  const Gap(20),
                  ElevatedButton(
                      onPressed: () =>context.push(RouteLocation.createTask),
                      child: const DisplayWhiteText(text: 'Add new Task'))
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
  List<Task> _completedTasks(List<Task> tasks){
    final List<Task> filteredTasks=[];
    for (var task in tasks){
      if (task.isCompleted){
        filteredTasks.add(task);
      }
    }
    return filteredTasks;
  }
   List<Task> _incompletedTasks(List<Task> tasks){
    final List<Task> filteredTasks=[];
    for (var task in tasks){
      if (!task.isCompleted){
        filteredTasks.add(task);
      }
    }
    return filteredTasks;
  }
}
