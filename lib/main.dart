import 'package:flutter/material.dart';
import 'package:quiz/questions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int questionNumber = 0;
  List<String> questions = [
    "Luffy once held Captian John\'s bracelet that lead\'s to his greates treasure.",
    "Joy Boy made fish men build noah so that he can lead them to the land.",
    "Reilygh is the first person to use conqurer\'s haki in the Anime.",
    "Yasuie let kinemon and others to steal money from him.",
    "Name of the commander that Black Beard killed on Whitebeard ship is kasumi."
  ];

  List<bool> answers = [true, false, false, true, false];
  bool userAnswer;
  int score = 0;

  void answered() {
    if (userAnswer == answers[questionNumber]) {
      score += 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: questionNumber <= 4
          ? SafeArea(
              child: Scaffold(
                backgroundColor: Colors.black12,
                appBar: AppBar(
                  backgroundColor: Colors.purple,
                  title: Text(
                    'Quizzler',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Question(questions[questionNumber]),
                    Expanded(
                      flex: 1,
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                        child: FlatButton(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'True',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.green,
                          onPressed: () {
                            setState(() {
                              userAnswer = true;
                              answered();
                              questionNumber++;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                        child: FlatButton(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'False',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.red,
                          onPressed: () {
                            setState(() {
                              userAnswer = false;
                              answered();
                              questionNumber++;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SafeArea(
              child: Scaffold(
                body: Center(
                  child: Text(
                    'You completed the quiz with $score/5 correct answers.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[700],
                      decoration: null,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
