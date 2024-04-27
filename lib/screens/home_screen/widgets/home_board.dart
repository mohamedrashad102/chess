import 'package:chess/cubit/game_cubit/game_cubit.dart';
import 'package:flutter/material.dart';

import '../../../models/board.dart';
import '../../../models/position.dart';
import '../../../services/chess_services/chess_initial_board/chess_initial_board.dart';
import 'cell.dart';

class HomeBoard extends StatelessWidget {
  const HomeBoard({super.key});

  @override
  Widget build(BuildContext context) {
    Board board = ChessInitialBoard.instance();
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () {
          GameCubit.instance(context).playGameWithFriend(context);
        },
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
          ),
          itemBuilder: (context, index) {
            var pos = Position.formIndex(index);
            return Cell(
              piece: board.getPiece(pos),
              isWhite: _isWhite(index),
            );
          },
          itemCount: 8 * 8,
        ),
      ),
    );
  }

  bool _isWhite(int index) {
    int row = index ~/ 8;
    int column = index % 8;
    bool isWhite = (row + column) % 2 == 0;
    return isWhite;
  }
}
