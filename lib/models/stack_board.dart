import 'package:chess/models/board.dart';
import 'package:chess/services/chess_services/chess_initial_board/chess_initial_board.dart';

class StackBoard {
  final List<Board> _list = [ChessInitialBoard.instance()];

  void push(Board board) => _list.add(board);

  void pop() => _list.removeLast();

  void update ( Board board) => _list.last = board;

  Board get peek => _list.last;

  int get length => _list.length;

  Board atIndex(int index) => _list[index];

  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  @override
  String toString() => _list.toString();
}
