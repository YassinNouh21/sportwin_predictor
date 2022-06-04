import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/resources/color_manager.dart';
import 'package:sportwin_predictor/presentation/resources/font_manager.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';

ThemeData getApplicationTheme(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: ColorManger.kStarDisabled,
    buttonTheme: ButtonThemeData(buttonColor: ColorManger.kplayButton),
    textTheme: TextTheme(
      headline6: getTextStyle(32, FontWeight.w900, Colors.white, 1.5),
      headline5: getTextStyle(24, FontWeight.w900, Colors.white, 1.5),
      headline4: getTextStyle(32, FontWeight.w900, Colors.white, 1.7),
      bodyText1: getTextStyle(16, FontWeight.w900, Colors.white, 1),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
            const BorderSide(width: 2, color: Colors.white)),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
          return RoundedRectangleBorder(borderRadius: BorderRadius.circular(3));
        }),
        fixedSize: MaterialStateProperty.all(const Size(200, 45)),
        alignment: Alignment.center,
        padding: MaterialStateProperty.all(
            const EdgeInsets.only(bottom: SizeManager.s1_5)),
        textStyle: MaterialStateProperty.all(
          Theme.of(context).textTheme.headline5,
        ),
      ),
    ),
  );
}
