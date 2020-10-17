import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "What's your favorite color?",
      'answers': [
        {'text': 'Blue', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Red', 'score': 7},
        {'text': 'Yellow', 'score': 3}
      ]
    },
    {
      'questionText': "What's your favorite animal?",
      'answers': [
        {'text': 'Horse', 'score': 3},
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 5},
        {'text': 'Bird', 'score': 1}
      ]
    },
    {
      'questionText': "What's your favorite city?",
      'answers': [
        {'text': 'Seattle', 'score': 10},
        {'text': 'NYC', 'score': 7},
        {'text': 'LA', 'score': 1},
        {'text': 'New Orleans', 'score': 5}
      ]
    },
  ];

  var _questionIdx = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIdx = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIdx = _questionIdx + 1;
    });
    print(_questionIdx);
    if (_questionIdx < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('My First App'),
      ),
      body: _questionIdx < _questions.length
          ? Quiz(
              questions: _questions,
              answerQuestion: _answerQuestion,
              questionIdx: _questionIdx,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
