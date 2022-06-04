import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';
import 'package:sportwin_predictor/presentation/round_one/widgets/show_match_container.dart';
import 'package:sportwin_predictor/presentation/shared/card_grid.dart';

import '../../bloc/game_bloc.dart';
import '../shared/score_app_bar.dart';

class RoundOneScreen extends StatelessWidget {
  const RoundOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: SizeManager.s12, vertical: SizeManager.s4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocConsumer<GameBloc, GameState>(
                buildWhen: (_, state) => state is InPlayState,
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is InPlayState) {
                    if (state.status == GameStatus.inProgress) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Column(
                      children: [
                        Expanded(
                          flex: 0,
                          child: ScoreAppBar(
                            numberOfRound: state.matchesNumber,
                            score: state.currentScore,
                          ),
                        ),
                        const SizedBox(
                          height: SizeManager.s8,
                        ),
                        Flexible(
                          flex: 0,
                          child: ShowMatchContainer(state.match!),
                        ),
                      ],
                    );
                  }
                  return const Text("Something went wrong");
                },
              ),
              const SizedBox(
                height: SizeManager.s12,
              ),
              Expanded(
                child: CardGrid((guess) {
                  context.read<GameBloc>().add(ChangeMatchGuess(guess));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
