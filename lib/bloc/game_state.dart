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
  final int? team1Guess;
  final int? team2Guess;
  int matchesNumber;
  int errorsNumber;
  int currentScore;

  InPlayState({
    required this.match,
    required this.errorsNumber,
    required this.matchesNumber,
    required this.currentScore,
    this.team1Guess,
    this.team2Guess,
    required int maxScore,
    GameStatus status = GameStatus.inProgress,
  }) : super(status, maxScore);

  factory InPlayState.fromState(GameState state, GameStatus newStatus,
      {MatchModel? match}) {
    if (state is InPlayState) {
      return InPlayState(
          match: match ?? state.match,
          matchesNumber: (state.matchesNumber),
          errorsNumber: (state.errorsNumber),
          status: newStatus,
          maxScore: state.maxScore,
          currentScore: state.currentScore);
    } else {
      return InPlayState(
          match: match,
          matchesNumber: 1,
          currentScore: 0,
          errorsNumber: 0,
          status: newStatus,
          maxScore: state.maxScore);
    }
  }
  @override
  List<Object> get props =>
      [match?.id ?? "0", team1Guess ?? -1, team2Guess ?? -1, status];

  bool get check => match!.checkResults(team1Guess, team2Guess);
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

  const EndPlayState({
    required this.message,
    required int maxScore,
    GameStatus status = GameStatus.inProgress,
  }) : super(status, maxScore);

  @override
  List<Object> get props => [status, message];
}
