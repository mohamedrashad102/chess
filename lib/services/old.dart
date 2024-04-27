// import 'package:chess/models/chess_piece.dart';
// import 'package:chess/services/chess_initial.dart';

// import '../models/location.dart';

// class ChessGame {
//   static late List<List<Piece?>> _board;
//   static Piece? _currentPiece;
//   static Player _currentPlayer = Player.white;

//   static Location whiteKing = Location(7, 4);
//   static Location blackKing = Location(0, 3);
//   static List<Location> validMoves = [];
//   static bool isWhite = true;
//   static bool oldKing = false;
//   static bool kingInCheck = false;

//   static void initial() {
//     _board = ChessINitial.initialBoard();
//   }

//   static Piece? getPiece(Location loc) {
//     return _board[loc.row][loc.col];
//   }

//   static void press(Location loc) {
//     _currentPiece = getPiece(loc);

//     if (_currentPiece != null) {
//       if (_currentPiece!.player == _currentPlayer) {
//         _selectPiece(loc);
//       } else {
//         _tryMoving();
//       }
//     } else {
//       _tryMoving();
//     }
//   }

//   static void _selectPiece(Location loc) {
//     if (loc == _currentPiece!.loc) {
//       _clearValidMoves();
//     } else {
//       _getValidMoves(_currentPiece);
//     }
//   }

//   static _clearValidMoves() {}
//   static _tryMoving() {}

//   // static void selectPiece(Location loc) {
//   //   if (validMoves.isNotEmpty) {
//   //     if (_isValidMove(loc)) {
//   //       _move(loc);
//   //       return;
//   //     }
//   //   }
//   //   if (_isValidSelect(loc) && _isNotSameLoc(loc)) {
//   //     _changeSelectedPieceAndLoc(loc);
//   //   } else {
//   //     _clearSelectedPieceAndLoc(loc);
//   //   }
//   //   _changeValidMoves();
//   // }

//   static bool _isValidSelect(Location loc) {
//     if (_board[loc.row][loc.col] != null) {
//       if (_board[loc.row][loc.col]!.player == isWhite) {
//         return true;
//       }
//     }
//     return false;
//   }

//   // static bool _isNotSameLoc(Location loc) {
//   //   if (selectedLoc == null) {
//   //     return true;
//   //   }
//   //   if (selectedLoc!.instant() != loc.instant()) {
//   //     return true;
//   //   }
//   //   return false;
//   // }

//   static void _changeSelectedPieceAndLoc(Location loc) {
//     _currentPiece = _board[loc.row][loc.col];
//     selectedLoc = Location(loc.row, loc.col);
//   }

//   static void _clearSelectedPieceAndLoc(Location loc) {
//     selectedLoc = null;
//     _currentPiece = null;
//   }

//   static void _changeValidMoves() {
//     if (_currentPiece == null) {
//       validMoves = [];
//       return;
//     }
//     validMoves =
//         _getValidMoves(_currentPiece!, selectedLoc!, _currentPiece!.player);
//     return;
//   }

//   static bool _isValidMove(Location loc) {
//     for (int i = 0; i < validMoves.length; i++) {
//       if (validMoves[i].instant() == loc.instant()) {
//         return true;
//       }
//     }
//     return false;
//   }

//   static List<Location> _getValidMoves(
//     Piece piece,
//   ) {
//     List<Location> validMoves = [];

//     switch (piece.type) {
//       case PieceType.pawn:
//         validMoves = _getValidPawnMoves(piece, loc, isWhite);
//         break;
//       case PieceType.rook:
//         validMoves = _getValidRookMoves(piece, loc, isWhite);
//         break;
//       case PieceType.knight:
//         validMoves = _getValidKnightMoves(piece, loc, isWhite);
//         break;
//       case PieceType.bishop:
//         validMoves = _getValidBishopMoves(piece, loc, isWhite);
//         break;
//       case PieceType.queen:
//         validMoves = _getValidQueenMoves(piece, loc, isWhite);
//         break;
//       case PieceType.king:
//         validMoves = _getValidKingMoves(piece, loc, isWhite);
//         break;
//     }

//     return validMoves;
//   }

//   static void _move(Location loc) {
//     // clear old piece
//     _board[selectedLoc!.row][selectedLoc!.col] = null;
//     // add new piece
//     _board[loc.row][loc.col] = _currentPiece;
//     if (_currentPiece!.type == PieceType.king) {
//       if (isWhite) {
//         whiteKing = loc;
//       } else {
//         blackKing = loc;
//       }
//     }
//     // print(kingInCheck);
//     kingInCheck =
//         isWhite ? _isKingInCheck(whiteKing) : _isKingInCheck(blackKing);
//     print(kingInCheck);

//     isWhite = !isWhite;
//     _clearSelectedPieceAndLoc(loc);
//     validMoves.clear();
//   }

//   static List<Location> _getValidPawnMoves(
//     Piece piece,
//     Location loc,
//     bool isWhite,
//   ) {
//     List<Location> validMoves = [];
//     int currentRow = loc.row;
//     int currentCol = loc.col;

