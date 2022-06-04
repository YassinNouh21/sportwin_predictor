import 'package:flutter/material.dart';
import 'package:sportwin_predictor/data/models/match.dart';
import '../shared/score_app_bar.dart';
import 'widgets/show_match_container_win.dart';

class WinScreen extends StatelessWidget {
  const WinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Expanded(
              flex: 1,
              child: ScoreAppBar(
                numberOfRound: 2,
                score: 100,
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
              child: ShowMatchContainerWin(MatchModel(
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
