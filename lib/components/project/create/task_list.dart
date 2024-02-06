import 'package:areis/components/project/create/new_task_modal.dart';
import 'package:areis/components/project/create/task_list_card.dart';
import 'package:areis/providers/new_project_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Task List",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            InkWell(
                onTap: () => showModalBottomSheet(
                    context: context, builder: (_) => NewTaskModal()),
                child: const Text(
                  "Add Task",
                  style: TextStyle(color: Colors.blueAccent),
                ))
          ],
        ),
        const Gap(10),
        context.watch<NewProjectProvider>().taskList.length != 0
            ? ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, index) => TaskListCard(
                    task: context.watch<NewProjectProvider>().taskList[index],
                    theme: theme),
                separatorBuilder: (context, index) => const Gap(10),
                itemCount: context.watch<NewProjectProvider>().taskList.length)
            : Center(
                child: Column(
                  children: [
                    Icon(
                      Iconsax.add,
                      size: 40,
                      color: theme.colorScheme.secondary,
                    ),
                    const Gap(10),
                    Text(
                      "No Tasks",
                      style: TextStyle(
                          color: theme.colorScheme.secondary,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Click the Add Task button to add a task.",
                      style: TextStyle(
                          color: theme.colorScheme.secondary, fontSize: 12),
                    )
                  ],
                ),
              ),
        // Column(
        //   children: tasks
        //       .map((e) => TaskListCard(task: e, theme: widget.theme))
        //       .toList(),
        // ),
        const Gap(5),
      ],
    );
  }
}
