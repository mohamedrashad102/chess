import '../../../../models/board.dart';
import '../../../../models/piece.dart';
import '../../../../models/position.dart';
import 'filter_valid_moves.dart';

List<Position> rookValidMoves(Board board, Piece rookPiece) {
  List<Position> validMoves = [];
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
          validMoves.add(newPiece.position);
        } else if (newPiece.player != rookPiece.player) {
          validMoves.add(newPiece.position);
          break;
        } else if (newPiece.player == rookPiece.player) {
          break;
        }
      } else {
        break;
      }
    }
  }
  List<Position> filterMoves = filterValidMoves(board, validMoves, rookPiece);
  return filterMoves;
}
