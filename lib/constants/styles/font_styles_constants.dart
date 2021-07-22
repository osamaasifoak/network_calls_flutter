import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_network_calls/constants/strings/font_family_constants.dart';

class FontStylesConstants {
  /// AbrilFatface with default font size of 12 and font weight normal / plain / regular
  static TextStyle abrilFatface(
          {Color? color,
          double letterSpacing = 0.0,
          double fontSize = 12.0,
          FontWeight fontWeight = FontWeight.w400}) =>
      GoogleFonts.abrilFatface(
          color: color,
          fontWeight: fontWeight,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
          fontSize: fontSize);

  /// inter with default font size of 12 and font weight normal / plain / regular
  static TextStyle inter(
          {Color? color,
          double letterSpacing = 0.0,
          double fontSize = 12.0,
          FontWeight fontWeight = FontWeight.w400,
          double height = 1}) =>
      GoogleFonts.inter(
          color: color,
          fontWeight: fontWeight,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          height: height);

  /// proximaNova with default font size of 12 and font weight normal / plain / regular
  static TextStyle serifPro(
          {Color? color,
          double letterSpacing = 0.0,
          double fontSize = 12.0,
          FontWeight fontWeight = FontWeight.w400,
          double height = 1}) =>
      GoogleFonts.sourceSerifPro(
          color: color,
          fontWeight: fontWeight,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          height: height);

  /// proximaNova with default font size of 12 and font weight normal / plain / regular
  static TextStyle proximaNova(
          {Color? color,
          double letterSpacing = 0.0,
          double fontSize = 12.0,
          FontWeight fontWeight = FontWeight.w400,
          double height = 1}) =>
      TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          height: height,
          fontFamily: FontFamilyConstants.ProximaNova);

  /// drukWide with default font size of 12 and font weight normal / plain / regular
  static TextStyle drukWide(
          {Color? color,
          double letterSpacing = 0.0,
          double fontSize = 12.0,
          FontWeight fontWeight = FontWeight.w400,
          double height = 1}) =>
      TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
          fontSize: fontSize,
          height: height,
          fontFamily: FontFamilyConstants.drukWide);
}
