import 'package:flutter/material.dart';
import 'package:sample_network_calls/constants/routes/route_constants.dart';
import 'package:sample_network_calls/screens/home_screen.dart';
import 'package:sample_network_calls/screens/splash_screen.dart';

onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case RouteConstants.splashScreen:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );
    case RouteConstants.homeScreen:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text("Invalid route"),
          ),
        ),
      );
  }
}
