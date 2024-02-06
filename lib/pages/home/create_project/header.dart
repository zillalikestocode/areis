// import 'package:areis/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class CreateProjectHeader extends StatelessWidget {
  const CreateProjectHeader({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Text(
          "Create Project",
          style: theme.textTheme.headlineSmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.redAccent),
                )),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Save",
                  style: theme.textTheme.bodyLarge!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent),
                )),
          ],
        )
      ],
    );
  }
}
