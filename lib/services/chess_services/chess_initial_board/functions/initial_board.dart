import '../../../../models/piece.dart';
import '../../../../models/position.dart';

List<List<Piece>> initialBoard() {
  List<List<Piece>> board = List.generate(
    8,
    (row) => List.generate(
      8,
      (col) => Piece(
        type: PieceType.none,
        position: Position(row, col),
        player: Player.none,
      ),
    ),
  );
  return board;
}
