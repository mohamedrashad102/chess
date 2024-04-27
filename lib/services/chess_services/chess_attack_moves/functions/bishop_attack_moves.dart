import '../../../../models/board.dart';
import '../../../../models/piece.dart';
import '../../../../models/position.dart';

List<Position> bishopAttackMoves(Board board, Piece bishopPiece) {
  List<Position> attackMoves = [];
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
          attackMoves.add(newPiece.position);
        } else {
          if (newPiece.player == bishopPiece.player) {
            attackMoves.add(newPiece.position);
          }
          if (newPiece.type == PieceType.king && newPiece.player != bishopPiece.player){
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
