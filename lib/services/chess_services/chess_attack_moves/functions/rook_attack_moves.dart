import '../../../../models/board.dart';
import '../../../../models/piece.dart';
import '../../../../models/position.dart';

List<Position> rookAttackMoves(Board board, Piece rookPiece) {
  List<Position> attackMoves = [];
  List<Position> directions = [
    Position(-1, 0), // up
    Position(1, 0), // down
    Position(0, -1), // left
    Position(0, 1), // right
  ];
  for (var direction in directions) {
    Position newPos = rookPiece.position;
    while (true) {
      newPos += direction;
      if (Board.isValidPosition(newPos)) {
        Piece newPiece = board.getPiece(newPos);
        if (newPiece.type == PieceType.none) {
          attackMoves.add(newPiece.position);
        } else {
          if (newPiece.player == rookPiece.player) {
            attackMoves.add(newPiece.position);
          }
          if (newPiece.type == PieceType.king &&
              newPiece.player != rookPiece.player) {
            attackMoves.add(newPiece.position);
            continue;
          }
          break;
        }
      } else {
        break;
      }
    }
  }
  return attackMoves;
}
