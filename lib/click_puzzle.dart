// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Puzzle Game',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Puzzle Game'),
//         ),
//         body: PuzzleGame(),
//       ),
//     );
//   }
// }
//
// class PuzzleGame extends StatefulWidget {
//   const PuzzleGame({Key? key}) : super(key: key);
//
//   @override
//   _PuzzleGameState createState() => _PuzzleGameState();
// }
//
// class _PuzzleGameState extends State<PuzzleGame> {
//   List<int> puzzleNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
//   bool isGameWon = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         itemCount: puzzleNumbers.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 if (!isGameWon) {
//                   int temp = puzzleNumbers[index];
//                   puzzleNumbers[index] = puzzleNumbers[0];
//                   puzzleNumbers[0] = temp;
//                   checkForWin();
//                 }
//               });
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black),
//               ),
//               child: Center(
//                 child: Text(
//                   puzzleNumbers[index].toString(),
//                   style: TextStyle(fontSize: 30),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   void checkForWin() {
//     bool isWin = true;
//     for (int i = 0; i < puzzleNumbers.length; i++) {
//       if (puzzleNumbers[i] != i + 1) {
//         isWin = false;
//         break;
//       }
//     }
//     if (isWin) {
//       setState(() {
//         isGameWon = true;
//       });
//     }
//   }
// }
