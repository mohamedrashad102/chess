import 'package:flutter/material.dart';

import 'app_bar_board.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        children: [
        Icon(Icons.menu_outlined , size: 25,),
          SizedBox(width: 15),
          Text('chess.org' , style: TextStyle(color: Color.fromRGBO(238, 238, 238, 1)),),
          Spacer(),
          AppBarBoard(),
        ],
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
