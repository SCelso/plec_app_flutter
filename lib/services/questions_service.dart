import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plec_app_flutter/models/models.dart' show Question;
import 'package:plec_app_flutter/models/questions.dart';
import 'package:provider/provider.dart';

import '../providers/questions_provider.dart';

class _QuestionsService {
  QuestionsList? _questions;

  StreamController<QuestionsList> _questionsStreamController =
      new StreamController<QuestionsList>.broadcast();

  QuestionsList? get questions => _questions;
  bool get questionListExists => (_questions != null) ? true : false;

  Stream<QuestionsList> get questionsStream =>
      _questionsStreamController.stream;

  void cargarQuestions(BuildContext context) {
    final questionsProvider = Provider.of<QuestionsProvider>(context);
    questionsProvider.getQuestions().then((value) {
      _questions = value;
    });
    _questionsStreamController.add(_questions!);
    print(_questions);
  }

  // void cambiarEdad(int edad) {
  //   this._questions.edad = edad;
  //   _usuarioStreamController.add(this._questions);
  // }

  dispose() {
    _questionsStreamController?.close();
  }
}

final questionService = _QuestionsService();
