import 'package:areis/models/task_model.dart';
import 'package:areis/providers/new_project_provider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class AddTaskDropdown extends StatefulWidget {
  const AddTaskDropdown({super.key, required this.task});
  final Task task;

  @override
  State<AddTaskDropdown> createState() => _AddTaskDropdownState();
}

class _AddTaskDropdownState extends State<AddTaskDropdown> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return MenuAnchor(
      anchorTapClosesMenu: true,
      // key: Key(widget.index.toString()),
      style: MenuStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        backgroundColor:
            MaterialStateProperty.all(theme.colorScheme.onTertiary),
        elevation: MaterialStateProperty.all(0),
      ),
      menuChildren: [
        MenuItemButton(
            child: SizedBox(
          width: 125,
          child: Row(
            children: [
              Text(
                "Edit",
                style: theme.textTheme.headlineSmall!.copyWith(
                    color: theme.colorScheme.background, fontSize: 20),
              ),
              const Spacer(),
              Icon(
                Iconsax.edit,
                color: theme.colorScheme.background,
                size: 25,
              )
            ],
          ),
        )),
        Divider(
          height: 0,
          color: Colors.grey.shade400,
        ),
        MenuItemButton(
            child: InkWell(
          onTap: () =>
              context.read<NewProjectProvider>().removeTask(widget.task),
          child: SizedBox(
            width: 125,
            child: Row(
              children: [
                Text(
                  "Delete",
                  style: theme.textTheme.headlineSmall!
                      .copyWith(color: Colors.redAccent, fontSize: 20),
                ),
                const Spacer(),
                const Icon(
                  Iconsax.trash,
                  color: Colors.redAccent,
                  size: 25,
                )
              ],
            ),
          ),
        ))
      ],
      builder: (context, controller, child) => InkWell(
          onTap: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: const Icon(
            FluentIcons.more_vertical_32_filled,
            size: 20,
          )),
    );
  }
}
