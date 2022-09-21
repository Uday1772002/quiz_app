import 'package:flutter/cupertino.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;
  Quiz({
    @required this.questions,
    @required this.answerQuestion,
    @required this.questionIndex,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          //here we added questiontext because we did map for th above 3 questions so we added to get acces to map
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          // actually we get error we do not add 'as String' but i am not getting any error so it depends on which version you are using
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
