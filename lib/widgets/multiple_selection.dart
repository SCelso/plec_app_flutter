// import 'package:flutter/material.dart';

// import '../models/models.dart' show Answer;

// class MultipleSelectionWidget extends StatefulWidget {
//   final List<Answer> answers;
//   const MultipleSelectionWidget({
//     Key? key,
//     required this.answers,
//   }) : super(key: key);

//   @override
//   State<MultipleSelectionWidget> createState() =>
//       _MultipleSelectionWidgetState();
// }

// class _MultipleSelectionWidgetState extends State<MultipleSelectionWidget> {
//   List<bool> _isChecked = [];

//   @override
//   initState() {
//     super.initState();
//     _isChecked = List<bool>.filled(answers.length, false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: widget.answers.length,
//       itemBuilder: (_, i) {
//         return Card(
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             borderRadius: const BorderRadius.all(
//               Radius.circular(8),
//             ),
//             side: BorderSide(
//               color: Colors.purple.withOpacity(0.7),
//               width: 0.6,
//             ),
//           ),
//           child: ListTile(
//             dense: true,
//             leading: Checkbox(
//               value: _isChecked[i],
//               onChanged: (val) => setState(() {
//                 _isChecked[i] = val!;
//               }),
//             ),
//             title: Text(widget.answers[i]),
//           ),
//         );
//       },
//     );
//   }
// }

// List<Widget> getCheckBox(List<Answer> answers) {
//   List<Widget> CheckBox = [];
//   {
//     answers.forEach((element) {
//       CheckBox.add(Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SizedBox(
//             width: 300,
//             child: ElevatedButton(onPressed: () {}, child: Text(element.text))),
//       ));
//     });
//   }
//   return CheckBox;
// }
