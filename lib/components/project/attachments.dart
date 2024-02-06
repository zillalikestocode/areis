import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class Attachments extends StatefulWidget {
  const Attachments({super.key});

  @override
  State<Attachments> createState() => _AttachmentsState();
}

class _AttachmentsState extends State<Attachments> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Attachments",
              style: theme.textTheme.headlineSmall!
                  .copyWith(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                "Add Attachment",
                style: TextStyle(color: Colors.blueAccent),
              ),
            )
          ],
        ),
        const Gap(10),
        Attachment(
            uploader: "Bella", name: "Blueprint.pdf", date: DateTime.now())
      ],
    );
  }
}

class Attachment extends StatelessWidget {
  const Attachment(
      {super.key,
      required this.uploader,
      required this.name,
      required this.date});

  final String uploader;
  final String name;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            uploader,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          // const Gap(5),
          Text(
            date.toString(),
            style: TextStyle(color: theme.colorScheme.secondary),
          ),
          const Gap(5),
          Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: theme.colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Iconsax.document_1,
                    size: 20,
                  ),
                  const Gap(10),
                  Text(name),
                  const Gap(15),
                  const Icon(
                    Iconsax.import_1,
                    size: 20,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
