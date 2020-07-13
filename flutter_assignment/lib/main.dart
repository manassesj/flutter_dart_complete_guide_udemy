import 'package:flutter/material.dart';
import 'package:flutter_assignment/textControlWdget.dart';
import 'package:flutter_assignment/textWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _textBelow = 'First Assignment';

  void changeText() {
    setState(() {
      _textBelow = 'Task submitted';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter assignment'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextWidget(
              textBelow: _textBelow,
            ),
            SizedBox(
              height: 20.0,
            ),
            TextControlWidget(
              changetext: changeText,
            )
          ],
        ),
      ),
    );
  }
}
