import 'package:flutter/material.dart';

import 'package:flutter_app/Quiz.dart';
import 'package:flutter_app/result.dart';

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
      'questionText': 'Q1. Bệnh gì bác sĩ bó tay?',
      'answers': [
        {'text': 'Gãy tay', 'score': 10},
        {'text': 'Đau đầu', 'score': -2},
        {'text': 'Gãy chân', 'score': -5},
        {'text': 'Tê liệt', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. Có 1 đàn chim đậu trên cành, người thợ săn bắn cái rằm. Hỏi chết mấy con??',
      'answers': [
        {'text': '13', 'score': -2},
        {'text': '14', 'score': -2},
        {'text': '15', 'score': 10},
        {'text': '16', 'score': -5},
      ],
    },
    {
      'questionText': ' Q3.  Sở thú bị cháy ,đố bạn con gì chạy ra đầu tiên?',
      'answers': [
        {'text': 'sư tử', 'score': -2},
        {'text': 'hươu', 'score': -5},
        {'text': 'khỉ', 'score': -2},
        {'text': 'con người', 'score': 10},
      ],
    },
    {
      'questionText': 'Q4. Mỗi năm có 7 tháng 31 ngày. Đố bạn có bao nhiêu tháng có 28 ngày?',
      'answers': [
        {'text': '1', 'score': -2},
        {'text': '5̀', 'score': -2},
        {'text': '10', 'score': -2},
        {'text': '12', 'score': 10},
      ],
    },
    {
      'questionText':
      'Q5. Con mèo nào cực kỳ sợ chuột?',
      'answers': [
        {
          'text': 'Tom',
          'score': -5,
        },
        {'text': 'Doraemon', 'score': 10},
        {'text': 'Mèo hylap', 'score': -5},
        {'text': 'Mèo Viêt Nam', 'score': -5},
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
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
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
          title: Text('Quiz App'),
          backgroundColor: Color(0xFF00E676),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
