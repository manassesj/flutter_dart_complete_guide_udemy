import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final Function answerQuestion;
  final String answer;

  const AnswerWidget({this.answerQuestion, this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(answer),
        onPressed: answerQuestion,
      ),
    );
  }
}
