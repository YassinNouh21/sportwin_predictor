import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/resources/assets_manager.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';

// TODO add gradient to the text of
class GameOverIndicator extends StatelessWidget {
  const GameOverIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: double.infinity),
        Text(
          'Game over!',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.red),
        ),
        const SizedBox(
          height: SizeManager.s4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: SizeManager.s32,
              height: SizeManager.s32,
              child: Image.asset(
                AssetsManager.heartDisabled,
              ),
            ),
            const SizedBox(
              width: SizeManager.s16,
            ),
            SizedBox(
              width: SizeManager.s32,
              height: SizeManager.s32,
              child: Image.asset(
                AssetsManager.heartDisabled,
              ),
            ),
            const SizedBox(
              width: SizeManager.s16,
            ),
            SizedBox(
              width: SizeManager.s32,
              height: SizeManager.s32,
              child: Image.asset(
                AssetsManager.heartDisabled,
              ),
            ),
          ],
        )
      ],
    );
  }
}
