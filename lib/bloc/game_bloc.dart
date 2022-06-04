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
    on<GetMatchResultsEvent>(_getMatchResultHandler);
    on<ChangeMatchGuess>(_changeMatchGuessHandler);
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
    emit(InPlayState.fromState(state,
        newStatus: GameStatus.inProgress, clear: true));
    final int randomIndex = _random.nextInt(_matches.length);
    if (_matches.isEmpty) {
      emit(EndPlayState(
          message: "No More Matches Now",
          match: (state as InPlayState).match!,
          matchesNumber: (state as InPlayState).matchesNumber,
          currentScore: (state as InPlayState).currentScore,
          maxScore: state.maxScore,
          status: GameStatus.finished));
    } else {
      emit(InPlayState.fromState(
        state,
        newStatus: GameStatus.startPlay,
        match: _matches[randomIndex],
      ));
    }
  }

  _getMatchResultHandler(GetMatchResultsEvent event, Emitter emit) {
    if (state is InPlayState) {
      InPlayState oldState = state as InPlayState;
      if (oldState.check) {
        emit(InPlayState.fromState(state,
            newStatus: GameStatus.finished,
            score: oldState.currentScore + 100,
            newMax: oldState.newMax,
            matches: oldState.matchesNumber + 1));
        add(const LoadMatchEvent());
      } else {
        int errors = oldState.errorsNumber - 1;
        if (errors == -1) {
          emit(EndPlayState(
              message: "No More Matches Lives",
              match: (state as InPlayState).match!,
              matchesNumber: (state as InPlayState).matchesNumber,
              currentScore: (state as InPlayState).currentScore,
              maxScore: oldState.maxScore,
              status: GameStatus.error));
        } else {
          emit(InPlayState.fromState(
            state,
            newStatus: GameStatus.error,
            matches: oldState.matchesNumber + 1,
            errors: errors,
          ));
          add(const LoadMatchEvent());
        }
      }
    }
  }

  _changeMatchGuessHandler(ChangeMatchGuess event, Emitter emit) {
    if (state is InPlayState) {
      if ((state as InPlayState).team1Guess == null) {
        emit(InPlayState.fromState(state,
            newStatus: GameStatus.idle, guess1: event.guess));
      } else {
        emit(InPlayState.fromState(state,
            newStatus: GameStatus.idle, guess2: event.guess));
        add(const GetMatchResultsEvent());
      }
    }
  }
}
