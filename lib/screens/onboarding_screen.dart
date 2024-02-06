import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:areis/components/onboarding/dot_navigation.dart';
import 'package:areis/pages/onboarding_page.dart';
import 'package:areis/providers/onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "AREIS",
                    style: theme.textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => context.read<Onboarding>().skipPages(context),
                    child: Text(
                      "Skip",
                      style: theme.textTheme.headlineMedium!.copyWith(
                          color: theme.colorScheme.secondary, fontSize: 18),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: PageView(
                  onPageChanged: context.read<Onboarding>().onPageChange,
                  controller: context.watch<Onboarding>().pageController,
                  children: const [
                    OnboardingPage(
                      header: "Create your Team",
                      description:
                          'Set up your team effortlessly by inviting members and defining roles. Collaboration starts here!',
                      image: 'assets/images/prioritise.png',
                    ),
                    OnboardingPage(
                      header: "Initiate Projects",
                      description:
                          "Kick off your projects with clarity! Define goals, assign tasks, and watch your team's progress soar.",
                      image: 'assets/images/logic.png',
                    ),
                    OnboardingPage(
                      header: "Stay connected",
                      description:
                          "Seamless communication is key. Utilize our integrated chat and notifications to keep everyone in the loop.",
                      image: 'assets/images/goals.png',
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const OnboardingDotNavigation(),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => context.read<Onboarding>().nextPage(context),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: theme.colorScheme.primary),
                      child: Row(
                        children: [
                          Visibility(
                            visible:
                                context.watch<Onboarding>().currentPageIndex ==
                                    2,
                            child: TweenAnimationBuilder(
                              tween: Tween<double>(begin: 0, end: 1),
                              duration: const Duration(milliseconds: 200),
                              child: Text(
                                "Get Started",
                                textWidthBasis: TextWidthBasis.parent,
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: theme.textTheme.headlineSmall!.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                  fontSize: 20,
                                  height: 0.7,
                                ),
                              ),
                              builder: (context, val, child) =>
                                  SizedBox(width: val * 120, child: child),
                            ),
                          ),
                          Icon(
                            FontAwesomeIcons.chevronRight,
                            color: theme.colorScheme.onPrimary,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
