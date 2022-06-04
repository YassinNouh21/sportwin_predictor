import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontNameManger {
  static String? inter = GoogleFonts.inter().fontFamily;
}

class FontWeightManager {
  static const FontWeight bold = FontWeight.w800;
  static const FontWeight extraBold = FontWeight.w900;
}

TextStyle getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, double height) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: FontNameManger.inter,
      color: color,
      fontWeight: fontWeight,
      height: height);
}
