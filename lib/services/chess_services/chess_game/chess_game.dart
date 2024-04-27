import 'dart:async';
import 'package:chess/models/board.dart';
import 'package:chess/models/move_model.dart';
import 'package:chess/models/piece.dart';
import 'package:chess/models/stack_board.dart';
import 'package:chess/services/chess_services/chess_engine/chess_engine.dart';
import 'package:chess/services/chess_services/chess_initial_board/chess_initial_board.dart';
import 'package:flutter/material.dart';

import '../../../models/position.dart';
import '../../../models/time.dart';

class ChessGame {
  ChessGame({this.withoutTime = false, this.withComputer = false});

  final bool withoutTime;
  final bool withComputer;
  final Board _board = ChessInitialBoard.instance();
  final StackBoard _moves = StackBoard();
  final ChessEngine _chessEngine = ChessEngine(Player.black);
  Player _winner = Player.none;
  Time _whiteTime = Time(10, 0);
  Time _blackTime = Time(10, 0);
  bool _isEndGame = false;
  void start() {
    if (withComputer) {
      _enableEngine();
    }
    if (!withoutTime) {
      _startTimer();
    }
  }

  StackBoard get moves => _moves;
  Time get whiteTime => _whiteTime;
  Time get blackTime => _blackTime;
  Player get winner => _winner;
  bool get isEndGame => _isEndGame;

  void press(Position pos) {
    debugPrint('------------------------');
    debugPrint('press');
    if (_winner != Player.none) {
      // game over
      return;
    }
    if (_board.press(pos)) {
      _moves.push(_board);
    } else {
      _moves.update(_board);
    }
    debugPrint('------------------------');
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    Timer.periodic(
      oneSecond,
      (timer) {
        if (_board.currentPlayer == Player.white) {
          if (_whiteTime.minutes == 0 && _whiteTime.seconds == 0) {
            _winner = Player.black;
            timer.cancel();
          } else {
            if (_whiteTime.seconds == 0) {
              _whiteTime = Time(_whiteTime.minutes - 1, 59);
            } else {
              _whiteTime = Time(_whiteTime.minutes, _whiteTime.seconds - 1);
            }
          }
        } else {
          if (_blackTime.minutes == 0 && _blackTime.seconds == 0) {
            _winner = Player.white;
            timer.cancel();
          } else {
            if (_blackTime.seconds == 0) {
              _blackTime = Time(_blackTime.minutes - 1, 59);
            } else {
              _blackTime = Time(_blackTime.minutes, _blackTime.seconds - 1);
            }
          }
        }
        if (_winner != Player.none) {
          timer.cancel();
        }
      },
    );
  }

  void _enableEngine() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (withComputer && _board.currentPlayer == Player.black) {
        MoveModel? engineMove = _chessEngine.move(_board);
        if (engineMove == null) {
          print('end game');
          // checkmate
          _endGame();
          return;
        }
        _board.press(engineMove.currentPiece.position);
        _board.press(engineMove.position);
      }
    });
  }

  _endGame() {
    _isEndGame = true;
    print('end game');
    _winner =
        _board.currentPlayer == Player.white ? Player.black : Player.white;
    print('$_winner won');
  }
}
