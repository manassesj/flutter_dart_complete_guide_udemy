import 'package:flutter/material.dart';
import 'package:flutter_project_1/question.dart';

import 'answer.dart';

class QuizWidget extends StatelessWidget {
  final List questions;
  final int questionIndex;
  final Function answerQuestion;

  const QuizWidget(
      {@required this.questions,
      @required this.questionIndex,
      @required this.answerQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        QuestionWidget(
          questionText: questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((question) {
          return AnswerWidget(
            answerQuestion: () => answerQuestion(question['score']),
            answer: question['text'],
          );
        }).toList()
      ],
    );
  }
}
