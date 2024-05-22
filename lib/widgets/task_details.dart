import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_sqlite/utils/utils.dart';
import 'package:riverpod_sqlite/widgets/widgets.dart';

import '../data/models/models.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});

  final Task task;
  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          const Gap(20),
          Text(
            task.title,
            style: style.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            task.time,
            style: style.titleMedium?.copyWith(),
          ),
          const Gap(16),
          Visibility(
            visible: !task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('task to be completed on ${task.date}'),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                )
              ],
            ),
          ),
          const Gap(16),
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          const Gap(15),
          Text(
            task.note.isEmpty
                ? 'There is no addiitional note for this tasj'
                : task.note,
          ),
          const Gap(15),
          Visibility(
            visible: task.isCompleted,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('task completed  ${task.date}'),
                const Icon(
                  Icons.check_box,
                  color: Colors.green,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
