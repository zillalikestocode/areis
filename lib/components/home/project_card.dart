import 'package:areis/models/project_model.dart';
import 'package:areis/pages/chat_page.dart';
import 'package:areis/pages/project/project_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:math' as math;

class ProjectCard extends StatelessWidget {
  const ProjectCard(
      {super.key,
      required this.name,
      required this.progress,
      required this.id,
      required this.members});

  final String name;
  final double progress;
  final String id;
  final List<Member> members;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Row(
              children: [
                const InkWell(
                  child: Icon(Iconsax.link_2),
                ),
                const Gap(10),
                InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const ChatPage())),
                    child: Badge(
                        textColor: Colors.redAccent,
                        backgroundColor: Colors.redAccent,
                        textStyle: TextStyle(fontSize: 12),
                        label: Text(
                          "7",
                        ),
                        child: const Icon(Iconsax.message))),
                const Gap(10),
                InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ProjectPage(id: id))),
                    child: Transform.rotate(
                        angle: -45 * math.pi / 180,
                        child: const Icon(Iconsax.arrow_right_1))),
              ],
            )
          ],
        ),
        const Gap(20),
        Row(
          children: [
            Stack(
                children: List.generate(
                        members.length >= 4 ? 4 : members.length, (_) => [])
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
                                    color: theme.colorScheme.surface,
                                    width: 1.5),
                                borderRadius: BorderRadius.circular(999),
                                color: theme.colorScheme.primary),
                          )),
                    )
                    .values
                    .toList()),
            Visibility(
              visible: members.length > 4,
              child: DottedBorder(
                borderType: BorderType.Circle,
                // padding: const EdgeInsets.all(10),
                color: theme.colorScheme.primary,
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Center(
                    child: Text("+${members.length - 4}",
                        style: TextStyle(
                            color: theme.colorScheme.primary, fontSize: 12)),
                  ),
                ),
              ),
            )
          ],
        ),
        const Gap(10),
        Row(
          children: [
            Expanded(
              child: LinearPercentIndicator(
                progressColor: theme.colorScheme.primary,
                animation: true,
                percent: progress,
                barRadius: const Radius.circular(999),
                lineHeight: 10,
                backgroundColor: theme.colorScheme.background,
              ),
            ),
            Text("${(progress * 100).toInt()}%")
          ],
        ),
        // const Gap(10),
        // const Row(
        //   children: [Spacer(), Icon(Iconsax.message), Gap(5), Text("8")],
        // )
      ]),
    );
  }
}
