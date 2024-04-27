import 'package:chess/models/position.dart';

enum PieceType { pawn, rook, knight, bishop, queen, king, none }

enum Player { white, black, none }

class Piece {
  final PieceType type;
  final Player player;
  final String? imagePath;
  Position position;

  Piece({
    required this.type,
    required this.position,
    required this.player,
    this.imagePath,
  });

  Piece newInstance() {
    Piece newPiece = Piece(
      type: type,
      position: position,
      player: player,
    );
    return newPiece;
  }
}
