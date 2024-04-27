import 'package:chess/models/board.dart';
import 'package:chess/models/piece.dart';

import '../../../../models/position.dart';

List<Position> filterValidMoves(Board board, List<Position> validMoves ,  Piece selectedPiece) {
  List<Position> filterValidMoves = [];

  var myKingPiece = board.getKing(selectedPiece.player);
  for (var validMove in  validMoves) {
    var tempBoard = board.newInstance();
    var newPiece = board.getPiece(validMove);
    tempBoard.updatePieces(selectedPiece, newPiece);
    bool isKingInCheck = tempBoard.isKingInCheck(myKingPiece.player);
    if (!isKingInCheck) {
      filterValidMoves.add(validMove);
    }
  }
  print(filterValidMoves);
  return filterValidMoves;
}
