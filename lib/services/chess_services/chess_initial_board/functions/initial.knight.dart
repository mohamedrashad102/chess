import 'package:chess/models/board.dart';
import 'package:chess/models/piece.dart';
import '../../../../constants.dart';
import '../../../../models/position.dart';

Board initialKnights(Board board) {
  // Define a nested function to initialize a knight
  void initializeKnight(Player player, Position pos, String imagePath) {
    Piece knight = Piece(
      imagePath: imagePath,
      player: player,
      type: PieceType.knight,
      position: pos,
    );
    board.setPiece(knight);
  }

  // Initialize black knights
  initializeKnight(Player.black, Position(0, 1), ChessAssets.blackKnight);
  initializeKnight(Player.black, Position(0, 6), ChessAssets.blackKnight);

  // Initialize white knights
  initializeKnight(Player.white, Position(7, 1), ChessAssets.whiteKnight);
  initializeKnight(Player.white, Position(7, 6), ChessAssets.whiteKnight);

  return board;
}
