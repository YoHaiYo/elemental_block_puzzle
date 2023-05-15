import 'dart:ffi';

import 'package:flutter/material.dart';

/// https://youtu.be/_Bcio5dsYEg

class DraggableShaping extends StatefulWidget {
  const DraggableShaping({Key? key}) : super(key: key);

  @override
  State<DraggableShaping> createState() => _DraggableShapingState();
}

class _DraggableShapingState extends State<DraggableShaping> {
  Color originColor = Colors.red;

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
                _target(),
                _target(),
                _target(),
              ],
            ),
            Row(
              children: [
                _target(),
              ],
            ),
            SizedBox(height: 10,),
            Draggable(
              /// 드롭되고 보여줄 색상
                data: Colors.orangeAccent,
                child: Container(
                  width: 75,
                  height: 75,
                  color: Colors.orangeAccent,

                  child: const Center(
                    child: Text(
                      "Box",
                    ),
                  ),
                ),
                onDraggableCanceled: (velocity, offset) {},
                feedback: Container(
                  width: 100,
                  height: 100,
                  color: Colors.orangeAccent.withOpacity(0.5),
                  child: const Center(
                    child: Text(
                      "Box...",
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

  /// 드래그 될 부분 위젯으로 빼기
  Widget _target(){
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
          return Container(
            width : 100,
            height: 100,
            /// DragTarget에 드롭되기 전에 비어있는(isEmpty) 상태에서 보여줄 색상 지정
            color: accepted.isEmpty ? originColor : Colors.grey.shade200,
            // decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: const Center(
              child: Text("Drag Here"),
            ),
          );
        },
      );

  }
}
