import 'package:areis/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginProviders extends StatelessWidget {
  const LoginProviders({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final authService = AuthService();
    return Column(
      children: [
        OutlinedButton(
            onPressed: () => authService.signInWithGoogle(),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: BorderSide(width: 0.7, color: theme.colorScheme.secondary),
            ).copyWith(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/google.svg'),
                const Gap(10),
                Text(
                  "Continue With Google",
                  style: theme.textTheme.headlineSmall!.copyWith(fontSize: 18),
                ),
              ],
            )),
        const Gap(12),
        Row(
          children: [
            Expanded(
              child: Divider(
                color: theme.colorScheme.secondary,
                thickness: 0.5,
              ),
            ),
            const Gap(10),
            Text(
              "or",
              style: theme.textTheme.headlineSmall!.copyWith(fontSize: 18),
            ),
            const Gap(10),
            Expanded(
              child: Divider(
                color: theme.colorScheme.secondary,
                thickness: 0.5,
              ),
            )
          ],
        ),
      ],
    );
  }
}
