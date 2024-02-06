import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.route});

  final String title;
  final IconData icon;
  final String route;

  @override
  Widget build(BuildContext context) {
    String? currentRoute = ModalRoute.of(context)?.settings.name;
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      child: Row(
        children: [
          Row(
            children: [
              Icon(icon,
                  size: 30,
                  // weight: 10,
                  color: route == currentRoute
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onBackground),
              const Gap(20),
              Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: route == currentRoute
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onBackground),
              )
            ],
          )
        ],
      ),
    );
  }
}
