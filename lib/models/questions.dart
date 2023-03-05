import 'package:plec_app_flutter/models/models.dart';

class QuestionsList {
  final List<Question> questions;

  QuestionsList({
    required this.questions,
  });

  factory QuestionsList.fromJson(List<dynamic> parsedJson) {
    List<Question> questions = <Question>[];
    questions = parsedJson.map((i) => Question.fromJson(i)).toList();

    return QuestionsList(questions: questions);
  }
}
