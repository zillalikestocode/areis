import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:areis/providers/onboarding.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SmoothPageIndicator(
      onDotClicked: context.read<Onboarding>().onDotTap,
      count: 3,
      controller: context.watch<Onboarding>().pageController,
      effect: ExpandingDotsEffect(
          activeDotColor: theme.colorScheme.primary,
          dotHeight: 7,
          dotWidth: 20),
    );
  }
}
