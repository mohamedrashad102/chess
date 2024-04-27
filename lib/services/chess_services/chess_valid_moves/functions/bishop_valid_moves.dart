import '../../../../models/board.dart';
import '../../../../models/piece.dart';
import '../../../../models/position.dart';
import 'filter_valid_moves.dart';

 List<Position> bishopValidMoves(Board board, Piece bishopPiece) {
    List<Position> validMoves = [];
    List<Position> directions = [
      Position(-1, 1), // up right
      Position(-1, -1), // up left
      Position(1, 1), // down right
      Position(1, -1), // down left
    ];

    for (var direction in directions) {
      Position newPos = bishopPiece.position;
      while (true) {
        newPos += direction;
        if (Board.isValidPosition(newPos)) {
          Piece newPiece = board.getPiece(newPos);
          if (newPiece.type == PieceType.none) {
            validMoves.add(newPiece.position);
          } else if (newPiece.player != bishopPiece.player) {
            validMoves.add(newPiece.position);
            // do not break if the piece is enemy king
            break;
          } else if (newPiece.player == bishopPiece.player) {
            break;
          }
        } else {
          break;
        }
      }
    }
    List<Position> filterMoves = filterValidMoves(board, validMoves, bishopPiece);
  return filterMoves;
  }
