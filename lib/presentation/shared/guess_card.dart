import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/resources/color_manager.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';

import '../resources/assets_manager.dart';

class GuessCard extends StatelessWidget {
  final String? number;
  const GuessCard({
    Key? key,
    this.number,
  }) : super(key: key);
  // FIXME (Issue #1):
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      width: SizeManager.s65,
      height: SizeManager.s65,
      decoration: BoxDecoration(
        color: ColorManger.kCardBackground,
        borderRadius: BorderRadius.circular(SizeManager.s8),
      ),
      child: number == null
          ? Image.asset(
              AssetsManager.questionMark,
              alignment: Alignment.center,
              height: SizeManager.s65,
            )
          : Text(
              number!,
              style: Theme.of(context).textTheme.headline6,
            ),
    );
  }
}
