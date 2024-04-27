import 'package:chess/models/piece.dart';
import 'package:chess/models/position.dart';

class MoveModel {
  final Piece currentPiece;
  final Position position;
  final List<Position> validMoves;
  MoveModel(this.currentPiece, this.validMoves , this.position);
}
