import 'package:flutter/material.dart';
import '../../../components/square.dart';
import '../../../models/position.dart';
import '../../../models/stack_board.dart';
import '../../../services/chess_services/chess_game/chess_game.dart';

class GameBoard extends StatefulWidget {
  const GameBoard(this.game, {super.key});

  final ChessGame game;

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final StackBoard moves = widget.game.moves;
    return SizedBox(
      width: width,
      height: width + 40,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (context, index) {
          Position pos = Position(index ~/ 8, index % 8);
          return Square(
            index: index,
            currentBoardIndex: moves.length-1,
            board: widget.game.moves.peek,
            onTap: () => _onTap(moves, pos),
          );
        },
        itemCount: 8 * 8,
      ),
    );
  }

  _isWhite(int index) {
    int row = index ~/ 8;
    int column = index % 8;
    bool isWhite = (row + column) % 2 == 0;
    return isWhite;
  }

  _onTap(StackBoard moves, Position pos) {
    // if (game.winner == Player.none && game.currentIndex == moves.length - 1) {
    //   if (game.withComputer) {
    //     if (game.currentPlayer == Player.white) {
    //       game.press(loc);
    //     }
    //   } else {
    //     game.press(loc);
    //   }
    // }
  widget.game.press(pos);
  setState(() {
    
  });
  }
}
