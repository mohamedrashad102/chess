import 'package:chess/models/board.dart';
import 'package:chess/models/piece.dart';
import 'package:chess/models/position.dart';

import 'functions/all_attack_moves.dart';
import 'functions/bishop_attack_moves.dart';
import 'functions/king_attack_moves.dart';
import 'functions/knight_attack_moves.dart';
import 'functions/pawn_attack_moves.dart';
import 'functions/queen_attack_moves.dart';
import 'functions/rook_attack_moves.dart';

class ChessAttackMoves {
  static List<Position> pawn(Board board,Piece pawnPiece) => pawnAttackMoves(board, pawnPiece);
  static List<Position> rook (Board board,Piece rookPiece) => rookAttackMoves(board, rookPiece);
  static List<Position> knight (Board board,Piece knightPiece) => knightAttackMoves(board, knightPiece);
  static List<Position> bishop (Board board,Piece bishopPiece) => bishopAttackMoves(board, bishopPiece);
  static List<Position> queen (Board board,Piece queenPiece) => queenAttackMoves(board, queenPiece);
  static List<Position> king (Board board,Piece kingPiece) => kingAttackMoves(board, kingPiece);
  static List<Position> all (Board board, Player player) => allAttackMoves(board, player);
}
