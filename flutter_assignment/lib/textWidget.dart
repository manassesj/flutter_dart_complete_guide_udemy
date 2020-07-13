import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String textBelow;

  TextWidget({this.textBelow});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.0,
      margin: EdgeInsets.only(top: 30.0),
      child: Text(
        textBelow,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
