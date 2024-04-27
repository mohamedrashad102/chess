import 'package:chess/models/time.dart';
import 'package:flutter/material.dart';

import '../../../models/piece.dart';
import 'time_widget.dart';

class PlayerNameAndTime extends StatelessWidget {
  const PlayerNameAndTime({
    super.key,
    required this.playerName,
    required this.player,
    required this.currentPlayer,
    required this.blackTime,
    required this.whiteTime,
  });
  final String playerName;
  final Player player;
  final Player currentPlayer;
  final Time whiteTime;
  final Time blackTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          playerName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        TimeWidget(
          currentPlayer: currentPlayer,
          time: player == Player.white
              ? whiteTime
              : blackTime,
          player: player,
        ),
      ],
    );
  }
}
