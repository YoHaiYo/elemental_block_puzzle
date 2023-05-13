import 'package:elemental_block_puzzle/trying/testing.dart';
import 'package:flutter/material.dart';

import 'official_drag_ui.dart';

void main() {
  // runApp : 앱을 실행 시키기 위해서 호출하는 함수
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Elemental Puzzle'),
        ),
        body: ElementalPuzzle(),
      ),
    );
  }
}

// void main() {
//   runApp(DragAndDropApp());
// }

// class DragAndDropApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('ElementalPuzzle'),
//         ),
//         body: ElementalPuzzle(),
//       ),
//     );
//   }
// }
