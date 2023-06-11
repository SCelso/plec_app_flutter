import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:plec_app_flutter/global/enviroment.dart';
import 'package:plec_app_flutter/models/models.dart';
import 'package:plec_app_flutter/models/questions.dart';

class QuestionsProvider extends ChangeNotifier {
  Future getQuestions() async {
    // print('${Enviroment.apiUrl}/users/players');
    var uri = Uri.parse(
        '${Enviroment.apiUrl}/questions/search/63fa66f90d2e133e5fe3a3f6/64047ec537807640ed96c5ff');
    final resp = await http.get(uri);

    if (resp.statusCode == 200) {
      // final decodedData =List<Question>.from(json[""].map((x) => Question.fromJson(x))),
      final decodedData = QuestionsList.fromJson(resp.body as List<dynamic>);
      print(decodedData);
      return decodedData;
    }
  }
}
