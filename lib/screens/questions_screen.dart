import 'package:flutter/material.dart';
import 'package:plec_app_flutter/models/models.dart';
import 'package:plec_app_flutter/models/questions.dart';
import 'package:plec_app_flutter/providers/questions_provider.dart';
import 'package:provider/provider.dart';

import '../models/question.dart';
import '../services/questions_service.dart';
import '../widgets/widgets.dart'
    show MultipleSelectionWidget, ReusableCard, SimpleSelectionWidget;

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _currentIndexNumber = 0;
  QuestionsList quesAnsList = QuestionsList(questions: []);
  @override
  initState() {
    super.initState();
    questionService.cargarQuestions(context);
  }

  @override
  Widget build(BuildContext context) {
    // final questionsProvider = Provider.of<QuestionsProvider>(context);

    // getQuestions(questionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PLEC / APP'),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: questionService.questionsStream,
          builder: (context, AsyncSnapshot<QuestionsList> snapshot) {
            return snapshot.hasData
                ? QuestionsWidget(snapshot.data!)
                : const Center(child: Text("No hay datos"));
            // Center(
            //     child: Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     ReusableCard(
            //         text: quesAnsList
            //             .questions[_currentIndexNumber].description,
            //         image: quesAnsList.questions[_currentIndexNumber].image),
            //     checkType(),
            //     ElevatedButton5(
            //         onPressed: () {
            //           showNextCard();
            //         },
            //         child: const Text('Next')),
            //   ],
            // ));
          }),
    );
  }

  // Future<dynamic> getQuestions(QuestionsProvider questionsProvider) async {
  //   await questionsProvider.getQuestions().then((value) => quesAnsList = value);
  //   print(quesAnsList);
  // }

  // void showNextCard() {
  //   setState(() {
  //     _currentIndexNumber =
  //         (_currentIndexNumber + 1 < quesAnsList.questions.length)
  //             ? _currentIndexNumber + 1
  //             : 0;
  //   });
  // }

  // Widget checkType() {
  //   if (quesAnsList.questions[_currentIndexNumber].type == "true-false" ||
  //       quesAnsList.questions[_currentIndexNumber].type == "simple-selection") {
  //     return SimpleSelectionWidget(
  //         answers: quesAnsList.questions[_currentIndexNumber].answers);
  //   } else if (quesAnsList.questions[_currentIndexNumber].type ==
  //       "multiple-selection") {
  //     return MultipleSelectionWidget(
  //       answers: quesAnsList.questions[_currentIndexNumber].answers,
  //     );
  //   } else {
  //     return const Text("No type");
  //   }
  // }
}
//"multiple-selection"
//order
//written

class QuestionsWidget extends StatefulWidget {
  final QuestionsList questions;

  const QuestionsWidget(this.questions);

  @override
  State<QuestionsWidget> createState() => _QuestionsWidgetState();
}

int _currentIndexNumber = 0;

class _QuestionsWidgetState extends State<QuestionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ReusableCard(
            text: widget.questions.questions[_currentIndexNumber].description,
            image: widget.questions.questions[_currentIndexNumber].image),
        checkType(),
        ElevatedButton(
            onPressed: () {
              showNextCard();
            },
            child: const Text('Next')),
      ],
    ));
  }

  void showNextCard() {
    setState(() {
      _currentIndexNumber =
          (_currentIndexNumber + 1 < widget.questions.questions.length)
              ? _currentIndexNumber + 1
              : 0;
    });
  }

  Widget checkType() {
    if (widget.questions.questions[_currentIndexNumber].type == "true-false" ||
        widget.questions.questions[_currentIndexNumber].type ==
            "simple-selection") {
      return SimpleSelectionWidget(
          answers: widget.questions.questions[_currentIndexNumber].answers);
    } else if (widget.questions.questions[_currentIndexNumber].type ==
        "multiple-selection") {
      return MultipleSelectionWidget(
        answers: widget.questions.questions[_currentIndexNumber].answers,
      );
    } else {
      return const Text("No type");
    }
  }
}
