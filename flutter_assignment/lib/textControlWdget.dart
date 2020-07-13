import 'package:flutter/material.dart';

class TextControlWidget extends StatelessWidget {
  final Function changetext;

  const TextControlWidget({this.changetext});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: changetext,
      child: Text(
        'Change text',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
    );
  }
}
