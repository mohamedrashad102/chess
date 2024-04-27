import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:chess/constants.dart';
import 'package:chess/models/piece.dart';
import 'package:chess/models/position.dart';

import '../services/chess_services/chess_attack_moves/chess_attack_moves.dart';
import '../services/chess_services/chess_valid_moves/chess_valid_moves.dart';

class Board {
  Board(this._board);

  final List<List<Piece>> _board;
  Piece? _lastMovePiece;
  Piece? _oldMovePiece;
  Piece? _selectedPiece;
  List<Position> _validMoves = [];
  Player _currentPlayer = Player.white;
  int whiteScore = 36;
  int blackScore = 36;
  List<bool> _isWhiteKingInCheck = [false];
  List<bool> _isBlackKingInCheck = [false];
  bool _isFirstWhiteKingMove = false;
  bool _isFirstBlackKingMove = false;
  List<bool> _isFirstWhiteRookMove = [false, false];
  List<bool> _isFirstBlackRookMove = [false, false];

  Piece? get lastMovePiece => _lastMovePiece;
  Piece? get oldMovePiece => _oldMovePiece;
  Piece? get selectedPiece => _selectedPiece;
  List<Position> get validMoves => _validMoves;
  Player get currentPlayer => _currentPlayer;
  List<bool> get isWhiteKingInCheck => _isWhiteKingInCheck;
  List<bool> get isBlackKingInCheck => _isBlackKingInCheck;
  bool get isFirstWhiteKingMove => _isFirstWhiteKingMove;
  bool get isFirstBlackKingMove => _isFirstBlackKingMove;
  Board get board => Board(_board);

  bool press(Position pos) {
    Piece piece = getPiece(pos);
    if (piece.player == _currentPlayer) {
      _selectPiece(piece);
      return false;
    } else {
      return _movePiece(piece);
    }
  }

  void setPiece(Piece piece) =>
      _board[piece.position.row][piece.position.col] = piece;

  Piece getPiece(Position pos) => _board[pos.row][pos.col];

  Board newInstance() {
    List<List<Piece>> newBoard =
        _board.map((list) => List<Piece>.from(list)).toList();
    return Board(newBoard);
  }

  static isValidPosition(Position loc) =>
      loc.row >= 0 && loc.row < 8 && loc.col >= 0 && loc.col < 8;

  @override
  String toString() => _board.toString();

  Piece getKing(Player player) {
    late Piece kingPiece;
    for (int i = 0; i < 8 * 8; i++) {
      var pos = Position.formIndex(i);
      var piece = _board[pos.row][pos.col];
      if (piece.type == PieceType.king && piece.player == player) {
        kingPiece = piece;
        break;
      }
    }
    return kingPiece;
  }

  bool isKingInCheck(Player kingPlayer) {
    var enemyPlayer = kingPlayer == Player.white ? Player.black : Player.white;
    var enemyAttackMoves = ChessAttackMoves.all(board, enemyPlayer);
    var kingPiece = board.getKing(kingPlayer);
    var inCheck = enemyAttackMoves.contains(kingPiece.position);
    return inCheck;
  }

  bool _movePiece(Piece piece) {
    if (_isValidMove(piece)) {
      updatePieces(selectedPiece!, piece, sound: true);
      _updateLastMove(piece);
      _updateCurrentPlayer();
      _updateIsKingsInCheck();
      _updateScore();
      _clearSelectedPiece();
      return true;
      // _updateFirstMoves();
    }
    return false;
  }

  void _updateIsKingsInCheck() {
    _isWhiteKingInCheck.add(isKingInCheck(Player.white));
    _isBlackKingInCheck.add(isKingInCheck(Player.black));
  }

  // void _updateFirstMoves() {
  //   if (_lastMovePiece == null) {
  //     return;
  //   }
  //   Player player = _lastMovePiece!.player;
  //   PieceType type = _lastMovePiece!.type;
  //   if (type == PieceType.king) {
  //     player == Player.white
  //         ? _isFirstWhiteKingMove = true
  //         : _isFirstBlackKingMove = true;
  //   }else if (type == PieceType.rook){
  //     if (player == Player.white){

  //     }
  //   }
  // }

  void _updateCurrentPlayer() {
    _currentPlayer =
        _currentPlayer == Player.white ? Player.black : Player.white;
  }

  void _updateLastMove(Piece piece) {
    _oldMovePiece = selectedPiece;
    _lastMovePiece = piece.newInstance();
  }

  void updatePieces(Piece selectedPiece, Piece piece, {bool sound = false}) {
    if (sound) {
      if (piece.type == PieceType.none) {
        _playSound(move: true);
      } else {
        _playSound(capture: true);
      }
    }
    var emptyPiece = Piece(
      type: PieceType.none,
      player: Player.none,
      position: selectedPiece.position,
      imagePath: null,
    );
    var newPiece = Piece(
      position: piece.position,
      player: selectedPiece.player,
      type: selectedPiece.type,
      imagePath: selectedPiece.imagePath,
    );
    setPiece(emptyPiece); // clear old piece
    setPiece(newPiece); // move old piece to new piece
  }

  bool _isValidMove(Piece piece) {
    if (_selectedPiece != null) {
      // he should select piece first
      if (_validMoves.contains(piece.position)) {
        // then press in valid piece to move
        return true;
      }
    }
    _clearSelectedPiece();
    return false;
  }

  _clearSelectedPiece() {
    _selectedPiece = null;
    _validMoves.clear();
  }

  void _selectPiece(Piece piece) {
    if (_selectedPiece != null && _selectedPiece!.position == piece.position) {
      // he pressed in the same piece
      _clearSelectedPiece();
    } else {
      // he pressed in new piece so get valid moves for it
      // _playSound(select: true);
      _updateSelectedPiece(piece);
    }
  }

  _playSound({bool select = false, bool move = false, bool capture = false}) {
    final audioPlayer = AudioPlayer();
    // if (select) {
    //   audioPlayer.play(AssetSource(ChessSounds.select));
    // } else
    if (move) {
      audioPlayer.play(AssetSource(ChessSounds.move));
    } else if (capture) {
      audioPlayer.play(AssetSource(ChessSounds.capture));
    }
  }

  void _updateSelectedPiece(Piece piece) {
    _selectedPiece = piece;
    _validMoves = ChessValidMoves.piece(board, _selectedPiece!);
  }

  _updateScore() {
    for (int i = 0; i < 8 * 8; i++) {
      var pos = Position.formIndex(i);
      var piece = getPiece(pos);
      switch (piece.type) {
        case PieceType.pawn:
          piece.player == Player.white ? whiteScore += 1 : blackScore += 1;
        case PieceType.knight:
          piece.player == Player.white ? whiteScore += 3 : blackScore += 3;
        case PieceType.bishop:
          piece.player == Player.white ? whiteScore += 3 : blackScore += 3;
        case PieceType.rook:
          piece.player == Player.white ? whiteScore += 5 : blackScore += 5;
        case PieceType.queen:
          piece.player == Player.white ? whiteScore += 9 : blackScore += 9;
        default:
          break;
      }
    }
  }
}
