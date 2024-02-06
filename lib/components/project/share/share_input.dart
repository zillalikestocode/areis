import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ShareInput extends StatefulWidget {
  const ShareInput({super.key});

  @override
  State<ShareInput> createState() => _ShareInputState();
}

class _ShareInputState extends State<ShareInput> {
  @override
  Widget build(BuildContext context) {
    TextEditingController searchEmailController = TextEditingController();
    ThemeData theme = Theme.of(context);
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isDarkMode
                  ? Colors.grey.shade900
                  : theme.colorScheme.tertiary),
          child: TextField(
            controller: searchEmailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration.collapsed(hintText: "Email"),
            style: const TextStyle(fontSize: 20),
          ),
        ),
        const Gap(10),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: theme.colorScheme.primary),
            child: const Center(
              child: Text(
                "Share",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        )
      ],
    );
  }
}
