import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage(
      {super.key,
      required this.header,
      required this.image,
      required this.description});
  final String header;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(image),
          ),
          const Gap(25),
          Center(
            child: Text(
              header,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineLarge!,
            ),
          ),
          const Gap(10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge!
                .copyWith(color: theme.colorScheme.secondary),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
