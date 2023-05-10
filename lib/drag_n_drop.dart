// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(DragAndDropApp());
// }
//
// class DragAndDropApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Drag and Drop'),
//         ),
//         body: DragAndDropSquare(),
//       ),
//     );
//   }
// }
//
// class DragAndDropSquare extends StatefulWidget {
//   @override
//   _DragAndDropSquareState createState() => _DragAndDropSquareState();
// }
//
// class _DragAndDropSquareState extends State<DragAndDropSquare> {
//   double xPos = 0;
//   double yPos = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onPanUpdate: (DragUpdateDetails details) {
//         setState(() {
//           xPos += details.delta.dx;
//           yPos += details.delta.dy;
//         });
//       },
//       child: Stack(
//         children: [
//           Positioned(
//             left: xPos,
//             top: yPos,
//             child: Container(
//               width: 100,
//               height: 100,
//               color: Colors.blue,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
