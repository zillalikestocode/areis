import 'package:areis/components/project/create/task_card_dropdown.dart';
import 'package:areis/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TaskListCard extends StatelessWidget {
  const TaskListCard({
    super.key,
    required this.task,
    required this.theme,
  });

  final ThemeData theme;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              task.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Gap(10),
            Text(
              "Assigned to Jake",
              style: TextStyle(color: theme.colorScheme.secondary),
            )
          ]),
          const Spacer(),
          AddTaskDropdown(task: task)
        ],
      ),
    );
  }
}
