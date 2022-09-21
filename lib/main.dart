import 'package:flutter/material.dart';
import 'package:aquiz_app/answer.dart';
import 'package:aquiz_app/result.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    //here{} means map we are using substitute of map widget or we can call function. here in {} we wrote 'questionText' it can be any other name but for our convinience we wrote it.

    {
      'questionText': 'how you doing..?',
      'answers': [
        {'text': 'fine', 'score': 9},
        {'text': 'not fine', 'score': 5},
        {'text': 'ok', 'score': 2},
        {'text': 'not ok', 'score': 1},
      ],
    },
    {
      'questionText': 'how much time do you spend on working  in a day',
      'answers': [
        {'text': '5-6 hours', 'score': 4},
        {'text': '6-7 hours', 'score': 6},
        {'text': '8-9 hours', 'score': 2},
        {'text': '4-5 hours', 'score': 9},
      ],
    },
    {
      'questionText': 'how was the day..?',
      'answers': [
        {'text': 'fine', 'score': 45},
        {'text': 'not fine', 'score': 52},
        {'text': 'ok', 'score': 21},
        {'text': 'not ok', 'score': 10},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + 1;
    //alternative _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('There are questions coming soon');
    } else {
      print('no more questions');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
