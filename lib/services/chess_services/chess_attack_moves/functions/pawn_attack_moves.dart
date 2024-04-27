import '../../../../models/board.dart';
import '../../../../models/piece.dart';
import '../../../../models/position.dart';

List<Position> pawnAttackMoves(Board board, Piece pawnPiece) {
  List<Position> attackMoves = [];

  // direction will be up if white and down if black
  int direction = pawnPiece.player == Player.white ? -1 : 1;

  List<Position> directions = [
    Position(direction, 1), // direction right
    Position(direction, -1), // direction left
  ];

  // Can only move diagonally to capture
  for (int i = 0; i < directions.length; i++) {
    var newPos = pawnPiece.position + directions[i];
    if (Board.isValidPosition(newPos)) {
      attackMoves.add(newPos);
    }
  }
  return attackMoves;
}
