import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/resources/assets_manager.dart';
import 'package:sportwin_predictor/presentation/resources/color_manager.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';
import 'package:sportwin_predictor/presentation/shared/app_button.dart';

class GameOverBottom extends StatelessWidget {
  final int score;
  final VoidCallback onPressAgain;
  final VoidCallback onPressMenu;

  const GameOverBottom(
      {Key? key,
      required this.score,
      required this.onPressAgain,
      required this.onPressMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Score: $score',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              width: SizeManager.s12,
            ),
            Image.asset(
              AssetsManager.dollar,
              width: SizeManager.s25,
              fit: BoxFit.cover,
            ),
          ],
        ),
        const SizedBox(
          height: SizeManager.s16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 5,
              child: AppButton(
                gradient: LinearGradientManager.buttonGradient,
                text: 'Again',
                onPress: onPressAgain,
              ),
            ),
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 5,
              child: AppButton(
                gradient: LinearGradientManager.buttonGradient,
                text: 'Menu',
                onPress: onPressMenu,
              ),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        )
      ],
    );
  }
}
