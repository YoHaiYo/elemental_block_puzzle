import 'package:flutter/material.dart';


class DragAndDropColorChange extends StatefulWidget {
  @override
  _DragAndDropColorChangeState createState() => _DragAndDropColorChangeState();
}

class _DragAndDropColorChangeState extends State<DragAndDropColorChange> {
  bool isBlockDropped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DragAndDropScreen"),
      ),
      body: Stack(
        children: [
          /// 드래그 상자 (아래에서 정의함)
          DragAndDropSquare(
            onDropped: () {
              setState(() {
                isBlockDropped = true;
              });
            },
          ),
          /// 드래그 할 상자의 초기위치
          Positioned(
            left: 150,
            top: 150,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                /// 걍 드래그만 하면 색이 변하도록 코드가 작성됨.
                color: isBlockDropped ? Colors.deepOrange : Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class DragAndDropSquare extends StatefulWidget {
  final Function onDropped;

  DragAndDropSquare({required this.onDropped});

  @override
  _DragAndDropSquareState createState() => _DragAndDropSquareState();
}

/// 드래그 상자에 대해 정의

class _DragAndDropSquareState extends State<DragAndDropSquare> {
  /// 드래그 상자의 초기 위치 설정
  double xPos = 50;
  double yPos = 50;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      /// 드래그 할때 위치 바뀌는걸 업데이트
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          xPos += details.delta.dx;
          yPos += details.delta.dy;
        });
      },
      /// 드래그 종료 했을때 이벤트 처리
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
