import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/resources/color_manager.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';

class AppBarButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  const AppBarButton(
      {Key? key, required this.iconPath, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: ColorManger.kplayButton,
        shape: const CircleBorder(),
      ),
      child: IconButton(
        iconSize: SizeManager.s32,
        color: ColorManger.kplayButton,
        icon: Image.asset(
          'assets/images/$iconPath.png',
          alignment: Alignment.center,
          fit: BoxFit.cover,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
