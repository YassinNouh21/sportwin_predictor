import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/resources/assets_manager.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';

// TODO add gradient to the text of
class WinIndicator extends StatelessWidget {
  final int round;
  final int score;

  WinIndicator({
    Key? key,
    this.round = 0,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: double.infinity),
        Text(
          'That’s right!',
          style: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.yellowAccent),
        ),
        const SizedBox(
          height: SizeManager.s4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '+${score.toString()}',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white),
            ),
            const SizedBox(
              width: SizeManager.s8,
            ),
            Image.asset(
              AssetsManager.dollar,
              width: SizeManager.s25,
              fit: BoxFit.cover,
            ),
          ],
        )
      ],
    );
  }
}
