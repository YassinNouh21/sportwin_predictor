import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/play/widgets/timer_indicator.dart';
import 'package:sportwin_predictor/presentation/round_one/widgets/coin_win_indicator.dart';
import 'package:sportwin_predictor/presentation/round_one/widgets/round_indicator.dart';

class ScoreAppBar extends StatefulWidget {
  final int numberOfRound;
  final int score;
  const ScoreAppBar({
    Key? key,
    required this.numberOfRound,
    required this.score,
  }) : super(key: key);

  @override
  State<ScoreAppBar> createState() => _ScoreAppBarState();
}

class _ScoreAppBarState extends State<ScoreAppBar> {
  late Timer _timer;
  int ticks = 30000;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      ticks -= 100;
      if (ticks == 0) {
        _timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TimerIndicator(left: ticks ~/ 1000, right: (ticks % 1000) ~/ 10),
        RoundIndicator(numberOfRound: widget.numberOfRound),
        CoinWinIndicator(
          score: widget.score,
        ),
      ],
    );
  }
}
