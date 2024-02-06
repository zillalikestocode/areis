import 'package:areis/components/project/attachments.dart';
import 'package:areis/components/project/members.dart';
import 'package:areis/components/project/share/share_modal.dart';
import 'package:areis/components/project/task_list.dart';
import 'package:areis/models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key, required this.id});

  final String id;

  Future<Project> getProject() async {
    String jsonString =
        await rootBundle.loadString("assets/dummy/projects.json");
    List<Project> projects = projectFromJson(jsonString);
    Project project = projects.firstWhere((element) => element.id == id);

    return project;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FutureBuilder(
        future: getProject(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Project project = snapshot.data!;

              return MainProjectPage(theme: theme, project: project);
            } else if (snapshot.hasError) {
              return Scaffold(
                  body: SafeArea(
                      child: Center(child: Text(snapshot.error.toString()))));
            }
          }

          return const Scaffold(
              body:
                  SafeArea(child: Center(child: CircularProgressIndicator())));
        });
  }
}

class MainProjectPage extends StatelessWidget {
  const MainProjectPage(
      {super.key, required this.theme, required this.project});

  final ThemeData theme;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Iconsax.arrow_left,
              size: 30,
            )),
        backgroundColor: theme.colorScheme.background,
        title: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                project.name,
                style: theme.textTheme.headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              HeaderActions(theme: theme)
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 20),
                shrinkWrap: true,
                children: [
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(project.description),
                  ),
                  const Gap(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Members(
                      members: project.members,
                    ),
                  ),
                  const Gap(10),
                  const TaskList(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Click the Edit button above to add new tasks",
                      style: TextStyle(color: theme.colorScheme.secondary),
                    ),
                  ),
                  const Gap(30),
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Attachments())
                ],
              ),
            ),
            // ButtonActions()
          ],
        ),
      ),
    );
  }
}

class ButtonActions extends StatelessWidget {
  const ButtonActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(children: [
        Expanded(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: const Center(
                  child: Text("Attach File",
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w500))),
            ),
          ),
        ),
        const Gap(20),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(999)),
            child: const Center(
              child: Icon(
                Iconsax.messages,
                size: 40,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class HeaderActions extends StatelessWidget {
  const HeaderActions({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () => showModalBottomSheet(
                elevation: 0,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                context: context,
                builder: (context) => const ShareModal()),
            child: Text(
              "Share",
              style:
                  theme.textTheme.bodyLarge!.copyWith(color: Colors.blueAccent),
            )),
        const Gap(20),
        InkWell(
            onTap: () {},
            child: Text(
              "Edit",
              style:
                  theme.textTheme.bodyLarge!.copyWith(color: Colors.blueAccent),
            ))
      ],
    );
  }
}
