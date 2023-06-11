import 'package:flutter/material.dart';
import 'package:plec_app_flutter/models/models.dart';
import 'package:plec_app_flutter/models/questions.dart';
import 'package:plec_app_flutter/services/questions_provider.dart';
import 'package:provider/provider.dart';

import '../global/enviroment.dart';
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
        description:
            "Asumiendo que se tiene una lista de empleados, en el que los empleados tienen las propiedades sueldo, nif, nombre y cargo. ¿Que método debería utilizar para obtener una lista con los empleados que tengan el cargo 'gerente'?",
        type: "simple-selection",
        image:
            "${Enviroment.apiUrl}/questions/files/6405ab134dbad86d13b9bf4c.png",
        difficulty: 3,
        answers: [
          Answer(text: "map", val: 0),
          Answer(text: "filter", val: 1),
          Answer(text: "forEach", val: 0),
          Answer(text: "find", val: 0),
        ],
        professor:
            Professor(id: '1', name: "Gabo", email: "costanzag1999@gmail.com"),
        tags: [
          Tag(
              id: "6405a95f4dbad86d13b9bf45",
              name: "javascript",
              color: "0xFFead41c")
        ]),
    Question(
        id: '1',
        description: "¿Cúal de las siguientes afirmaciones son verdaderas?",
        type: "multiple-selection",
        difficulty: 3,
        answers: [
          Answer(text: "Javascript es un lenguaje de programación", val: 1),
          Answer(text: "1 == '1' retorna true", val: 1),
          Answer(
              text:
                  "Las clases pueden tener múltiples constructores utilizando la sobrecarga",
              val: 0),
        ],
        professor:
            Professor(id: '1', name: "Gabo", email: "costanzag1999@gmail.com"),
        tags: [
          Tag(
              id: "6405a95f4dbad86d13b9bf45",
              name: "javascript",
              color: "0xFFead41c")
        ]),
    Question(
        id: '1',
        description: "¿Es javascript un lenguaje compilado?",
        type: "true-false",
        difficulty: 3,
        answers: [
          Answer(text: "Verdadero", val: 0),
          Answer(text: "Falso", val: 1),
        ],
        professor:
            Professor(id: '1', name: "Gabo", email: "costanzag1999@gmail.com"),
        tags: [
          Tag(
              id: "6405a95f4dbad86d13b9bf45",
              name: "javascript",
              color: "0xFFead41c")
        ]),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReusableCard(
              text: quesAnsList.questions[_currentIndexNumber].description,
              image: quesAnsList.questions[_currentIndexNumber].image),
          checkType(),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
                onPressed: () {
                  showNextCard();
                },
                child: const Text('Next')),
          ),
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