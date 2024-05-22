import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sqlite/data/models/task.dart';
import 'package:riverpod_sqlite/utils/app_alerts.dart';
import 'package:riverpod_sqlite/utils/extensions.dart';
import 'package:riverpod_sqlite/widgets/widgets.dart';

class DisplayListOfTasks extends ConsumerWidget {
  const DisplayListOfTasks(
      {super.key, required this.tasks, this.isCompletedTask = false});

  final List<Task> tasks;
  final bool isCompletedTask;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTask ? deviceSize.height * 0.2 : deviceSize.height * 0.3;
    final emptyMessage = isCompletedTask ? 'No completed task' : 'No task';
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
              emptyMessage,
              style: context.textTheme.headlineSmall
                  ?.copyWith(color: context.colorScheme.onSurface),
            ))
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    AppAlerts.showAlertDeleteDialog(context: context, ref: ref, task: task);
                  },
                  onTap: () async {
                    await showModalBottomSheet(context: context, builder: (ctc){
                      return TaskDetails(task:task);
                    });
                  },
                  child: TaskTile(
                    task: task,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.0,
                );
              },
            ),
    );
  }
}
