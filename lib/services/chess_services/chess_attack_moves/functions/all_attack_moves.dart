import 'package:chess/models/board.dart';
import 'package:chess/models/piece.dart';
import 'package:chess/models/position.dart';
import 'package:chess/services/chess_services/chess_attack_moves/chess_attack_moves.dart';

List<Position> allAttackMoves(Board board, Player player) {
  List<Position> allAttackMoves = [];
  for (int i = 0; i < 8 * 8; i++) {
    var pos = Position.formIndex(i);
    var piece = board.getPiece(pos);
    if (piece.player != player) {
      continue;
    }
    switch (piece.type) {
      case PieceType.pawn:
        allAttackMoves.addAll(ChessAttackMoves.pawn(board, piece));
      case PieceType.rook:
        allAttackMoves.addAll(ChessAttackMoves.rook(board, piece));
      case PieceType.knight:
        allAttackMoves.addAll(ChessAttackMoves.knight(board, piece));
      case PieceType.bishop:
        allAttackMoves.addAll(ChessAttackMoves.bishop(board, piece));
      case PieceType.queen:
        allAttackMoves.addAll(ChessAttackMoves.queen(board, piece));
      case PieceType.king:
        allAttackMoves.addAll(ChessAttackMoves.king(board, piece));
      case PieceType.none:
        break;
    }
  }
  return allAttackMoves;
}
