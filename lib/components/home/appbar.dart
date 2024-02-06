// import 'package:areis/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
          decoration: BoxDecoration(
              color: theme.colorScheme.tertiary,
              borderRadius: BorderRadius.circular(999)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(
                    Iconsax.menu_1,
                    size: 25,
                  )),
              const Gap(5),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search Aries",
                      border: InputBorder.none,
                      hintStyle: theme.textTheme.bodyLarge!.copyWith(
                          color: theme.colorScheme.secondary,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    image:
                        DecorationImage(image: NetworkImage(user!.photoURL!)),
                    borderRadius: BorderRadius.circular(999)),
              )
            ],
          )),
    );
  }
}
