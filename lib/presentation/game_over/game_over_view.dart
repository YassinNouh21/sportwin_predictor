import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportwin_predictor/bloc/game_bloc.dart';
import 'package:sportwin_predictor/presentation/resources/route_manager.dart';

import '../shared/score_app_bar.dart';
import 'widgets/game_over_bottom.dart';
import 'widgets/show_match_container_game_over.dart';

// TODO priority 1 you have to start implementing this screen 1
class GameOverScreen extends StatelessWidget {
  const GameOverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EndPlayState state = (context.read<GameBloc>().state as EndPlayState);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 0,
              child: ScoreAppBar(
                timer: false,
                numberOfRound: state.matchesNumber,
                score: state.currentScore,
              ),
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
              ),
            ),
            Expanded(
              flex: 0,
              child: ShowMatchContainerGameOver(
                  (context.read<GameBloc>().state as EndPlayState).match),
            ),
            Expanded(
              flex: 3,
              child: GameOverBottom(
                onPressAgain: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.playRoute, (route) => false);
                },
                onPressMenu: () {},
                score: state.currentScore,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
