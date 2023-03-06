import 'package:flutter/material.dart';
import 'package:plec_app_flutter/theme/app_theme.dart';

import '../models/models.dart' show Answer;

class MultipleSelectionWidget extends StatefulWidget {
  final List<Answer> answers;

  const MultipleSelectionWidget({
    Key? key,
    required this.answers,
  }) : super(key: key);

  @override
  State<MultipleSelectionWidget> createState() =>
      _MultipleSelectionWidgetState();
}

class _MultipleSelectionWidgetState extends State<MultipleSelectionWidget> {
  List<bool> _isChecked = [];

  @override
  initState() {
    super.initState();
    _isChecked = List<bool>.filled(widget.answers.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      width: 350,
      child: ListView.builder(
        itemCount: widget.answers.length,
        itemBuilder: (_, i) {
          return Card(
            elevation: 4,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              side: BorderSide(
                color: AppTheme.primary,
                width: 0.6,
              ),
            ),
            child: ListTile(
              dense: true,
              leading: Checkbox(
                value: _isChecked[i],
                onChanged: (val) => setState(() {
                  _isChecked[i] = val!;
                }),
              ),
              title: Text(widget.answers[i].text),
            ),
          );
        },
      ),
    );
  }
}

// List<Widget> getCheckBox(List<Answer> answers) {
//   List<Widget> checkBox = [];
//   {
//     answers.forEach((element) {
//       checkBox.add(Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SizedBox(
//             width: 300,
//             child: ElevatedButton(onPressed: () {}, child: Text(element.text))),
//       ));
//     });
//   }
//   return checkBox;
// }
