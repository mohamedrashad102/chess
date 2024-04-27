import 'package:chess/screens/game_screen/game_screen.dart';
import 'package:chess/services/chess_services/chess_game/chess_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameInitial());

  static GameCubit instance(context) => BlocProvider.of<GameCubit>(context);

  late final ChessGame game;

  playGameWithFriend(context) {
    game = ChessGame();
    game.start();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GameScreen(),
      ),
    );
    emit(GameWithFriendState(blackName: 'Black', whiteName: 'White'));
  }

  playGameWithComputer(context) {
    game = ChessGame(withComputer: true);
    game.start();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GameScreen(),
      ),
    );
    emit(GameWithComputerState(playerName: 'Mohamed'));
  }

  playGameOverTheBoard(context) {
    game = ChessGame(withoutTime: true);
    game.start();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GameScreen(),
      ),
    );
    emit(GameOverTheBoardState());
  }
}
