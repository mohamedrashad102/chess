abstract class GameState {}

class GameInitial extends GameState {}

class GameWithComputerState extends GameState {
  GameWithComputerState({required this.playerName});
  final String playerName;
  final String computerName = 'Computer';
}

class GameOverTheBoardState extends GameState {}

class GameWithFriendState extends GameState {
  final String whiteName;
  final String blackName;
  GameWithFriendState({
    required this.blackName,
    required this.whiteName,
  });
}