//     if (piece.player) {
//       // Check if the square in front of the pawn is empty
//       if (currentRow > 0 && _board[currentRow - 1][currentCol] == null) {
//         validMoves.add(Location(currentRow - 1, currentCol));

//         // Check if it's the pawn's first move and the square two steps ahead is empty
//         if (currentRow == 6 && _board[currentRow - 2][currentCol] == null) {
//           validMoves.add(Location(currentRow - 2, currentCol));
//         }
//       }

//       // Check for diagonal captures
//       if (currentRow > 0 &&
//           currentCol > 0 &&
//           (_board[currentRow - 1][currentCol - 1] != null) &&
//           _board[currentRow - 1][currentCol - 1]!.player != isWhite) {
//         validMoves.add(Location(currentRow - 1, currentCol - 1));
//       }
//       if (currentRow > 0 &&
//           currentCol < 7 &&
//           (_board[currentRow - 1][currentCol + 1] != null) &&
//           _board[currentRow - 1][currentCol + 1]!.player != isWhite) {
//         validMoves.add(Location(currentRow - 1, currentCol + 1));
//       }
//       if (oldKing) {
//         validMoves.add(Location(currentRow - 1, currentCol - 1));
//         validMoves.add(Location(currentRow - 1, currentCol + 1));
//       }
//     }

//     // Pawn move logic for black pawns (assuming they move downward)
//     else {
//       // Check if the square in front of the pawn is empty
//       if (currentRow < 7 && _board[currentRow + 1][currentCol] == null) {
//         validMoves.add(Location(currentRow + 1, currentCol));

//         // Check if it's the pawn's first move and the square two steps ahead is empty
//         if (currentRow == 1 && _board[currentRow + 2][currentCol] == null) {
//           validMoves.add(Location(currentRow + 2, currentCol));
//         }
//       }

//       // Check for diagonal captures
//       if (currentRow < 7 &&
//           currentCol > 0 &&
//           (_board[currentRow + 1][currentCol - 1] != null) &&
//           _board[currentRow + 1][currentCol - 1]!.player != isWhite) {
//         validMoves.add(Location(currentRow + 1, currentCol - 1));
//       }
//       if (currentRow < 7 &&
//           currentCol < 7 &&
//           (_board[currentRow + 1][currentCol + 1] != null) &&
//           _board[currentRow + 1][currentCol + 1]!.player != isWhite) {
//         validMoves.add(Location(currentRow + 1, currentCol + 1));
//       }
//       if (oldKing) {
//         validMoves.add(Location(currentRow + 1, currentCol - 1));
//         validMoves.add(Location(currentRow + 1, currentCol + 1));
//       }
//     }

//     return validMoves;
//   }

//   static List<Location> _getValidRookMoves(
//     Piece piece,
//     Location loc,
//     bool isWhite,
//   ) {
//     List<Location> validMoves = [];
//     int currentRow = loc.row;
//     int currentCol = loc.col;

//     // Check valid moves vertically (up)
//     for (int row = currentRow - 1; row >= 0; row--) {
//       if (_board[row][currentCol] == null) {
//         validMoves.add(Location(row, currentCol));
//       } else if (_board[row][currentCol]!.player != isWhite) {
//         validMoves.add(Location(row, currentCol));
//         break;
//       } else {
//         break;
//       }
//     }

//     // Check valid moves vertically (down)
//     for (int row = currentRow + 1; row < 8; row++) {
//       if (_board[row][currentCol] == null) {
//         validMoves.add(Location(row, currentCol));
//       } else if (_board[row][currentCol]!.player != isWhite) {
//         validMoves.add(Location(row, currentCol));
//         break;
//       } else {
//         break;
//       }
//     }

//     // Check valid moves horizontally (left)
//     for (int col = currentCol - 1; col >= 0; col--) {
//       if (_board[currentRow][col] == null) {
//         validMoves.add(Location(currentRow, col));
//       } else if (_board[currentRow][col]!.player != isWhite) {
//         validMoves.add(Location(currentRow, col));
//         break;
//       } else {
//         break;
//       }
//     }

//     // Check valid moves horizontally (right)
//     for (int col = currentCol + 1; col < 8; col++) {
//       if (_board[currentRow][col] == null) {
//         validMoves.add(Location(currentRow, col));
//       } else if (_board[currentRow][col]!.player != isWhite) {
//         validMoves.add(Location(currentRow, col));
//         break;
//       } else {
//         break;
//       }
//     }

//     return validMoves;
//   }

//   static List<Location> _getValidKnightMoves(
//     Piece piece,
//     Location loc,
//     bool isWhite,
//   ) {
//     List<Location> validMoves = [];
//     int currentRow = loc.row;
//     int currentCol = loc.col;
//     final knightMoves = [
//       Location(currentRow - 2, currentCol - 1),
//       Location(currentRow - 2, currentCol + 1),
//       Location(currentRow - 1, currentCol - 2),
//       Location(currentRow - 1, currentCol + 2),
//       Location(currentRow + 1, currentCol - 2),
//       Location(currentRow + 1, currentCol + 2),
//       Location(currentRow + 2, currentCol - 1),
//       Location(currentRow + 2, currentCol + 1),
//     ];

