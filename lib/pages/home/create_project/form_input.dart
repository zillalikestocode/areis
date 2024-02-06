import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FormInput extends StatefulWidget {
  const FormInput(
      {super.key,
      required this.controller,
      required this.label,
      required this.lines,
      required this.modal});

  final TextEditingController controller;
  final String label;
  final int lines;
  final bool modal;

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  @override
  Widget build(BuildContext context) {
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    ThemeData theme = Theme.of(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const Gap(2.5),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.modal && isDarkMode
                      ? Colors.grey.shade900
                      : theme.colorScheme.surface),
              child: TextField(
                controller: widget.controller,
                minLines: widget.lines,
                maxLines: widget.lines,
                decoration: const InputDecoration(border: InputBorder.none),
              ))
        ]);
  }
}
