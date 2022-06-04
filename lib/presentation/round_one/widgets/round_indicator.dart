import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';

class RoundIndicator extends StatelessWidget {
  final int numberOfRound;
  const RoundIndicator({Key? key, this.numberOfRound = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeManager.s45,
      height: SizeManager.s45,
      padding: const EdgeInsets.only(bottom: SizeManager.s1_5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeManager.s4),
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          '$numberOfRound',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
