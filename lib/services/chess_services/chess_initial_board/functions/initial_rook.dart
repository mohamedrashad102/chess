import 'package:chess/models/board.dart';
import 'package:chess/models/piece.dart';
import '../../../../constants.dart';
import '../../../../models/position.dart';

Board initialRooks(Board board) {
  // Define a nested function to initialize a rook
  void initializeRook(Player player, Position pos) {
    Piece piece = Piece(
      imagePath: player == Player.white
          ? ChessAssets.whiteRook
          : ChessAssets.blackRook,
      player: player,
      type: PieceType.rook,
      position: pos,
    );
    board.setPiece(piece);
  }

  // Initialize black rooks
  initializeRook(Player.black, Position(0, 0));
  initializeRook(Player.black, Position(0, 7));

  // Initialize white rooks
  initializeRook(Player.white, Position(7, 0));
  initializeRook(Player.white, Position(7, 7));

  return board;
}
