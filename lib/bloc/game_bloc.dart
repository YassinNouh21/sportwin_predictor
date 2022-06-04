import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/models/match.dart';
import '../data/repositories/local/pref_repository.dart';
import '../data/repositories/web_services/api_repository.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameInitialState()) {
    on<InitialEvent>(_onInitialHandler);
    on<StartGameEvent>(_onStartGameHandler);
    on<LoadMatchEvent>(_onLoadMatchHandler);
    on<GetNextMatchEvent>(_getNextMatchHandler);
    on<GetMatchResultsEvent>(_getMatchResultHandler);
  }

  List<MatchModel> _matches = [];
  final Random _random = Random();
  final ApiRepository _webServices = ApiRepository();

  _onInitialHandler(InitialEvent event, Emitter emit) async {
    emit(const GameInitialState(status: GameStatus.inProgress));
    int maxScore = PreferenceRepository.getDataFromSharedPreference(
            key: PreferenceKey.maxScore) ??
        0;

    emit(GameInitialState(status: GameStatus.finished, maxScore: maxScore));
  }

  _onStartGameHandler(StartGameEvent event, Emitter emit) async {
    emit(StartPlayState(
        status: GameStatus.inProgress, maxScore: state.maxScore));
    try {
      if (_matches.isEmpty) {
        _matches = await _webServices.getMatches();
      }
      emit(StartPlayState(
          status: GameStatus.finished, maxScore: state.maxScore));
      add(const LoadMatchEvent());
    } on DioErrors catch (e) {
      emit(StartPlayState(
          errorMessage: e.message,
          status: GameStatus.error,
          maxScore: state.maxScore));
    }
  }

  _onLoadMatchHandler(LoadMatchEvent event, Emitter emit) {
    emit(InPlayState.fromState(state, GameStatus.inProgress));
    final int randomIndex = _random.nextInt(_matches.length);
    if (_matches.isEmpty) {
      int newMax = (state as InPlayState).currentScore > state.maxScore
          ? (state as InPlayState).currentScore
          : state.maxScore;
      emit(EndPlayState(
          message: "No More Matches Now",
          maxScore: newMax,
          status: GameStatus.error));
    } else {
      emit(InPlayState.fromState(
        state,
        GameStatus.finished,
        match: _matches[randomIndex],
      ));
    }
  }

  _getNextMatchHandler(GetNextMatchEvent event, Emitter emit) {}

  _getMatchResultHandler(GetMatchResultsEvent event, Emitter emit) {
    (state as InPlayState).matchesNumber++;
    if ((state as InPlayState).check) {
      (state as InPlayState).currentScore += 100;
    } else {
      (state as InPlayState).errorsNumber--;
      if ((state as InPlayState).errorsNumber < 0) {
        int newMax = (state as InPlayState).currentScore > state.maxScore
            ? (state as InPlayState).currentScore
            : state.maxScore;
        emit(EndPlayState(
            message: "Game Over",
            maxScore: newMax,
            status: GameStatus.finished));
      }
    }
  }
}
