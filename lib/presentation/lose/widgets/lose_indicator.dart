import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/resources/assets_manager.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';

// TODO add gradient to the text of
class LoseIndicator extends StatelessWidget {
  final int round;

  const LoseIndicator({
    Key? key,
    this.round = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: double.infinity),
        Text(
          'Wrong answer!',
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
                round <= 3 ? AssetsManager.heartDisabled : AssetsManager.heart,
              ),
            ),
            const SizedBox(
              width: SizeManager.s16,
            ),
            SizedBox(
              width: SizeManager.s32,
              height: SizeManager.s32,
              child: Image.asset(
                round <= 2 ? AssetsManager.heartDisabled : AssetsManager.heart,
              ),
            ),
            const SizedBox(
              width: SizeManager.s16,
            ),
            SizedBox(
              width: SizeManager.s32,
              height: SizeManager.s32,
              child: Image.asset(
                round <= 1 ? AssetsManager.heartDisabled : AssetsManager.heart,
              ),
            ),
          ],
        )
      ],
    );
  }
}
