import 'package:chess/services/chess_services/chess_attack_moves/functions/bishop_attack_moves.dart';
import 'package:chess/services/chess_services/chess_attack_moves/functions/rook_attack_moves.dart';

import '../../../../models/board.dart';
import '../../../../models/piece.dart';
import '../../../../models/position.dart';

List<Position> queenAttackMoves(Board board, Piece queenPiece) {
  List<Position> validMoves = [];
  validMoves.addAll(bishopAttackMoves(board, queenPiece));
  validMoves.addAll(rookAttackMoves(board, queenPiece));
  return validMoves;
}
