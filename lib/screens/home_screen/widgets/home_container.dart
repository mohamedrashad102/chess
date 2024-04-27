import 'package:chess/cubit/game_cubit/game_cubit.dart';
import 'package:flutter/material.dart';


class HomeContainer extends StatelessWidget {
  const HomeContainer(
    this.data, {
    super.key,
    this.withComputer = false,
  });
  final String data;
  final bool withComputer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (withComputer) {
          GameCubit.instance(context).playGameWithComputer(context);
        } else {
           GameCubit.instance(context).playGameOverTheBoard(context);
        }
      },
      child: Container(
        width: 250,
        height: 50,
        decoration: const BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 2,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          data,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade200,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
