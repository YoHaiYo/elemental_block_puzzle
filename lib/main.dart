import 'package:flutter/material.dart';

import 'official_drag_ui.dart';

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
        body: ExampleDragAndDrop(),
      ),
    );
  }
}
//