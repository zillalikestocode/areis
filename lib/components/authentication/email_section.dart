import 'package:areis/services/authentication_service.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class EmailSection extends StatelessWidget {
  const EmailSection({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    final authService = AuthService();

    ThemeData theme = Theme.of(context);

    return Form(
      // alignment: Alignment.topLeft,
      // width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: theme.textTheme.headlineMedium!.copyWith(fontSize: 18),
          ),
          const Gap(5),
          Container(
            decoration: BoxDecoration(
                color: theme.colorScheme.tertiary,
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                expands: false,
                decoration: InputDecoration(
                  hintText: "Enter email address",
                  hintStyle: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.secondary),
                  border: InputBorder.none,
                )),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () => {
              authService.sendAuthEmail(emailController.text)
              // Navigator.push(context,
              //   MaterialPageRoute(builder: (context) => const HomeScreen()))
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Proceed with Email",
                style: theme.textTheme.headlineSmall!
                    .copyWith(color: Colors.white, fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
