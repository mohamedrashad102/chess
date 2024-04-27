import 'package:chess/models/board.dart';
import 'package:chess/models/piece.dart';
import '../../../../constants.dart';
import '../../../../models/position.dart';

Board initialKings(Board board) {
  // Define a nested function to initialize a king
  void initializeKing(Player player, Position pos, String imagePath) {
    Piece king = Piece(
      imagePath: imagePath,
      player: player,
      type: PieceType.king,
      position: pos,
    );
    board.setPiece(king);
  }

  // Initialize black king
  initializeKing(Player.black, Position(0, 4), ChessAssets.blackKing);

  // Initialize white king
  initializeKing(Player.white, Position(7, 4), ChessAssets.whiteKing);

  return board;
}
