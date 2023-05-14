//stl : stateless 위젯 생성 단축키
//stf : statefull 위젯 생성 단축키

import 'package:elemental_block_puzzle/storage/physics_card_drag_demo.dart';
import 'package:elemental_block_puzzle/trying/draggable_widget.dart';
import 'package:elemental_block_puzzle/trying/drop_tracker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'storage/click_color_change.dart';
import 'storage/click_puzzle.dart';
import 'storage/drag_n_drag_color_change.dart';
import 'storage/grid.dart';
import 'storage/official_drag_ui.dart';
import 'trying/trying.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // containter
    return Scaffold(
      appBar: AppBar(
        title: Text("원소퍼즐게임 기획"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 제작중
            button2(
                context: context,
                text: "ElementalPuzzle",
                page: ElementalPuzzle()),
            /// 참고 원본파일


            button1(
                context: context,
                text: "DraggableWidget",
                page: DraggableWidget()),
            button1(
                context: context,
                text: "DropTracker",
                page: DropTracker()),
            button1(
                context: context,
                text: "OfficialFoodOrder",
                page: OfficialFoodOrder()),

            /// 참고 기타파일
            button3(
                context: context,
                text: "PhysicsCardDragDemo",
                page: PhysicsCardDragDemo()),

            button3(
                context: context,
                text: "PuzzleGame",
                page: PuzzleGame()),
            button3(
                context: context,
                text: "ClickColorChange",
                page: ClickColorChange()),
            button3(
                context: context,
                text: "DragAndDrop ColorChange",
                page: DragAndDropColorChange()),

            button3(
                context: context,
                text: "GridViewScreen",
                page: GridViewScreen()),

          ],
        ),
      ),
    );
  }

  /// button1 : 파랑버튼
  Widget button1({
    required BuildContext context,
    required String text,
    // page : 이동하려는 화면
    required Widget page,
  }) {
    return Container(
      //double.infinity : 최대값 사용
      width: double.infinity, height: 70, padding: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        //onPressed : 버튼눌렀을때 활성화싴킴
        onPressed: () {
          print('HomeScreen.button 입니다.');
          // 화면이동
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return page;
            },
          ));
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  /// button2 : 빨강버튼

  Widget button2({
    required BuildContext context,
    required String text,
    // page : 이동하려는 화면
    required Widget page,
  }) {
    return Container(
      //double.infinity : 최대값 사용
      width: double.infinity, height: 70, padding: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        ),
        //onPressed : 버튼눌렀을때 활성화싴킴
        onPressed: () {
          print('HomeScreen.button 입니다.');
          // 화면이동
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return page;
            },
          ));
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  /// button3 : 초록버튼
  Widget button3({
    required BuildContext context,
    required String text,
    // page : 이동하려는 화면
    required Widget page,
  }) {
    return Container(
      //double.infinity : 최대값 사용
      width: double.infinity, height: 70, padding: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        ),
        //onPressed : 버튼눌렀을때 활성화싴킴
        onPressed: () {
          print('HomeScreen.button 입니다.');
          // 화면이동
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return page;
            },
          ));
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

}