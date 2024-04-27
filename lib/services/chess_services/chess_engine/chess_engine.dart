import 'dart:math';

import 'package:chess/models/move_model.dart';
import 'package:chess/models/piece.dart';

import '../../../models/board.dart';
import '../../../models/position.dart';
import '../chess_valid_moves/chess_valid_moves.dart';

class ChessEngine{
  ChessEngine(this.player);
  final Player player;
   MoveModel? move(Board board) {
    List<Position> triedPositions = [];
    while (true) {
      int randIndex = Random().nextInt(8 * 8);
      Position pos = Position.formIndex(randIndex);
      var testPiece = board.getPiece(pos);
      if (triedPositions.contains(pos)) {
        if (triedPositions.length == 8 * 8) {
          return null;
        }
        continue;
      }
      triedPositions.add(pos);
      if (testPiece.player == player) {
        var validMoves = ChessValidMoves.piece(board, testPiece);
        if (validMoves.isNotEmpty) {
          int randMove = Random().nextInt(validMoves.length);
          return MoveModel(testPiece, validMoves, validMoves[randMove]);
    
        }
      }
    }
  }

}