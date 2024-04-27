import 'package:chess/models/board.dart';
import 'package:chess/models/piece.dart';
import '../../../../constants.dart';
import '../../../../models/position.dart';

Board initialQueens(Board board) {
  // Define a nested function to initialize a queen
  void initializeQueen(Player player, Position pos, String imagePath) {
    Piece queen = Piece(
      imagePath: imagePath,
      player: player,
      type: PieceType.queen,
      position: pos,
    );
    board.setPiece(queen);
  }

  // Initialize black queen
  initializeQueen(Player.black, Position(0, 3), ChessAssets.blackQueen);

  // Initialize white queen
  initializeQueen(Player.white, Position(7, 3), ChessAssets.whiteQueen);

  return board;
}
