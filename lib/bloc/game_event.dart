part of 'game_bloc.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends GameEvent {
  const InitialEvent();
}

class StartGameEvent extends GameEvent {
  const StartGameEvent();
}

class LoadMatchEvent extends GameEvent {
  const LoadMatchEvent();
}

class GetMatchResultsEvent extends GameEvent {
  const GetMatchResultsEvent();
}

class GetNextMatchEvent extends GameEvent {
  const GetNextMatchEvent();
}
