// import 'package:chess/models/board.dart';

// import '../../../../models/piece.dart';
// import '../../../../models/position.dart';
// import '../../chess_attack_moves/chess_attack_moves.dart';

// bool isKingInCheck(Board board, Player kingPlayer) {
//   Player enemyPlayer = kingPlayer == Player.white ? Player.black : Player.white;
//   List<Position> enemyAttackMoves = ChessAttackMoves.all(board, enemyPlayer);
//   var kingPiece = board.getKing(kingPlayer);
//   bool inCheck = enemyAttackMoves.contains(kingPiece.position);
//   return inCheck;
// }
