import 'package:accordion/accordion.dart';
import 'package:areis/components/project/task_list_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Accordion(
        headerBackgroundColor: theme.colorScheme.background,
        contentBackgroundColor: theme.colorScheme.background,
        contentBorderColor: theme.colorScheme.background,
        contentHorizontalPadding: 0,
        contentVerticalPadding: 20,
        contentBorderWidth: 0,
        contentBorderRadius: 0,
        openAndCloseAnimation: false,
        headerBorderWidth: 0,
        rightIcon: const Icon(
          Iconsax.arrow_down_1,
          size: 30,
        ),
        headerBorderRadius: 0,
        accordionId: "task_list_accordion",
        paddingListHorizontal: 0,
        paddingListBottom: 0,
        disableScrolling: true,
        headerPadding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          AccordionSection(
            contentBackgroundColor: theme.colorScheme.background,
            contentVerticalPadding: 0,
            isOpen: true,
            header: Text(
              "Task List",
              style: theme.textTheme.headlineMedium!
                  .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            content: Container(
              padding: const EdgeInsets.only(top: 20),
              color: theme.colorScheme.background,
              width: MediaQuery.of(context).size.width,
              height: 140,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (_, index) => const Gap(20),
                shrinkWrap: true,
                itemBuilder: (context, index) => TaskListItem(
                  index: index + 1,
                  title: "Mid-Fidelity Wireframing",
                ),
              ),
            ),
          )
        ]);
  }
}
