import 'package:flutter/material.dart';

import '../../../models/piece.dart';
import '../../../models/position.dart';
import 'cell.dart';

class AppBarBoard extends StatelessWidget {
  const AppBarBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: 30,
            height: 80,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) => SizedBox(
                width: 7.5,
                height: 7.5,
                child: Cell(
                  piece: Piece(
                      type: PieceType.none,
                      position: Position.formIndex(index),
                      player: Player.none),
                  isWhite: _isWhite(index),
                ),
              ),
              itemCount: 4 * 4,
            ),
          );
  }
  bool _isWhite(int index) {
    int row = index ~/ 4;
    int column = index % 4;
    bool isWhite = (row + column) % 2 == 0;
    return isWhite;
  }
}