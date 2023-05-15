import 'dart:ffi';

import 'package:flutter/material.dart';

/// https://youtu.be/_Bcio5dsYEg

class DraggableShaping extends StatefulWidget {
  const DraggableShaping({Key? key}) : super(key: key);

  @override
  State<DraggableShaping> createState() => _DraggableShapingState();
}

class _DraggableShapingState extends State<DraggableShaping> {
  /// 변수 정의
  Color originColor = Colors.black26; // 드래그타켓 블록 시작 색상
  Color firstColor = Colors.orangeAccent; // 드래그할 블록 색상 & 드래그되고 바뀔 색상
  String moveBlockText = "Box";
  
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DraggableShaping"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10,),
            Row(
              children: [
                blockI(),
              ],
            ),
            Row(
              children: [

              ],
            ),
            SizedBox(height: 10,),
            Draggable(
              /// 드롭되고 보여줄 색상
                data: firstColor,
                child: Container(
                  width: targetBlockWidth*0.75,
                  height: targetBlockHeight*0.75,
                  /// 드래그할 블록 색상
                  color: firstColor,
                  // color: Colors.orangeAccent,

                  child: Center(
                    child: Text(
                      moveBlockText,
                    ),
                  ),
                ),
                onDraggableCanceled: (velocity, offset) {},
                feedback: Container(
                  width: targetBlockWidth,
                  height: targetBlockHeight,
                  color: firstColor.withOpacity(0.5),
                  child: Center(
                    child: Text(
                      moveBlockText,
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  /// DragTarget 블록 변수 정의
  double targetBlockWidth = 50;
  double targetBlockHeight = 50;
  double targetBlockPadding = 2;
  String targetBlockText = "Drag Here";
  Color targetBlockShade = Colors.orange.shade200;


  /// 블록 종류 만들기
  Widget blockI(){
    return DragTarget(
        /// onAccept: 드롭했을때 발생할 이벤트 표시.
        /// 여기선 originColor가 Draggable 위젯의 data 색상을 받아옴.
        onAccept: (Color color){
          originColor = color;
        },
        builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected
            ) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(targetBlockPadding),
                child: Container(
                  width : targetBlockWidth,
                  height: targetBlockHeight,
                  /// DragTarget에 드롭되기 전에 비어있는(isEmpty) 상태에서 보여줄 색상 지정
                  color: accepted.isEmpty ? originColor : targetBlockShade,
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Center(
                    child: Text(targetBlockText),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(targetBlockPadding),
                child: Container(
                  width : targetBlockWidth,
                  height: targetBlockHeight,
                  /// DragTarget에 드롭되기 전에 비어있는(isEmpty) 상태에서 보여줄 색상 지정
                  color: accepted.isEmpty ? originColor : targetBlockShade,
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Center(
                    child: Text(targetBlockText),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(targetBlockPadding),
                child: Container(
                  width : targetBlockWidth,
                  height: targetBlockHeight,
                  /// DragTarget에 드롭되기 전에 비어있는(isEmpty) 상태에서 보여줄 색상 지정
                  color: accepted.isEmpty ? originColor : targetBlockShade,
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Center(
                    child: Text(targetBlockText),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(targetBlockPadding),
                child: Container(
                  width : targetBlockWidth,
                  height: targetBlockHeight,
                  /// DragTarget에 드롭되기 전에 비어있는(isEmpty) 상태에서 보여줄 색상 지정
                  color: accepted.isEmpty ? originColor : targetBlockShade,
                  // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Center(
                    child: Text(targetBlockText),
                  ),
                ),
              ),
            ],
          );
        },
      );
  }



}
