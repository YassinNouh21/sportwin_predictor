part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends GameEvent {
  const InitialEvent();
  @override
  List<Object> get props => [0];
}

class StartGameEvent extends GameEvent {
  const StartGameEvent();
  @override
  List<Object> get props => [1];
}

class LoadMatchEvent extends GameEvent {
  const LoadMatchEvent();
}

class ChangeMatchGuess extends GameEvent {
  final int guess;
  const ChangeMatchGuess(this.guess);
}

class GetMatchResultsEvent extends GameEvent {
  const GetMatchResultsEvent();
}
