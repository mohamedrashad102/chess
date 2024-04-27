import '../../../../models/board.dart';
import '../../../../models/piece.dart';
import '../../../../models/position.dart';

List<Position> knightAttackMoves(Board board, Piece knightPiece) {
  List<Position> attackMoves = [];
  List<Position> directions = [
    Position(-2, 1), // up right
    Position(-2, -1), // up left
    Position(2, 1), // down right
    Position(2, -1), // down left

    Position(-1, 2), // right up
    Position(1, 2), // right down
    Position(1, -2), // left down
    Position(-1, -2), //left up
  ];
  for (var direction in directions) {
    Position newPos = knightPiece.position;
    newPos += direction;
    if (Board.isValidPosition(newPos)) {
      attackMoves.add(newPos);
    }
  }
  return attackMoves;
}
