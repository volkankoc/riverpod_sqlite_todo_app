import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_sqlite/config/config.dart';
import 'package:riverpod_sqlite/data/data.dart';
import 'package:riverpod_sqlite/providers/providers.dart';
import 'package:riverpod_sqlite/utils/helpers.dart';
import 'package:riverpod_sqlite/widgets/widgets.dart';
//import intl
import 'package:intl/intl.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final appBarColor=ref.watch(categoryProvider);

    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: appBarColor.color,
        title: const DisplayWhiteText(text: 'Create Task'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommonTextField(
                title: 'Title',
                hintText: 'Enter title',
                controller: _titleController,
              ),
              const Gap(20),
              const SelectCategory(),
              const Gap(10),
              const SelectDateTime(),
              CommonTextField(
                title: 'Task Title',
                hintText: 'Deneme',
                maxLines: 4,
                controller: _noteController,
              ),
              const Gap(20),
              ElevatedButton(
                  onPressed: _createTask,
                  child: const DisplayWhiteText(text: 'Save'))
            ],
          ),
        ),
      ),
    );
  }

  void _createTask() async {
    final title = _titleController.text.trim();
    final note = _noteController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);
    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        category: category,
        time: Helpers.timeToString(time),
        date: DateFormat.yMMMd().format(date),
        note: note,
        isCompleted: false,
      );

      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        context.go(RouteLocation.home);
      });
    }
  }
}
