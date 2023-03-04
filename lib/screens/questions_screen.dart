import 'package:flutter/material.dart';
import 'package:plec_app_flutter/models/answer.dart';
import 'package:plec_app_flutter/models/question.dart';
import 'package:plec_app_flutter/widgets/reusable_card.dart';
import 'package:plec_app_flutter/widgets/true_false.dart';

import '../widgets/simple_selection.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _currentIndexNumber = 0;
  List<Question> quesAnsList = [
    Question(
        id: '1',
        title: "Gabo es tontisimo??",
        description: "description",
        type: "true_false",
        image: "image",
        difficulty: 1,
        answers: [
          Answer(text: "True", val: 1),
          Answer(text: "True", val: 0),
        ]),
    Question(
        id: '1',
        title: "Elige la orientación sexual de Gabo",
        description: "description",
        type: "simple_selection",
        image: "image",
        difficulty: 1,
        answers: [
          Answer(text: "Gay", val: 1),
          Answer(text: "Homosexual", val: 0),
          Answer(text: "Estonio", val: 1),
          Answer(
              text: "Militante del gobierno bolivariano social-comunista ",
              val: 0),
        ])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PLEC / APP'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ReusableCard(text: quesAnsList[_currentIndexNumber].title),
          checkType(),
          ElevatedButton(
              onPressed: () {
                showNextCard();
              },
              child: const Text('Next')),
        ],
      )),
    );
  }

  void showNextCard() {
    setState(() {
      _currentIndexNumber = (_currentIndexNumber + 1 < quesAnsList.length)
          ? _currentIndexNumber + 1
          : 0;
    });
  }

  Widget checkType() {
    if (quesAnsList[_currentIndexNumber].type == "true_false") {
      return SimpleSelectionWidget(
          answers: quesAnsList[_currentIndexNumber].answers);
    } else if (quesAnsList[_currentIndexNumber].type == "simple_selection") {
      return SimpleSelectionWidget(
          answers: quesAnsList[_currentIndexNumber].answers);
    } else {
      return const Text("No type");
    }
  }
}
