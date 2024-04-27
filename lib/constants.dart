import 'package:flutter/material.dart';

class ChessAssets {
  static String basePath = 'assets/images/';

  static final String whitePawn = '${basePath}white pawn.png';
  static final String whiteRook = '${basePath}white rook.png';
  static final String whiteKnight = '${basePath}white knight.png';
  static final String whiteBishop = '${basePath}white bishop.png';
  static final String whiteQueen = '${basePath}white queen.png';
  static final String whiteKing = '${basePath}white king.png';

  static final String blackPawn = '${basePath}black pawn.png';
  static final String blackRook = '${basePath}black rook.png';
  static final String blackKnight = '${basePath}black knight.png';
  static final String blackBishop = '${basePath}black bishop.png';
  static final String blackQueen = '${basePath}black queen.png';
  static final String blackKing = '${basePath}black king.png';
}

class ChessColors {
  static const whitePiece = Color(0xff9d8354);
  static const blackPiece = Color(0xff7f6535);
  static const selectedPiece = Color(0xff485c28);
  static const validMove = Color(0xff4e622f);
  static const oldMove = Color(0xff84881a);
  static const lastMove = Color(0xff9fa235);
  static const kingInCheck = Color(0xffc32314);
}

class ChessSounds {
  static String basePath = 'sounds/';
  static final select = '${basePath}select.ogg';
  static final move = '${basePath}move.ogg';
  static final capture = '${basePath}capture.ogg';
}
