import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportwin_predictor/bloc/game_bloc.dart';
import 'package:sportwin_predictor/data/models/match.dart';
import 'package:sportwin_predictor/presentation/resources/color_manager.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';
import 'package:sportwin_predictor/presentation/shared/guess_card.dart';
import 'package:sportwin_predictor/presentation/win/widgets/win_indicator.dart';

import '../../shared/errored_image.dart';

class ShowMatchContainerWin extends StatelessWidget {
  final MatchModel match;
  const ShowMatchContainerWin(this.match, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorManger.kSecondary,
      child: Column(
        children: [
          Row(
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
                    AutoSizeText(
                      match.team1,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5,
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
                    GuessCard(
                      number: match.team1Score.toString(),
                    ),
                    const SizedBox(height: SizeManager.s18),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: Container(
                  height: 150,
                  alignment: Alignment.center,
                  child: dateDisplayer(context),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: SizeManager.s18),
                    AutoSizeText(
                      match.team2,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5,
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
                    GuessCard(
                      number: match.team2Score.toString(),
                    ),
                    const SizedBox(height: SizeManager.s18),
                  ],
                ),
              )
            ],
          ),
          BlocBuilder<GameBloc, GameState>(
            builder: (context, state) {
              if (state is InPlayState) {
                return WinIndicator(round: 3, score: state.roundScore);
              }
              return WinIndicator(round: 0, score: 0);
            },
          ),
          const SizedBox(
            height: SizeManager.s14,
          ),
        ],
      ),
    );
  }

  Column dateDisplayer(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      AutoSizeText(
        match.dateTime,
        maxLines: 1,
        style: Theme.of(context).textTheme.headline5,
      ),
      const SizedBox(
        height: SizeManager.s12,
      ),
      Container(
        height: 10,
        width: 10,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
      const SizedBox(
        height: SizeManager.s12,
      ),
      Container(
        height: 10,
        width: 10,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      ),
    ]);
  }
}
