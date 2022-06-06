part of 'game_bloc.dart';

enum GameStatus {
  idle,
  inProgress,
  startPlay,
  finished,
  error,
}

abstract class GameState extends Equatable {
  final int maxScore;
  final GameStatus status;
  const GameState(this.status, this.maxScore);

  @override
  List<Object> get props => [status, maxScore];
}

class GameInitialState extends GameState {
  const GameInitialState(
      {GameStatus status = GameStatus.idle, int maxScore = 0})
      : super(status, maxScore);
}

// ignore: must_be_immutable
class InPlayState extends GameState {
  final MatchModel? match;
  int? team1Guess;
  int? team2Guess;
  int matchesNumber;
  int errorsNumber;
  int currentScore;
  int roundScore;
  InPlayState({
    required this.match,
    required this.errorsNumber,
    required this.matchesNumber,
    required this.currentScore,
    this.team1Guess,
    this.team2Guess,
    required int maxScore,
    required this.roundScore,
    GameStatus status = GameStatus.inProgress,
  }) : super(status, maxScore);

  factory InPlayState.fromState(
    GameState state, {
    GameStatus? newStatus,
    MatchModel? match,
    int? guess1,
    int? guess2,
    int? matches,
    int? errors,
    int? newMax,
    int? score,
    int? roundScore,
    bool clear = false,
  }) {
    if (state is InPlayState) {
      return InPlayState(
          match: match ?? state.match,
          matchesNumber: matches ?? state.matchesNumber,
          errorsNumber: errors ?? state.errorsNumber,
          status: newStatus ?? GameStatus.idle,
          team1Guess: clear ? null : (guess1 ?? state.team1Guess),
          team2Guess: clear ? null : (guess2 ?? state.team2Guess),
          maxScore: newMax ?? state.maxScore,
          roundScore: roundScore ?? 0,
          currentScore: score ?? state.currentScore);
    } else {
      return InPlayState(
          match: match,
          matchesNumber: 1,
          currentScore: 0,
          errorsNumber: 3,
          status: newStatus ?? state.status,
          roundScore: 0,
          maxScore: state.maxScore);
    }
  }
  @override
  List<Object> get props => [
        match?.id ?? "0",
        team1Guess ?? -1,
        team2Guess ?? -1,
        status,
        currentScore,
        matchesNumber
      ];

  int get newMax => currentScore > maxScore ? currentScore : maxScore;
  bool get check => match!.checkResults(team1Guess, team2Guess);
  bool get checkOne => match!.checkResultOneRight(team1Guess, team2Guess);
}

class StartPlayState extends GameState {
  final String? errorMessage;

  const StartPlayState({
    this.errorMessage,
    required int maxScore,
    GameStatus status = GameStatus.inProgress,
  }) : super(status, maxScore);

  @override
  List<Object> get props => [status];
}

class EndPlayState extends GameState {
  final String message;
  final MatchModel match;
  final int matchesNumber;
  final int currentScore;

  EndPlayState({
    required this.message,
    required this.match,
    required this.matchesNumber,
    required this.currentScore,
    required int maxScore,
    GameStatus status = GameStatus.inProgress,
  }) : super(status, maxScore) {
    PreferenceRepository.putDataInSharedPreference(
        value: maxScore, key: PreferenceKey.maxScore);
  }

  @override
  List<Object> get props => [status, message];
}
