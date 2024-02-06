import 'package:areis/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:areis/components/authentication/email_section.dart';
import 'package:areis/components/authentication/login_providers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  final _authService = AuthService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _authService.handleInitialAuthenticationLink();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text:
                      "Login or create an account to access and utilize the full potential of ",
                  style: theme.textTheme.headlineMedium!.copyWith(
                    fontSize: 24,
                  ),
                  children: [
                    TextSpan(
                        text: "Areis.",
                        style: theme.textTheme.headlineMedium!.copyWith(
                            fontSize: 22, color: theme.colorScheme.primary))
                  ]),
            ),
            const Gap(10),
            Text(
              "Create your account to create, share and manage tasks from anywhere and anytime.",
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: theme.colorScheme.secondary),
              textAlign: TextAlign.center,
            ),
            const Gap(28),
            const LoginProviders(),
            const Gap(10),
            const EmailSection()
          ],
        ),
      )),
    );
  }
}
