import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:riverpod_sqlite/providers/providers.dart';
import 'package:riverpod_sqlite/widgets/widgets.dart';
import 'package:intl/intl.dart';

class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    return Row(
      children: [
        Expanded(
            child: CommonTextField(
          title: 'Date', //gün ay yıl çeklinde olaca dateformat
          hintText: DateFormat.yMMMd().format(date),
          readOnly: true,
          suffixIcon: IconButton(
            onPressed: () => selectDate(context, ref),
            icon: const FaIcon(FontAwesomeIcons.calendar),
          ),
        )),
        const Gap(10),
        Expanded(
          child: CommonTextField(
              title: 'Time',
              readOnly: true,
              hintText: time.format(context),
              suffixIcon: IconButton(
                onPressed: () => selectTime(context,ref),
                icon: const FaIcon(FontAwesomeIcons.clock),
              )),
        )
      ],
    );
  }

  void selectTime(BuildContext context, WidgetRef ref) async {
    final initialTime = ref.read(timeProvider);
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (pickedTime != null) {
      ref.read(timeProvider.notifier).state = pickedTime;
    }
  }

  void selectDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.read(dateProvider);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    );
    if (pickedDate != null) {
      ref.read(dateProvider.notifier).state = pickedDate;
    }
  }
}
