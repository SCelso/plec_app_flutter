import 'package:flutter/material.dart';

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
  {
    answers.forEach((element) {
      buttons.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            width: 300,
            child: ElevatedButton(onPressed: () {}, child: Text(element.text))),
      ));
    });
  }
  return buttons;
}
