// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:roulette/roulette.dart';

// import '../widgets/roulette.dart';

// class AuthPage extends StatefulWidget {
//   const AuthPage({Key? key}) : super(key: key);

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage>
//     with SingleTickerProviderStateMixin {
//   static final _random = Random();

//   late RouletteController _controller;
//   bool _clockwise = true;

//   final colors = <Color>[
//     Colors.red.withAlpha(50),
//     Colors.green.withAlpha(30),
//     Colors.blue.withAlpha(70),
//     Colors.yellow.withAlpha(90),
//     Colors.amber.withAlpha(50),
//     Colors.indigo.withAlpha(70),
//   ];

//   @override
//   void initState() {
//     // Initialize the controller
//     final group = RouletteGroup.uniform(
//       colors.length,
//       colorBuilder: colors.elementAt,
//     );
//     _controller = RouletteController(vsync: this, group: group);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Roulette'),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Colors.pink.withOpacity(0.1),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     "Clockwise: ",
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   Switch(
//                     value: _clockwise,
//                     onChanged: (onChanged) {
//                       setState(() {
//                         _controller.resetAnimation();
//                         _clockwise = !_clockwise;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               MyRoulette(controller: _controller),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // Use the controller to run the animation with rollTo method
//         onPressed: () => _controller.rollTo(
//           3,
//           clockwise: _clockwise,
//           offset: _random.nextDouble(),
//         ),
//         child: const Icon(Icons.refresh_rounded),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
