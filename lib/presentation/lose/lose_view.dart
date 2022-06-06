import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/game_bloc.dart';
import '../resources/route_manager.dart';
import '../shared/app_button.dart';
import '../shared/score_app_bar.dart';
import 'widgets/show_match_conatiner_lose.dart';

// TODO priority 1 you have to start implementing this screen 1
class LoseScreen extends StatefulWidget {
  const LoseScreen({Key? key}) : super(key: key);

  @override
  State<LoseScreen> createState() => _LoseScreenState();
}

class _LoseScreenState extends State<LoseScreen> {
  void _navigateToThePlayScreen() async {
    await Future.delayed(const Duration(seconds: 3), () {
      context.read<GameBloc>().add(const LoadMatchEvent());
      Navigator.pushNamed(context, Routes.roundOneRoute);
    });
  }

  @override
  void initState() {
    _navigateToThePlayScreen();
    super.initState();
  }

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
              child: ShowMatchContainerLose(state.match!),
            ),
            const Expanded(
              flex: 3,
              child: SizedBox(
                height: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
