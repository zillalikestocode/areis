import 'package:areis/components/home/drawer/side_drawer.dart';
import 'package:areis/components/home/project_list.dart';
import 'package:areis/models/project_model.dart';
import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
import 'package:areis/components/home/appbar.dart';
import 'package:areis/components/home/no_projects.dart';
import 'package:areis/pages/home/create_project/create_project.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<Project>> getProjects() async {
    final String jsonString =
        await rootBundle.loadString('assets/dummy/projects.json');

    List<Project> projectList = projectFromJson(jsonString);

    return projectList;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    // final auth = AuthService();

    return Scaffold(
      drawerEdgeDragWidth: 300,
      drawer: const SideDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
              child: FutureBuilder(
                future: getProjects(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ProjectList(projects: snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                  }

                  return const NoProject();
                },
              ),
            ),
            TopBar(
              theme: theme,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        onPressed: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const CreateProject(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                var begin = const Offset(0.0, 1.0);
                var end = Offset.zero;
                var curve = Curves.ease;

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            ),
          );
        },
        child: const Icon(
          Iconsax.add,
          size: 30,
        ),
      ),
    );
  }
}
