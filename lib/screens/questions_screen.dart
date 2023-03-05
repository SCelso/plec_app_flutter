import 'package:flutter/material.dart';
import 'package:plec_app_flutter/models/models.dart';
import 'package:plec_app_flutter/providers/questions_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart'
    show MultipleSelectionWidget, ReusableCard, SimpleSelectionWidget;

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _currentIndexNumber = 0;
  List<Question> quesAnsList = [];

  @override
  initState() {
    super.initState();
    final questionsProvider = Provider.of<QuestionsProvider>(context);
    quesAnsList = Question.fromJson(
            questionsProvider.getQuestions() as Map<String, dynamic>)
        as List<Question>;
  }
  // List<Question> quesAnsList = [
  //   Question(
  //       id: '1',
  //       description: "Gabo es tontisimo??",
  //       type: "true-false",
  //       image:
  //           "https://marketplace.canva.com/EAE-xnqWvJk/1/0/1600w/canva-retro-smoke-and-round-light-desktop-wallpapers-JLofAI27pCg.jpg",
  //       difficulty: 1,
  //       answers: [
  //         Answer(text: "True", val: 1),
  //         Answer(text: "True", val: 0),
  //       ],
  //       professor: Professor(id: '1', name: "Gabo", email: "Gabo es tontisimo"),
  //       tags: []),
  //   Question(
  //       id: '2',
  //       description: "Elige la orientación sexual de Gabo",
  //       type: "multiple-selection",
  //       difficulty: 1,
  //       answers: [
  //         Answer(text: "Gay", val: 1),
  //         Answer(text: "Homosexual", val: 0),
  //         Answer(text: "Estonio", val: 1),
  //         Answer(
  //             text: "Militante del gobierno bolivariano social-comunista ",
  //             val: 0),
  //       ],
  //       professor:
  //           Professor(id: '1', name: "Jaime", email: "Gabo es tontisimo"),
  //       tags: [])
  // ];

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
          ReusableCard(
              text: quesAnsList[_currentIndexNumber].description,
              image: quesAnsList[_currentIndexNumber].image),
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
    if (quesAnsList[_currentIndexNumber].type == "true-false" ||
        quesAnsList[_currentIndexNumber].type == "simple-selection") {
      return SimpleSelectionWidget(
          answers: quesAnsList[_currentIndexNumber].answers);
    } else if (quesAnsList[_currentIndexNumber].type == "multiple-selection") {
      return MultipleSelectionWidget(
        answers: quesAnsList[_currentIndexNumber].answers,
      );
    } else {
      return const Text("No type");
    }
  }
}

//"multiple-selection"
//order
//written