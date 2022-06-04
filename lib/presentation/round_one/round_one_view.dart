import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';
import 'package:sportwin_predictor/presentation/round_one/widgets/show_match_container.dart';
import 'package:sportwin_predictor/presentation/shared/card_grid.dart';

import '../../bloc/game_bloc.dart';
import '../resources/route_manager.dart';
import '../shared/score_app_bar.dart';

class RoundOneScreen extends StatelessWidget {
  const RoundOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () => _choiceDialog(context),
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
                  listener: (context, state) {
                    // if (state is InPlayState &&
                    //     state.status == GameStatus.startPlay &&
                    //     state.matchesNumber > 1) {
                    //   Navigator.pushReplacementNamed(
                    //       context, Routes.roundOneRoute);
                    // }
                    // else
                    if (state is EndPlayState &&
                        state.status == GameStatus.error) {
                      Navigator.pushReplacementNamed(
                          context, Routes.gameOverRoute);
                    } else if (state is InPlayState &&
                        state.status == GameStatus.finished) {
                      Navigator.pushReplacementNamed(context, Routes.winRoute);
                    } else if (state is InPlayState &&
                        state.status == GameStatus.error) {
                      Navigator.pushReplacementNamed(context, Routes.loseRoute);
                    }
                  },
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
                              timer: true,
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
      ),
    );
  }

  Future<bool> _choiceDialog(BuildContext context) async {
    return await (showDialog<bool>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text("Warning"),
                  content: const Text("Are you shure you want to leave"),
                  actions: <Widget>[
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "No",
                          style: TextStyle(color: Colors.green),
                        )),
                    OutlinedButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Yes",
                          style: TextStyle(color: Colors.red),
                        )),
                  ],
                ))) ??
        false;
  }
}
