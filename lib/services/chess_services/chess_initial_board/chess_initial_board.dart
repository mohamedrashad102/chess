import 'package:chess/models/board.dart';
import 'package:chess/services/chess_services/chess_initial_board/functions/initial.knight.dart';
import 'package:chess/services/chess_services/chess_initial_board/functions/initial_pawn.dart';
import 'package:chess/services/chess_services/chess_initial_board/functions/initial_queen.dart';

import 'functions/initial_bishop.dart';
import 'functions/initial_board.dart';
import 'functions/initial_king.dart';
import 'functions/initial_rook.dart';

class ChessInitialBoard {
  static Board instance() {
    Board board;
    board = Board(initialBoard());
    board = initialPawns(board);
    board = initialRooks(board);
    board = initialKnights(board);
    board = initialBishops(board);
    board = initialQueens(board);
    board = initialKings(board);
    return board;
  }
}
