import 'package:flutter/material.dart';
//
// void main() {
//   runApp(TetrisApp());
// }
//
// class TetrisApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Tetris',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: TetrisScreen(),
//     );
//   }
// }

class ClickColorChange extends StatefulWidget {
  @override
  _ClickColorChangeState createState() => _ClickColorChangeState();
}

class _ClickColorChangeState extends State<ClickColorChange> {
  late List<List<bool>> grid;

  @override
  void initState() {
    super.initState();
    // Initialize the grid
    grid = List.generate(8, (_) => List.generate(8, (_) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tetris'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemCount: 64,
              itemBuilder: (context, index) {
                final row = index ~/ 8;
                final col = index % 8;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      grid[row][col] = !grid[row][col];
                    });
                  },
                  child: Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.black)
                    // ),
                    color: grid[row][col] ? Colors.green : Colors.grey,
                  ),
                );
              },
            ),
          ),
          // Example Tetris blocks
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TetrisBlock(),
              TetrisBlock(),
              TetrisBlock(),
            ],
          ),
        ],
      ),
    );
  }
}

class TetrisBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.red,
      ),
      feedback: Container(
        width: 50,
        height: 50,
        color: Colors.red.withOpacity(0.5),
      ),
      childWhenDragging: Container(
        width: 50,
        height: 50,
        color: Colors.red.withOpacity(0.2),
      ),
    );
  }
}
