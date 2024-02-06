import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class NoProject extends StatelessWidget {
  const NoProject({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
        body: SafeArea(
            child: Center(
                child: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/question_folder.svg"),
            const Gap(10),
            Text(
              "No projects found",
              style: theme.textTheme.headlineSmall!.copyWith(fontSize: 18),
            ),
            Text(
              "Tap the “+” icon to create a project.",
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: theme.colorScheme.secondary),
            )
          ]),
    ))));
  }
}
