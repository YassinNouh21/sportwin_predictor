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
    bool clear = false,
  }) {
    if (state is InPlayState) {
      return InPlayState(
          match: match ?? state.match,
          matchesNumber: matches ?? state.matchesNumber,
          errorsNumber: errors ?? state.errorsNumber,
          status: newStatus ?? state.status,
          team1Guess: clear ? null : (guess1 ?? state.team1Guess),
          team2Guess: clear ? null : (guess2 ?? state.team2Guess),
          maxScore: newMax ?? state.maxScore,
          currentScore: score ?? state.currentScore);
    } else {
      return InPlayState(
          match: match,
          matchesNumber: 1,
          currentScore: 0,
          errorsNumber: 3,
          status: newStatus ?? state.status,
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
  final int? guess1;
  final int? guess2;

  const EndPlayState({
    required this.message,
    this.guess1,
    this.guess2,
    required int maxScore,
    GameStatus status = GameStatus.inProgress,
  }) : super(status, maxScore);

  @override
  List<Object> get props => [status, message];
}
