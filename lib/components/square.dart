import 'package:chess/constants.dart';
import 'package:chess/models/board.dart';
import 'package:chess/models/piece.dart';
import 'package:flutter/material.dart';

import '../models/position.dart';

class Square extends StatelessWidget {
  const Square({
    super.key,
    required this.onTap,
    required this.board,
    required this.index,
    required this.currentBoardIndex,
    // required this.newPiece,
    // required this.isWhite,
    // required this.isWhiteKingInCheck,
    // required this.isBlackKingInCheck,
    // required this.validMoves,
    // required this.oldMovePiece,
    // required this.newMovePiece,
    // required this.currentPos,
    // required this.currentPiece,
  });

  // final Piece? currentPiece;
  // final Piece newPiece;
  // final bool isWhite;
  // final bool isWhiteKingInCheck;
  // final bool isBlackKingInCheck;
  // final List<Position> validMoves;
  // final Position? oldMovePiece;
  // final Position? newMovePiece;
  // final Position currentPos;
  final void Function()? onTap;
  final Board board;
  final int index;
  final int currentBoardIndex;

  @override
  Widget build(BuildContext context) {
    Color color = _getColor();
    final Widget? child = _getChild();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: color,
        child: Align(child: child),
      ),
    );
  }

  Color _getColor() {
    var pos = Position.formIndex(index);
    var piece = board.getPiece(pos);
    var selectedPiece = board.selectedPiece;
    var validMoves = board.validMoves;
    var lastMovePiece = board.lastMovePiece;
    var oldMovePiece = board.oldMovePiece;
     var whiteKingInCheck = board.isWhiteKingInCheck[currentBoardIndex];
    var blackKingInCheck = board.isBlackKingInCheck[currentBoardIndex];
    bool isWhiteKingInCheck = whiteKingInCheck &&
        piece.type == PieceType.king &&
        piece.player == Player.white;
    bool isBlackKingInCheck = blackKingInCheck &&
        piece.type == PieceType.king &&
        piece.player == Player.black;
    bool isPieceInDangerous =
        validMoves.contains(pos) && piece.type != PieceType.none;
    bool isSelectedPiece =
        selectedPiece != null && selectedPiece.position == pos;
    bool isLastMove = lastMovePiece != null && lastMovePiece.position == pos;
    bool isOldMove = oldMovePiece != null && oldMovePiece.position == pos;

    late Color color;
    color = _isWhite() ? ChessColors.whitePiece : ChessColors.blackPiece;
    if (isSelectedPiece) {
      color = ChessColors.selectedPiece;
    }
    if (isLastMove) {
      color = ChessColors.lastMove;
    }
    if (isOldMove) {
      color = ChessColors.oldMove;
    }
    if (isPieceInDangerous) {
      color = ChessColors.validMove;
    }
    if (isWhiteKingInCheck ||isBlackKingInCheck){
      color = ChessColors.kingInCheck;
    }
    return color;
  }

  Widget? _getChild() {
    var pos = Position.formIndex(index);
    var piece = board.getPiece(pos);
    var validMoves = board.validMoves;
    bool isPieceInDangerous =
        validMoves.contains(pos) && piece.type != PieceType.none;
    Widget? child;
    child = piece.type != PieceType.none ? Image.asset(piece.imagePath!) : null;
    for (int i = 0; i < validMoves.length; i++) {
      if (piece.type == PieceType.none) {
        if (pos == validMoves[i]) {
          child = Container(
            width: 13,
            height: 13,
            decoration: const BoxDecoration(
              color: ChessColors.validMove,
              shape: BoxShape.circle,
            ),
          );
        }
      }
    }
    if (isPieceInDangerous) {
      child = Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: _isWhite() ? ChessColors.whitePiece : ChessColors.blackPiece,
        ),
        child: child,
      );
    }

    return child;
  }

  _isWhite() {
    int row = index ~/ 8;
    int column = index % 8;
    bool isWhite = (row + column) % 2 == 0;
    return isWhite;
  }
}
