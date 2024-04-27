class Position {
  final int row;
  final int col;

  Position(this.row, this.col);
  factory Position.formIndex(int index) {
    int row = index ~/ 8;
    int col = index % 8;
    return Position(row, col);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Position &&
          runtimeType == other.runtimeType &&
          row == other.row &&
          col == other.col;

  Position operator +(Position other) {
    return Position(row + other.row, col + other.col);
  }

  @override
  int get hashCode => row.hashCode ^ col.hashCode;

  @override
  String toString() {
    return '$row*$col';
  }
}
