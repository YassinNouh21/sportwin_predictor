import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';
import 'package:sportwin_predictor/presentation/round_one/widgets/show_match_container.dart';
import 'package:sportwin_predictor/presentation/shared/card_grid.dart';

import '../../data/models/match.dart';
import '../shared/score_app_bar.dart';

class RoundOneScreen extends StatelessWidget {
  const RoundOneScreen({Key? key}) : super(key: key);
// FIXME no responsive design with grid view
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
              const Expanded(
                flex: 0,
                child: ScoreAppBar(
                  leftTime: 15,
                  numberOfRound: 2,
                  rightTime: 30,
                  score: 100,
                ),
              ),
              const SizedBox(
                height: SizeManager.s8,
              ),
              Flexible(
                flex: 0,
                child: ShowMatchContainer(MatchModel(
                  id: '1',
                  dateTime: '',
                  team1: 'Team1',
                  team1Score: 2,
                  team2Score: 1,
                  team2: 'Team2',
                  team1ImageUrl:
                      'https://pngimg.com/uploads/fcb_logo/fcb_logo_PNG25.png',
                  team2ImageUrl:
                      'https://www.freepnglogos.com/uploads/logo-chelsea-png/logo-chelsea-chelsea-football-club-logo-0.png',
                )),
              ),
              const SizedBox(
                height: SizeManager.s12,
              ),
              Expanded(
                child: CardGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
