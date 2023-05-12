// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:plec_app_flutter/models/models.dart' show Question;
// import 'package:provider/provider.dart';

// import '../providers/questions_provider.dart';

// class _QuestionsService {
//   List<Question> _questions;

//   StreamController<List<Question>> _questionsStreamController =
//       StreamController<List<Question>>.broadcast();

//   List<Question>? get questions => _questions;
//   bool get questionListExists => (_questions != null) ? true : false;

//   Stream<List<Question>> get questionsStream =>
//       _questionsStreamController.stream;

//   void cargarQuestions(BuildContext context) {
//     final questionsProvider = Provider.of<QuestionsProvider>(context);
//     questionsProvider.getQuestions().then((value) {
//       _questions = value;
//     });
//     _questionsStreamController.add(_questions!);
//   }

//   // void cambiarEdad(int edad) {
//   //   this._questions.edad = edad;
//   //   _usuarioStreamController.add(this._questions);
//   // }

//   dispose() {
//     _questionsStreamController?.close();
//   }
// }

// final questionService = _QuestionsService();
