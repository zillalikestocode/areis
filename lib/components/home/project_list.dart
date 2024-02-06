import 'package:areis/components/home/project_card.dart';
import 'package:areis/models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({super.key, required this.projects});

  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text(
        //   "Your Projects",
        //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        // ),
        // const Gap(20),
        ListView.separated(
          separatorBuilder: (context, index) => const Gap(20),
          shrinkWrap: true,
          itemBuilder: (context, index) => ProjectCard(
            name: projects[index].name,
            progress: projects[index].progress,
            id: projects[index].id,
            members: projects[index].members,
          ),
          itemCount: 3,
        ),
      ],
    );
  }
}
