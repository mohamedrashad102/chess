import 'package:chess/models/board.dart';
import 'package:chess/models/piece.dart';
import '../../../../constants.dart';
import '../../../../models/position.dart';

Board initialPawns(Board board) {
  // Define a nested function to initialize a pawn
  void initializePawn(Player player, Position pos, String imagePath) {
    Piece pawn = Piece(
      imagePath: imagePath,
      player: player,
      type: PieceType.pawn,
      position: pos,
    );
    board.setPiece(pawn);
  }

  // Initialize white pawns
  for (int i = 0; i < 8; i++) {
    initializePawn(Player.white, Position(6, i), ChessAssets.whitePawn);
  }

  // Initialize black pawns
  for (int i = 0; i < 8; i++) {
    initializePawn(Player.black, Position(1, i), ChessAssets.blackPawn);
  }

  return board;
}
