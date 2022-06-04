import 'package:flutter/material.dart';
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
                    Text(
                      match.team1,
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
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(height: SizeManager.s18),
                    Text(
                      match.team2,
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
          const WinIndicator(round: 3, score: 100),
          const SizedBox(
            height: SizeManager.s14,
          ),
        ],
      ),
    );
  }
}
