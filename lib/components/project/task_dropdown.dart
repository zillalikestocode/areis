import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TaskDropdown extends StatefulWidget {
  const TaskDropdown({super.key, required this.index});

  final int index;

  @override
  State<TaskDropdown> createState() => _TaskDropdownState();
}

class _TaskDropdownState extends State<TaskDropdown> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return MenuAnchor(
      key: Key(widget.index.toString()),
      anchorTapClosesMenu: true,
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
                "Assign to",
                style: theme.textTheme.headlineSmall!.copyWith(
                    color: theme.colorScheme.background, fontSize: 20),
              ),
              const Spacer(),
              Icon(
                Iconsax.arrow_right_2,
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
