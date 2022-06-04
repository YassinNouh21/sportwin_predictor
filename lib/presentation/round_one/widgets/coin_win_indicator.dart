import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/resources/assets_manager.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';

class CoinWinIndicator extends StatelessWidget {
  final int score;
  const CoinWinIndicator({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$score',
          style: Theme.of(context).textTheme.headline5,
        ),
        const SizedBox(
          width: SizeManager.s12,
        ),
        SizedBox(
          width: SizeManager.s25,
          height: SizeManager.s25,
          child: Image.asset(AssetsManager.dollar, fit: BoxFit.cover),
        ),
      ],
    );
  }
}
