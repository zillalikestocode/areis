import 'package:flutter/material.dart';
import 'package:areis/pages/authentication/login_page.dart';

class Onboarding with ChangeNotifier {
  int currentPageIndex = 0.abs();
  PageController pageController = PageController();

  void nextPage(context) {
    if (currentPageIndex == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOutCubic);
      notifyListeners();
    }
  }

  void skipPages(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
    notifyListeners();
  }

  void onPageChange(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  void onDotTap(int index) {
    currentPageIndex = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic);
  }

  void skipOnboarding() {}
}
