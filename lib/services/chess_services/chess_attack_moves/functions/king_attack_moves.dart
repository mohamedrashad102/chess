import '../../../../models/board.dart';
import '../../../../models/piece.dart';
import '../../../../models/position.dart';

List<Position> kingAttackMoves(Board board, Piece kingPiece) {
  List<Position> attackMoves = [];
  List<Position> directions = [
    Position(-1, 0), // up
    Position(-1, 1), // up right
    Position(-1, -1), // up left
    Position(1, 0), // down
    Position(1, 1), // down right
    Position(1, -1), // down left
    Position(0, 1), // right
    Position(0, -1), // left
  ];

  for (var direction in directions) {
    var newPos = kingPiece.position;
    newPos += direction;
    if (Board.isValidPosition(newPos)) {
      attackMoves.add(newPos);
    }
  }
  return attackMoves;
}
