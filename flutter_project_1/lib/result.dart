import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int score;
  final Function resetFunction;

  const ResultWidget({this.score, this.resetFunction});

  String get resultPhase {
    String resultText;

    if (score <= 15) {
      resultText = 'You are awesome and innocent';
    } else if (score <= 20) {
      resultText = 'Your are...';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(resultPhase,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
          Text('Your score is $score'),
          FlatButton(
            onPressed: resetFunction,
            child: Text('Restart Quiz'),
          )
        ],
      ),
    );
  }
}
