class Time {
  final int minutes;
  final int seconds;

  Time(this.minutes, this.seconds);

  @override
  String toString() {
    return '$minutes : $seconds';
  }
}
