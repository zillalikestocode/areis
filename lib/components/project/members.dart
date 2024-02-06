import 'package:areis/models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Members extends StatelessWidget {
  const Members({super.key, required this.members});

  final List<Member> members;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Members",
          style: theme.textTheme.headlineSmall!
              .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        const Gap(10),
        Stack(
            children: List.generate(members.length, (_) => [])
                .asMap()
                .map(
                  (index, element) => MapEntry(
                      index,
                      Container(
                        margin: EdgeInsets.only(left: index * 24),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: theme.colorScheme.background,
                                width: 1.5),
                            borderRadius: BorderRadius.circular(999),
                            color: theme.colorScheme.primary),
                      )),
                )
                .values
                .toList()),
        const Gap(10),
        Text("Click the Share button above to add new members.",
            style: TextStyle(color: theme.colorScheme.secondary))
      ],
    );
  }
}
