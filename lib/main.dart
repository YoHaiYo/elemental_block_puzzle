import 'package:flutter/material.dart';

void main() {
  runApp(DragAndDropApp());
}

class DragAndDropApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Drag and Drop'),
        ),
        body: DragAndDropScreen(),
      ),
    );
  }
}
//
class DragAndDropScreen extends StatefulWidget {
  @override
  _DragAndDropScreenState createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
  bool isBlockDropped = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DragAndDropSquare(
          onDropped: () {
            setState(() {
              isBlockDropped = true;
            });
          },
        ),
        Positioned(
          left: 15,
          top: 15,
          child: Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              color: isBlockDropped ? Colors.deepOrange : Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}

class DragAndDropSquare extends StatefulWidget {
  final Function onDropped;

  DragAndDropSquare({required this.onDropped});

  @override
  _DragAndDropSquareState createState() => _DragAndDropSquareState();
}

class _DragAndDropSquareState extends State<DragAndDropSquare> {
  double xPos = 0;
  double yPos = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          xPos += details.delta.dx;
          yPos += details.delta.dy;
        });
      },
      onPanEnd: (DragEndDetails details) {
        widget.onDropped();
      },
      child: Stack(
        children: [
          Positioned(
            left: xPos,
            top: yPos,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
