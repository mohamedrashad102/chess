import 'package:chess/cubit/game_cubit/game_cubit.dart';
import 'package:chess/cubit/game_cubit/game_state.dart';
import 'package:chess/screens/game_screen/widgets/game_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/piece.dart';
import 'widgets/player_name_and_time.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var gameCubit = GameCubit.instance(context);
    final game = gameCubit.game;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 10, 42),
      body: BlocConsumer<GameCubit, GameState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is GameWithFriendState) {
            return Column(
              children: [
                const Spacer(),
                PlayerNameAndTime(
                  playerName: state.blackName,
                  player: Player.black,
                  currentPlayer: game.moves.peek.currentPlayer,
                  whiteTime: game.whiteTime,
                  blackTime: game.blackTime,
                ),
                GameBoard(gameCubit.game),
                PlayerNameAndTime(
                  playerName: state.blackName,
                  player: Player.black,
                  currentPlayer: game.moves.peek.currentPlayer,
                  whiteTime: game.whiteTime,
                  blackTime: game.blackTime,
                ),
                const Spacer(),
              ],
            );
          } else if (state is GameWithComputerState) {
            return Column(
              children: [
                const Spacer(),
                PlayerNameAndTime(
                  playerName: state.computerName,
                  player: Player.black,
                  currentPlayer: game.moves.peek.currentPlayer,
                  whiteTime: game.whiteTime,
                  blackTime: game.blackTime,
                ),
                GameBoard(gameCubit.game),
                PlayerNameAndTime(
                  playerName: state.playerName,
                  player: Player.white,
                  currentPlayer: game.moves.peek.currentPlayer,
                  whiteTime: game.whiteTime,
                  blackTime: game.blackTime,
                ),
                const Spacer(),
              ],
            );
          } else if (state is GameOverTheBoardState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GameBoard(gameCubit.game),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
