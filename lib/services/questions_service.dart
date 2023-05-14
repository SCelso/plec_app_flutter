import 'dart:async';

import 'package:plec_app_flutter/models/models.dart' show Answer, Question;
import 'package:plec_app_flutter/models/questions.dart';

class _QuestionsService {
  QuestionsList? _questions;
  int puntos = 0;

  final StreamController<QuestionsList> _questionsStreamController =
      StreamController<QuestionsList>.broadcast();

  QuestionsList? get questions => _questions;
  bool get questionListExists => (_questions != null) ? true : false;

  Stream<QuestionsList> get questionsStream =>
      _questionsStreamController.stream;

  void puntuarQuestions(Answer answer) {
    if (answer.val == 1) {
      puntos++;
    }

    print(puntos);
  }

  // void cambiarEdad(int edad) {
  //   this._questions.edad = edad;
  //   _usuarioStreamController.add(this._questions);
  // }

  dispose() {
    _questionsStreamController.close();
  }
}

final questionService = _QuestionsService();
