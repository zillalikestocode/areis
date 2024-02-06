import 'package:areis/components/project/create/task_list.dart';
import 'package:areis/providers/new_project_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:areis/pages/home/create_project/form_input.dart';
import 'package:areis/pages/home/create_project/header.dart';
import 'package:provider/provider.dart';

class CreateProject extends StatefulWidget {
  const CreateProject({super.key});

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
          child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          const CreateProjectHeader(),
          Form(
              child: Column(
            children: [
              const Gap(20),
              FormInput(
                  modal: false,
                  lines: 1,
                  controller:
                      context.watch<NewProjectProvider>().projectNameController,
                  label: "Project Name"),
              const Gap(20),
              FormInput(
                modal: false,
                lines: 4,
                controller: context
                    .watch<NewProjectProvider>()
                    .projectDescriptionController,
                label: "Project Description",
              )
            ],
          )),
          const Gap(20),
          const Gap(20),
          TaskList(theme: theme)
        ],
      )),
    );
  }
}
