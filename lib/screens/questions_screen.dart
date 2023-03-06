import 'package:flutter/material.dart';
import 'package:plec_app_flutter/models/models.dart';
import 'package:plec_app_flutter/models/questions.dart';
import 'package:plec_app_flutter/providers/questions_provider.dart';
import 'package:provider/provider.dart';

import '../models/question.dart';
import '../widgets/widgets.dart'
    show MultipleSelectionWidget, ReusableCard, SimpleSelectionWidget;

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _currentIndexNumber = 0;
  QuestionsList quesAnsList = QuestionsList(questions: [
    Question(
        id: '1',
        description: "Gabo es tontisimo??",
        type: "true-false",
        image:
            "http://10.141.4.126:3000/api/questions/files/64047f0537807640ed96c60a.png",
        difficulty: 1,
        answers: [
          Answer(text: "True", val: 1),
          Answer(text: "True", val: 0),
        ],
        professor: Professor(id: '1', name: "Gabo", email: "Gabo es tontisimo"),
        tags: []),
    Question(
        id: '2',
        description: "Elige la orientación sexual de Gabo",
        type: "multiple-selection",
        difficulty: 1,
        answers: [
          Answer(text: "Gay", val: 1),
          Answer(text: "Homosexual", val: 0),
          Answer(text: "Estonio", val: 1),
          Answer(
              text: "Militante del gobierno bolivariano social-comunista ",
              val: 0),
        ],
        professor:
            Professor(id: '1', name: "Jaime", email: "Gabo es tontisimo"),
        tags: [])
  ]);
  @override
  Widget build(BuildContext context) {
    // final questionsProvider = Provider.of<QuestionsProvider>(context);

    // getQuestions(questionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PLEC / APP'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ReusableCard(
              text: quesAnsList.questions[_currentIndexNumber].description,
              image: quesAnsList.questions[_currentIndexNumber].image),
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

  Future<dynamic> getQuestions(QuestionsProvider questionsProvider) async {
    await questionsProvider.getQuestions().then((value) => quesAnsList = value);
    print(quesAnsList);
  }

  void showNextCard() {
    setState(() {
      _currentIndexNumber =
          (_currentIndexNumber + 1 < quesAnsList.questions.length)
              ? _currentIndexNumber + 1
              : 0;
    });
  }

  Widget checkType() {
    if (quesAnsList.questions[_currentIndexNumber].type == "true-false" ||
        quesAnsList.questions[_currentIndexNumber].type == "simple-selection") {
      return SimpleSelectionWidget(
          answers: quesAnsList.questions[_currentIndexNumber].answers);
    } else if (quesAnsList.questions[_currentIndexNumber].type ==
        "multiple-selection") {
      return MultipleSelectionWidget(
        answers: quesAnsList.questions[_currentIndexNumber].answers,
      );
    } else {
      return const Text("No type");
    }
  }
}
//"multiple-selection"
//order
//written