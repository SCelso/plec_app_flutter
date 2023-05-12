import 'package:flutter/material.dart';
import 'package:plec_app_flutter/services/questions_service.dart';

import '../models/models.dart' show Answer;

class SimpleSelectionWidget extends StatelessWidget {
  final List<Answer> answers;
  const SimpleSelectionWidget({
    Key? key,
    required this.answers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: getButtons(answers),
      ),
    );
  }
}

List<Widget> getButtons(List<Answer> answers) {
  List<Widget> buttons = [];
  final int selected = 0;

  {
    answers.forEach((element) {
      buttons.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: 300,
            // child: ListTile(
            //   title: const Text('www.javatpoint.com'),
            //   leading: Radio(
            //     value: element.val,
            //     groupValue: selected,
            //     onChanged: (value) {
            //       setState(() {
            //         selected = value;
            //       });
            //     },
            //   ),
            // ),
            child: ElevatedButton(
                onPressed: () {
                  questionService.puntuarQuestions(element);
                },
                child: Text(element.text))),
      ));
    });
  }
  return buttons;
}
