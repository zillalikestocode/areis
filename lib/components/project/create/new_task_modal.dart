import 'package:areis/models/task_model.dart';
import 'package:areis/pages/home/create_project/form_input.dart';
import 'package:areis/providers/new_project_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class NewTaskModal extends StatefulWidget {
  const NewTaskModal({super.key});

  @override
  State<NewTaskModal> createState() => _NewTaskModalState();
}

class _NewTaskModalState extends State<NewTaskModal> {
  TextEditingController newTaskNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
      decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
            child: Container(
          width: 50,
          height: 4,
          decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius: BorderRadius.circular(999)),
        )),
        const Gap(30),
        Text(
          "Add Task",
          style: theme.textTheme.headlineSmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const Gap(20),
        FormInput(
            modal: true,
            controller: newTaskNameController,
            label: "Task Name",
            lines: 1),
        const Gap(10),
        Column(
          children: [
            Text(
              "Assign to:",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {
            context.read<NewProjectProvider>().addTask(
                Task(name: newTaskNameController.text, assignedTo: "Zilla"));
            Navigator.pop(context);
          },
          child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(999)),
              child: const Center(
                  child: Text(
                "Add Task",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ))),
        )
      ]),
    );
  }
}