//     for (final move in knightMoves) {
//       if (move.isValid() &&
//           (_board[move.row][move.col] == null ||
//               _board[move.row][move.col]!.player != isWhite)) {
//         validMoves.add(move);
//       }
//     }

//     return validMoves;
//   }

//   static List<Location> _getValidBishopMoves(
//     Piece piece,
//     Location loc,
//     bool isWhite,
//   ) {
//     List<Location> validMoves = [];
//     int currentRow = loc.row;
//     int currentCol = loc.col;

//     // Check valid moves diagonally (up-left)
//     for (int row = currentRow - 1, col = currentCol - 1;
//         row >= 0 && col >= 0;
//         row--, col--) {
//       if (_board[row][col] == null) {
//         validMoves.add(Location(row, col));
//       } else if (_board[row][col]!.player != isWhite) {
//         validMoves.add(Location(row, col));
//         break;
//       } else {
//         break;
//       }
//     }

//     // Check valid moves diagonally (up-right)
//     for (int row = currentRow - 1, col = currentCol + 1;
//         row >= 0 && col < 8;
//         row--, col++) {
//       if (_board[row][col] == null) {
//         validMoves.add(Location(row, col));
//       } else if (_board[row][col]!.player != isWhite) {
//         validMoves.add(Location(row, col));
//         break;
//       } else {
//         break;
//       }
//     }

//     // Check valid moves diagonally (down-left)
//     for (int row = currentRow + 1, col = currentCol - 1;
//         row < 8 && col >= 0;
//         row++, col--) {
//       if (_board[row][col] == null) {
//         validMoves.add(Location(row, col));
//       } else if (_board[row][col]!.player != isWhite) {
//         validMoves.add(Location(row, col));
//         break;
//       } else {
//         break;
//       }
//     }

//     // Check valid moves diagonally (down-right)
//     for (int row = currentRow + 1, col = currentCol + 1;
//         row < 8 && col < 8;
//         row++, col++) {
//       if (_board[row][col] == null) {
//         validMoves.add(Location(row, col));
//       } else if (_board[row][col]!.player != isWhite) {
//         if (_board[row][col]!.type == PieceType.king &&
//             _board[row][col]!.player == isWhite) {
//           continue;
//         }
//         validMoves.add(Location(row, col));
//         break;
//       } else {
//         break;
//       }
//     }

//     return validMoves;
//   }

//   static List<Location> _getValidQueenMoves(
//     Piece piece,
//     Location loc,
//     bool isWhite,
//   ) {
//     List<Location> validMoves = [];
//     validMoves.addAll(_getValidRookMoves(piece, loc, isWhite));
//     validMoves.addAll(_getValidBishopMoves(piece, loc, isWhite));
//     return validMoves;
//   }

//   static List<Location> _getValidKingMoves(
//       Piece piece, Location loc, bool isWhite) {
//     List<Location> validMoves = [];
//     int currentRow = loc.row;
//     int currentCol = loc.col;
//     final kingMoves = [
//       Location(currentRow - 1, currentCol - 1),
//       Location(currentRow - 1, currentCol),
//       Location(currentRow - 1, currentCol + 1),
//       Location(currentRow, currentCol - 1),
//       Location(currentRow, currentCol + 1),
//       Location(currentRow + 1, currentCol - 1),
//       Location(currentRow + 1, currentCol),
//       Location(currentRow + 1, currentCol + 1),
//     ];
//     var oldPiece = _board[loc.row][loc.col];
//     oldKing = true;
//     _board[loc.row][loc.col] = null;

//     for (final move in kingMoves) {
//       if (move.isValid() &&
//           (_board[move.row][move.col] == null ||
//               _board[move.row][move.col]!.player != isWhite)) {
//         // Check if the king is still in check after the move
//         if (!_isKingInCheck(move)) {
//           validMoves.add(move);
//         }
//       }
//     }
//     _board[loc.row][loc.col] = oldPiece;
//     oldKing = false;
//     return validMoves;
//   }

//   static bool _isKingInCheck(Location kingLoc) {
//     // Check if any opponent's pieces can attack the king's location

//     for (int row = 0; row < 8; row++) {
//       for (int col = 0; col < 8; col++) {
//         final piece = _board[row][col];
//         final loc = Location(row, col);

//         if (piece != null && piece.player != _currentPiece!.player) {
//           if (piece.type == PieceType.king) {
//             continue;
//           }
//           final List<Location> inValidMoves =
//               _getValidMoves(piece, loc, !_currentPiece!.player);
//           for (int i = 0; i < inValidMoves.length; i++) {
//             Location currentLoc = inValidMoves[i];
//             if (currentLoc.instant() == kingLoc.instant()) {
//               return true;
//             }
//           }
//         }
//       }
//     }

//     return false; // The king is not in check
//   }
// }
