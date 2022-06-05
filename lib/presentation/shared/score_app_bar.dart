import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportwin_predictor/bloc/game_bloc.dart';
import 'package:sportwin_predictor/presentation/play/widgets/timer_indicator.dart';
import 'package:sportwin_predictor/presentation/round_one/widgets/coin_win_indicator.dart';
import 'package:sportwin_predictor/presentation/round_one/widgets/round_indicator.dart';

class ScoreAppBar extends StatefulWidget {
  final int numberOfRound;
  final int score;
  final bool timer;
  const ScoreAppBar({
    Key? key,
    required this.timer,
    required this.numberOfRound,
    required this.score,
  }) : super(key: key);

  @override
  State<ScoreAppBar> createState() => _ScoreAppBarState();
}

class _ScoreAppBarState extends State<ScoreAppBar> {
  Timer? _timer;
  int ticks = 15000;
  
  void _timerCounter() async {
    if (widget.timer) {
      await Future.delayed(const Duration(seconds: 5));
      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        ticks -= 100;
        if (ticks == 0) {
          context.read<GameBloc>().add(const GetMatchResultsEvent());
          _timer?.cancel();
        }
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _timerCounter();
  }

  @override
  dispose() {
    _timer?.cancel();
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
