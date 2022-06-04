import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sportwin_predictor/presentation/resources/assets_manager.dart';
import 'package:sportwin_predictor/presentation/resources/color_manager.dart';
import 'package:sportwin_predictor/presentation/resources/size_manager.dart';

import '../../../bloc/game_bloc.dart';
import '../../resources/route_manager.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: ColorManger.kplayButton,
        shape: const CircleBorder(),
      ),
      child: IconButton(
        iconSize: SizeManager.s90,
        splashRadius: SizeManager.s60,
        icon: BlocConsumer<GameBloc, GameState>(
          buildWhen: (_, state) => state is StartPlayState,
          listenWhen: (_, state) => state is StartPlayState,
          listener: (context, state) {
            if (state is StartPlayState) {
              if (state.status == GameStatus.finished) {
                Navigator.pushNamed(context, Routes.roundOneRoute);
              } else if (state.status == GameStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text(state.errorMessage ?? "Undefined error happened"),
                ));
              }
            }
          },
          builder: (context, state) {
            return state.status == GameStatus.inProgress
                ? const CircularProgressIndicator()
                : Image.asset(
                    AssetsManager.play,
                    alignment: Alignment.centerLeft,
                    height: SizeManager.s45,
                  );
          },
        ),
        onPressed: () {
          context.read<GameBloc>().add(const StartGameEvent());
        },
      ),
    );
  }
}
