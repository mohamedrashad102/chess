import '../../../../models/board.dart';
import '../../../../models/piece.dart';
import '../../../../models/position.dart';
import '../../chess_attack_moves/chess_attack_moves.dart';

List<Position> kingValidMoves(Board board, Piece kingPiece) {
  List<Position> validMoves = [];
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
  Player enemyPlayer =
      kingPiece.player == Player.white ? Player.black : Player.white;
  List<Position> enemyAttackMoves = ChessAttackMoves.all(board, enemyPlayer);
  for (var direction in directions) {
    var newPos = kingPiece.position;
    newPos += direction;

    if (Board.isValidPosition(newPos) &&
        // should not be in dangerous
        !enemyAttackMoves.contains(newPos) &&
        // can only capture enemy pieces)
        board.getPiece(newPos).player != kingPiece.player) {
      validMoves.add(newPos);
    }
  }
  return validMoves;
}
