import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  navigateTo(String routeName) {
    navigatorKey.currentState!.pushNamed(routeName);
  }

  goBack() {
    navigatorKey.currentState!.pop();
  }

  pushNamedAndRemoveUntil(String routeName) {
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> route) => false);
  }
}
