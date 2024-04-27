import 'package:chess/models/board.dart';

import '../../../../models/piece.dart';
import '../../../../models/position.dart';
import '../chess_valid_moves.dart';

List<Position> pieceValidMoves(Board board ,  Piece piece) {
    List<Position> validMoves = [];
    switch (piece.type) {
      case PieceType.pawn:
        validMoves = ChessValidMoves.pawn(board, piece);
      case PieceType.rook:
        validMoves = ChessValidMoves.rook(board, piece);
      case PieceType.knight:
        validMoves = ChessValidMoves.knight(board, piece);
      case PieceType.bishop:
        validMoves = ChessValidMoves.bishop(board, piece);
      case PieceType.queen:
        validMoves = ChessValidMoves.queen(board, piece);
      case PieceType.king:
        validMoves = ChessValidMoves.king(board, piece);
      case PieceType.none:
        break;
    }
    return validMoves;
  }