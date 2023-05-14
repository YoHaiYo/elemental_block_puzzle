import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  const DraggableWidget({Key? key}) : super(key: key);

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Color originColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DraggableWidget"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Draggable(
              /// 드롭되고 보여줄 색상
                data: Colors.orangeAccent,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.orangeAccent,
                  child: const Center(
                    child: Text(
                      "Box",
                    ),
                  ),
                ),
                onDraggableCanceled: (velocity, offset) {},
                feedback: Container(
                  width: 150,
                  height: 150,
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
                )),
            DragTarget(
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
                  width: 200,
                  height: 200,
                  /// DragTarget에 드롭되기 전에 비어있는(isEmpty) 상태에서 보여줄 색상 지정
                  color: accepted.isEmpty ? originColor : Colors.grey.shade200,
                  child: const Center(
                    child: Text("Drag Here"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
