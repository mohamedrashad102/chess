import '../../../../models/board.dart';
import '../../../../models/piece.dart';
import '../../../../models/position.dart';
import 'bishop_valid_moves.dart';
import 'rook_valid_moves.dart';

 List<Position> queenValidMoves(Board board, Piece piece) {
    List<Position> validMoves = [];
    validMoves.addAll(bishopValidMoves(board, piece));
    validMoves.addAll(rookValidMoves(board, piece));
    return validMoves;
  }

