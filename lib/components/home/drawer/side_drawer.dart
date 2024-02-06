import 'package:areis/components/home/drawer/drawer_item.dart';
import 'package:areis/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService();

    final List<Widget> drawerItems = [
      const DrawerItem(
        title: "Home",
        icon: Iconsax.home,
        route: "/",
      ),
      const DrawerItem(
        title: "All Projects",
        icon: Iconsax.calendar_2,
        route: "/projects",
      ),
      const DrawerItem(
          title: "Settings", icon: Iconsax.setting, route: "/settings"),
    ];

    User? user = FirebaseAuth.instance.currentUser;
    ThemeData theme = Theme.of(context);

    return Drawer(
      shape: const BeveledRectangleBorder(),
      elevation: 0,
      backgroundColor: theme.colorScheme.background,
      child: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.secondary,
                      image:
                          DecorationImage(image: NetworkImage(user!.photoURL!)),
                      borderRadius: BorderRadius.circular(999)),
                ),
                const Gap(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.displayName!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    const InkWell(
                      child: Text(
                        "View Profile",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            thickness: 0.25,
            color: Colors.grey.shade400,
          ),
          ListView.separated(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              itemBuilder: (context, index) => drawerItems[index],
              separatorBuilder: (_, index) => const Gap(30),
              itemCount: 3),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                auth.signOut();
              },
              child: const Row(children: [
                Icon(
                  Iconsax.logout,
                  color: Color(0xffff0000),
                  size: 30,
                ),
                Gap(20),
                Text(
                  "Log Out",
                  style: TextStyle(
                      color: Color(0xffff0000),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
