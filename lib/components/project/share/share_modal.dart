import 'package:areis/components/project/share/share_input.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ShareModal extends StatefulWidget {
  const ShareModal({super.key});

  @override
  State<ShareModal> createState() => _ShareModalState();
}

class _ShareModalState extends State<ShareModal> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 20),
      // height: 200,
      decoration: BoxDecoration(
          color: isDarkMode
              ? theme.colorScheme.tertiary
              : theme.colorScheme.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
            child: Container(
          width: 50,
          height: 4,
          decoration: BoxDecoration(
              color: Colors.grey.shade600,
              borderRadius: BorderRadius.circular(999)),
        )),
        const Gap(30),
        Text(
          "Share",
          style: theme.textTheme.titleLarge,
        ),
        const Gap(20),
        const ShareInput()
      ]),
    );
  }
}
