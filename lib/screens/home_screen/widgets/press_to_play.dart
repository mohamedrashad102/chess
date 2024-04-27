import 'package:flutter/material.dart';

class PressToPlay extends StatelessWidget {
  const PressToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Press to play',
      style: TextStyle(
        fontSize: 20,
        color: Colors.grey,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
