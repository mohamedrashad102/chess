// import 'package:flutter/material.dart';

// class Bott extends StatelessWidget {
//   const Bott({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     if (currentIndex > 0 && moves.isNotEmpty) {
//                       currentIndex--;
//                       _reload();
//                     }
//                   },
//                   icon: Icon(
//                     Icons.keyboard_double_arrow_left,
//                     color: currentIndex > 0 && moves.isNotEmpty
//                         ? Colors.blue
//                         : Colors.grey,
//                   )),
//               IconButton(
//                   onPressed: () {
//                     if (currentIndex < moves.length - 1) {
//                       currentIndex++;
//                       _reload();
//                     }
//                   },
//                   icon: Icon(
//                     Icons.keyboard_double_arrow_right,
//                     color: currentIndex != moves.length - 1
//                         ? Colors.blue
//                         : Colors.grey,
//                   )),
//             ],
//           ),
//         );
//   }
// }