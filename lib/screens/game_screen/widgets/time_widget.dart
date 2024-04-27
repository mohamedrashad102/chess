import 'package:flutter/material.dart';

import '../../../models/piece.dart';
import '../../../models/time.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
    required this.currentPlayer,
    required this.time,
    required this.player,
  });

  final Player currentPlayer;
  final Player player;
  final Time time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: time.minutes < 1 && time.seconds < 15
            ? Colors.red.shade900
            : currentPlayer == player
                ? const Color.fromARGB(255, 9, 76, 18)
                : Colors.grey,
      ),
      child: Center(
        child: Text(
          time.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
