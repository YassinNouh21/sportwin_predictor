import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/game_bloc.dart';
import '../shared/score_app_bar.dart';
import 'widgets/show_match_conatiner_lose.dart';

// TODO priority 1 you have to start implementing this screen 1
class LoseScreen extends StatelessWidget {
  const LoseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InPlayState state = (context.read<GameBloc>().state as InPlayState);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
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
              child: ShowMatchContainerLose(state.match!),
            ),
            const Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
