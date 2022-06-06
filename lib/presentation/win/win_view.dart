import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportwin_predictor/bloc/game_bloc.dart';
import '../resources/route_manager.dart';
import '../shared/app_button.dart';
import '../shared/score_app_bar.dart';
import 'widgets/show_match_container_win.dart';

class WinScreen extends StatefulWidget {
  const WinScreen({Key? key}) : super(key: key);

  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  void _goToThePlayGame() async {
    await Future.delayed(const Duration(seconds: 5), () {
      context.read<GameBloc>().add(const LoadMatchEvent());
      Navigator.pushNamed(context, Routes.roundOneRoute);
    });
  }

  @override
  void initState() {
    super.initState();
    _goToThePlayGame();
  }

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
            numberOfRound: state.matchesNumber -1 ,
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
        const Expanded(
          flex: 3,
          child: SizedBox(
            height: 100,
          ),
        ),
      ]),
    ));
  }
}
