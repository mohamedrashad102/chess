import 'package:chess/screens/home_screen/widgets/home_container.dart';
import 'package:flutter/material.dart';

import 'home_board.dart';
import 'press_to_play.dart';
import 'play_offline.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          PlayOffline(),
          SizedBox(height: 15),
          HomeContainer('Computer', withComputer: true),
          SizedBox(height: 20),
          HomeContainer('Over the Board'),
          SizedBox(height: 20),
          PressToPlay(),
          SizedBox(height: 20),
          HomeBoard(),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
