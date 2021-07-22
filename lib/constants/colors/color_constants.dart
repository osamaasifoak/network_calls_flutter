import 'package:flutter/material.dart';

class ColorConstants {
  static const primary = const Color(0xffFF017B);
  static const feedBody = const Color(0xffF2F2F4);
  static const IndicationBottom = const Color(0xffDED500);
  static const VeryLightGrey = const Color(0xffF8F8F8);
  static const lightGrey = const Color(0xffE2E2E2);
  static const mediumGrey = const Color(0xffBDC2D0);
  static const black = const Color(0xff000000);
  static const white = const Color(0xffffffff);
  static const splashGradient = const [
    Color(0xffFF5858),
    Color(0xffF857A6),
  ];
  static MaterialColor kPrimaryColor = const MaterialColor(
    0xffFF017B,
    const <int, Color>{
      50: primary,
      100: primary,
      200: primary,
      300: primary,
      400: primary,
      500: primary,
      600: primary,
      700: primary,
      800: primary,
      900: primary,
    },
  );
}
