import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        backgroundColor: theme.colorScheme.background,
        title: Row(
          children: [
            const Text(
              "Chat Room",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            GestureDetector(
              child: const Icon(
                Iconsax.sound,
                size: 30,
              ),
            ),
            const Gap(20),
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Iconsax.close_circle,
                size: 30,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "This is the beginning of your conversation",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.secondary),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                            color: theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(20)),
                        child: const TextField(
                            minLines: 1,
                            maxLines: 3,
                            decoration: InputDecoration(
                                hintText: "Type a message",
                                border: InputBorder.none)),
                      ),
                    ),
                    const Gap(10),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(999)),
                        child: Center(
                          child: Icon(
                            Iconsax.send_2,
                            color: theme.colorScheme.background,
                            size: 30,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
