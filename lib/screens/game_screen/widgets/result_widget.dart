// import 'package:flutter/material.dart';

// import '../../../services/chess_game.dart';

// class ResultWidget extends StatelessWidget {
//   const ResultWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 250,
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.green,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           const Text(
//             'Player 1 won',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                   ),
//                   onPressed: () {
//                     endGame = true;
//                   },
//                   child: const Text(
//                     'Cancel',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color.fromARGB(255, 13, 146, 21),
//                 ),
//                 onPressed: () {
//                   ChessGame.start();
//                   endGame = false;
//                 },
//                 child: const Text(
//                   'Play again',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
