import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: "Fixel",
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(fontFamily: "Fixel", fontSize: 16),
    //   displayLarge: TextStyle(
    //       fontFamily: "Fixel", fontSize: 32, fontWeight: FontWeight.bold),
    //   titleLarge: TextStyle(
    //       fontFamily: "Fixel", fontSize: 22, fontWeight: FontWeight.w500),
    //   headlineLarge: TextStyle(
    //       fontFamily: "Fixel", fontSize: 32, fontWeight: FontWeight.bold),
    //   headlineMedium: TextStyle(
    //       fontFamily: "Fixel", fontSize: 28, fontWeight: FontWeight.w600),
    //   headlineSmall: TextStyle(
    //       fontFamily: "Fixel", fontSize: 24, fontWeight: FontWeight.w500),
    // ),
    colorScheme: const ColorScheme(
        background: Color(0xfff3f3f3),
        primary: Color(0xfff15946),
        onPrimary: Color(0xffffffff),
        secondary: Color(0xff575757),
        onSecondary: Color(0xffffffff),
        brightness: Brightness.light,
        onBackground: Color(0xff0C090D),
        surface: Color(0xffffffff),
        onSurface: Color(0xff000000),
        error: Color(0xffe5989b),
        tertiary: Color(0xffffffff),
        onTertiary: Color(0xff181818),
        onError: Color(0xff212529)));

ThemeData darkTheme = ThemeData(
    fontFamily: "Fixel",
    // textTheme: const TextTheme(
    //   bodyLarge: TextStyle(fontFamily: "Fixel", fontSize: 16),
    //   displayLarge: TextStyle(
    //       fontFamily: "Fixel", fontSize: 32, fontWeight: FontWeight.bold),
    //   titleLarge: TextStyle(
    //       fontFamily: "Fixel", fontSize: 22, fontWeight: FontWeight.w500),
    //   headlineLarge: TextStyle(
    //       fontFamily: "Fixel", fontSize: 32, fontWeight: FontWeight.bold),
    //   headlineMedium: TextStyle(
    //       fontFamily: "Fixel", fontSize: 28, fontWeight: FontWeight.w600),
    //   headlineSmall: TextStyle(
    //       fontFamily: "Fixel", fontSize: 24, fontWeight: FontWeight.w500),
    // ),
    colorScheme: const ColorScheme(
        background: Color(0xff000000),
        primary: Color(0xfff15946),
        onPrimary: Color(0xff000000),
        secondary: Color(0xff8e8e8e),
        onSecondary: Color(0xff575757),
        brightness: Brightness.dark,
        tertiary: Color(0xff000000),
        onTertiary: Color(0xfff0f0f0),
        onBackground: Color(0xffffffff),
        surface: Color(0xff121212),
        onSurface: Color(0xffffffff),
        error: Color(0xffe5989b),
        onError: Color(0xff212529)));
