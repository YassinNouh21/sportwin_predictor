//TODO: don't forget to add extension of this class to handle HexColor
import 'package:flutter/material.dart';

class ColorManger {
  static Color kPrimary = HexColor.fromHex("#323232");
  static Color kSecondary = HexColor.fromHex("4E4E4E");
  static Color kplayButton = HexColor.fromHex("#474747");
  static Color kWhite = Colors.white;
  static Color kCardBackground = HexColor.fromHex("858585");
  static Color kHeartEnabled = HexColor.fromHex("F44336");
  static Color kHeartDisabled = HexColor.fromHex("BABABA");
  static Color kStarDisabled = HexColor.fromHex("242424");
  static Color kDialogBackgound = HexColor.fromHex("242424");
}

class LinearGradientManager {
  static LinearGradient yellow = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      HexColor.fromHex('FFDB2D'),
      HexColor.fromHex('F8BA00'),
    ],
  );
  static LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      HexColor.fromHex('474747'),
      HexColor.fromHex('#242424'),
    ],
  );

  static LinearGradient loseTextGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      HexColor.fromHex('FF0000'),
      HexColor.fromHex('ED0000'),
    ],
  );
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    //* * to check the opacity of the color
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString;
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
