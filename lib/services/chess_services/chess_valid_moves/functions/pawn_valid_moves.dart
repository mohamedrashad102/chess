import 'package:chess/services/chess_services/chess_valid_moves/functions/filter_valid_moves.dart';

import '../../../../models/board.dart';
import '../../../../models/piece.dart';
import '../../../../models/position.dart';

List<Position> pawnValidMoves(Board board, Piece pawnPiece) {
  List<Position> validMoves = [];
  Position newPos;
  int row = pawnPiece.position.row;
  // direction will be up if white and down if black
  int direction = pawnPiece.player == Player.white ? -1 : 1;
  List<Position> directions = [
    Position(direction, 0), // direction
    Position(direction, 1), // direction right
    Position(direction, -1), // direction left
  ];
  // move one step up if there are no pieces
  newPos = pawnPiece.position + directions[0];
  if (Board.isValidPosition(newPos) &&
      board.getPiece(newPos).type == PieceType.none) {
    validMoves.add(newPos);
  }

  // move two steps up if it is initial move
  if ((row == 6 && pawnPiece.player == Player.white) ||
      (row == 1 && pawnPiece.player == Player.black)) {
    if (board.getPiece(newPos).type == PieceType.none) {
      newPos += directions[0];
      if (board.getPiece(newPos).type == PieceType.none) {
        validMoves.add(newPos);
      }
    }
  }

  // Can only move diagonally to capture
  for (int i = 1; i < directions.length; i++) {
    newPos = pawnPiece.position + directions[i];
    if (Board.isValidPosition(newPos) &&
        board.getPiece(newPos).type != PieceType.none &&
        board.getPiece(newPos).player != pawnPiece.player) {
      validMoves.add(newPos);
    }
  }
  List<Position> filterMoves = filterValidMoves(board,validMoves, pawnPiece);
  return filterMoves;
}
