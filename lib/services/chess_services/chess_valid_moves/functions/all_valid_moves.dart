import 'package:chess/models/board.dart';
import 'package:chess/models/piece.dart';
import 'package:chess/models/position.dart';
import 'package:chess/services/chess_services/chess_valid_moves/chess_valid_moves.dart';

List<Position> allValidMoves(Board board, Player player) {
  List<Position> allValidMoves = [];
  for (int i = 0; i < 8 * 8; i++) {
    var pos = Position.formIndex(i);
    var piece = board.getPiece(pos);
    if (piece.player != player) {
      continue;
    }
    switch (piece.type) {
      case PieceType.pawn:
        allValidMoves.addAll(ChessValidMoves.pawn(board, piece));
      case PieceType.rook:
        allValidMoves.addAll(ChessValidMoves.rook(board, piece));
      case PieceType.knight:
        allValidMoves.addAll(ChessValidMoves.knight(board, piece));
      case PieceType.bishop:
        allValidMoves.addAll(ChessValidMoves.bishop(board, piece));
      case PieceType.queen:
        allValidMoves.addAll(ChessValidMoves.queen(board, piece));
      case PieceType.king:
        allValidMoves.addAll(ChessValidMoves.king(board, piece));
      case PieceType.none:
        break;
    }
  }
  return allValidMoves;
}
