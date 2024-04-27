import '../../../../models/board.dart';
import '../../../../models/piece.dart';
import '../../../../models/position.dart';
import 'filter_valid_moves.dart';

List<Position> knightValidMoves(Board board, Piece knightPiece) {
    List<Position> validMoves = [];
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
        Piece newPiece = board.getPiece(newPos);
        if (newPiece.type != PieceType.none) {
          if (newPiece.player != knightPiece.player) {
            validMoves.add(newPos);
          } else if (newPiece.type == PieceType.none) {}
        } else if (newPiece.type == PieceType.none) {
          validMoves.add(newPos);
        }
      }
    }
   List<Position> filterMoves = filterValidMoves(board,validMoves, knightPiece);
  return filterMoves;
  }