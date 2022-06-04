import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/play/widgets/timer_indicator.dart';
import 'package:sportwin_predictor/presentation/round_one/widgets/coin_win_indicator.dart';
import 'package:sportwin_predictor/presentation/round_one/widgets/round_indicator.dart';

class ScoreAppBar extends StatelessWidget {
  final int leftTime;
  final int rightTime;
  final int numberOfRound;
  final int score;
  const ScoreAppBar({
    Key? key,
    required this.leftTime,
    required this.rightTime,
    required this.numberOfRound,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TimerIndicator(left: leftTime, right: rightTime),
        RoundIndicator(numberOfRound: numberOfRound),
        CoinWinIndicator(
          score: score,
        ),
      ],
    );
  }
}
