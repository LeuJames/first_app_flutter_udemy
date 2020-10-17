import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = 'You are a loser, score: ' + resultScore.toString();
    } else if (resultScore <= 12) {
      resultText = 'you aight, score: ' + resultScore.toString();
    } else {
      resultText = 'you lit dawg, score: ' + resultScore.toString();
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Text(resultPhrase,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              )),
          FlatButton(
            child: Text('Restart Quiz!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                )),
            textColor: Colors.blue,
            onPressed: resetHandler,
          )
        ],
      )),
    );
  }
}
