import 'package:flutter/material.dart';

class PlayOffline extends StatelessWidget {
  const PlayOffline({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Play Offline',
      style: TextStyle(
        fontSize: 20,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
