import 'package:areis/components/project/task_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({super.key, required this.index, required this.title});

  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                Text(
                  "Assigned to Jake",
                  style: TextStyle(color: theme.colorScheme.secondary),
                ),
                RichText(
                    text: TextSpan(
                        text: "Status: ",
                        style: TextStyle(color: theme.colorScheme.onBackground),
                        children: const [
                      TextSpan(
                          text: "Incomplete",
                          style: TextStyle(color: Colors.redAccent))
                    ]))
              ]),
          const Gap(15),
          TaskDropdown(index: index)
        ],
      ),
    );
  }
}
