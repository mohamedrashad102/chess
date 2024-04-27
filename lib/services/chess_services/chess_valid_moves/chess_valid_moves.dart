import 'package:chess/models/board.dart';
import 'package:chess/models/piece.dart';
import 'package:chess/models/position.dart';

import 'functions/all_valid_moves.dart';
import 'functions/bishop_valid_moves.dart';
import 'functions/king_valid_moves.dart';
import 'functions/knight_valid_moves.dart';
import 'functions/pawn_valid_moves.dart';
import 'functions/piece_valid_moves.dart';
import 'functions/queen_valid_moves.dart';
import 'functions/rook_valid_moves.dart';

class ChessValidMoves {
  static List<Position> piece(Board board , Piece piece) => pieceValidMoves(board, piece);
  static List<Position> pawn(Board board , Piece pawnPiece) => pawnValidMoves(board, pawnPiece);
  static List<Position> bishop(Board board , Piece bishopPiece) => bishopValidMoves(board, bishopPiece);
  static List<Position> rook(Board board , Piece rookPiece) => rookValidMoves(board, rookPiece);
  static List<Position> knight(Board board , Piece knightPiece) => knightValidMoves(board, knightPiece);
  static List<Position> queen(Board board , Piece queenPiece) => queenValidMoves(board, queenPiece);
  static List<Position> king(Board board , Piece kingPiece) => kingValidMoves(board, kingPiece);
  static List<Position> all(Board board , Player player) => allValidMoves(board , player);
}
