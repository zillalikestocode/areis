import 'package:areis/pages/authentication/login_page.dart';
import 'package:areis/providers/new_project_provider.dart';
// import 'package:areis/pages/project/project_page.dart';
import 'package:areis/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:areis/providers/onboarding.dart';
// import 'package:areis/screens/onboarding_screen.dart';
import 'package:areis/styles/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => FlutterNativeSplash.remove());

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Onboarding()),
    ChangeNotifierProvider(create: (_) => NewProjectProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: "/",
      routes: {
        "/": (context) => StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return const HomeScreen();
                } else {
                  return const LoginPage();
                }
              },
            )
      },
    );
  }
}
