import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportwin_predictor/presentation/resources/color_manager.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';
import 'package:sportwin_predictor/presentation/shared/guess_card.dart';

import '../../../bloc/game_bloc.dart';
import '../../../data/models/match.dart';
import '../../shared/errored_image.dart';

class ShowMatchContainer extends StatelessWidget {
  final MatchModel match;
  const ShowMatchContainer(this.match, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorManger.kSecondary,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: SizeManager.s18),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    match.team1,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                const SizedBox(
                  height: SizeManager.s4,
                ),
                SizedBox(
                  width: SizeManager.s55,
                  child: MatchIcon(
                    match.team1ImageUrl,
                  ),
                ),
                const SizedBox(
                  height: SizeManager.s25,
                ),
                Builder(
                  builder: (context) {
                    GameState state = context.read<GameBloc>().state;
                    if (state is InPlayState) {
                      return GuessCard(
                        number: state.team1Guess?.toString(),
                      );
                    }
                    return const GuessCard(
                      number: null,
                    );
                  },
                ),
                const SizedBox(height: SizeManager.s18),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: SizeManager.s18),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    match.team2,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                const SizedBox(
                  height: SizeManager.s4,
                ),
                SizedBox(
                  width: SizeManager.s55,
                  child: MatchIcon(
                    match.team2ImageUrl,
                  ),
                ),
                const SizedBox(
                  height: SizeManager.s25,
                ),
                Builder(
                  builder: (context) {
                    GameState state = context.read<GameBloc>().state;
                    if (state is InPlayState) {
                      return GuessCard(
                        number: state.team2Guess?.toString(),
                      );
                    }
                    return const GuessCard(
                      number: null,
                    );
                  },
                ),
                const SizedBox(height: SizeManager.s18),
              ],
            ),
          )
        ],
      ),
    );
  }
}
