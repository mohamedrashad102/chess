import 'package:chess/models/piece.dart';
import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    required this.piece,
    required this.isWhite,
  });

  final Piece piece;
  final bool isWhite;

  @override
  Widget build(BuildContext context) {
    Color color = _getColor();
    final Widget? child = _getChild();
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: color,
      child: Align(child: child),
    );
  }

  Color _getColor() {
    Color color = isWhite ? Colors.green.shade200 : Colors.green.shade700;
    return color;
  }

  Widget? _getChild() {
    Widget? child;
    child = piece.type != PieceType.none ? Image.asset(piece.imagePath!) : null;
    return child;
  }
}
