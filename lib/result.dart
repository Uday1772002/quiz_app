import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  //if you are getting any error use VoiceCall back function

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (this.resultScore >= 5) {
      resultText = 'you are ducked up';
    } else if (this.resultScore <= 2) {
      resultText = 'pretty nice';
    } else if (this.resultScore <= 9) {
      resultText = 'you are akward';
    } else {
      resultText = 'you are the worst';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz',
            ),
            textColor: Colors.pink,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
