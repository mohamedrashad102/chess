import 'package:chess/models/board.dart';
import 'package:chess/models/piece.dart';
import '../../../../constants.dart';
import '../../../../models/position.dart';

Board initialBishops(Board board) {
  // Define a nested function to initialize a bishop
  void initializeBishop(Player player, Position pos, String imagePath) {
    Piece bishop = Piece(
      imagePath: imagePath,
      player: player,
      type: PieceType.bishop,
      position: pos,
    );
    board.setPiece(bishop);
  }

  // Initialize black bishops
  initializeBishop(Player.black, Position(0, 2), ChessAssets.blackBishop);
  initializeBishop(Player.black, Position(0, 5), ChessAssets.blackBishop);

  // Initialize white bishops
  initializeBishop(Player.white, Position(7, 2), ChessAssets.whiteBishop);
  initializeBishop(Player.white, Position(7, 5), ChessAssets.whiteBishop);

  return board;
}
