import 'package:flutter/material.dart';
import 'package:flutter_project_1/quiz.dart';
import 'package:flutter_project_1/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favorite color? ',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ]
    },
    {
      'questionText': 'What\' s your favorite animal? ',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Snake', 'score': 6},
        {'text': 'Dog', 'score': 5},
        {'text': 'Cat', 'score': 3},
      ]
    },
    {
      'questionText': 'Who\' s your favorite instructior? ',
      'answers': [
        {'text': 'Max', 'score': 10},
        {'text': 'Jonsons', 'score': 5},
        {'text': 'Mark', 'score': 3},
        {'text': 'Dk', 'score': 1},
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });
  }

  void resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        body: _questionIndex < questions.length
            ? QuizWidget(
                questions: questions,
                questionIndex: _questionIndex,
                answerQuestion: _answerQuestion,
              )
            : ResultWidget(
                score: _totalScore,
                resetFunction: resetQuiz,
              ),
      ),
    );
  }
}
