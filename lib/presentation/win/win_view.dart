import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportwin_predictor/bloc/game_bloc.dart';
import '../resources/route_manager.dart';
import '../shared/app_button.dart';
import '../shared/score_app_bar.dart';
import 'widgets/show_match_container_win.dart';

class WinScreen extends StatelessWidget {
  const WinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InPlayState state = (context.read<GameBloc>().state as InPlayState);

    return SafeArea(
        child: Scaffold(
      body: Column(children: [
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
          child: ShowMatchContainerWin(state.match!),
        ),
        Expanded(
          flex: 3,
          child: BlocListener<GameBloc, GameState>(
            listener: (context, state) {
              if (state is InPlayState &&
                  state.status == GameStatus.startPlay &&
                  state.matchesNumber > 1) {
                Navigator.pushReplacementNamed(context, Routes.roundOneRoute);
              }
            },
            child: SizedBox(
              height: 100,
              child: AppButton(
                text: 'Continue',
                onPress: () {
                  context.read<GameBloc>().add(const LoadMatchEvent());
                },
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
