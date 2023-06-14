import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../widgets/roulette.dart';

class WaitingRoomScreen extends StatelessWidget {
  const WaitingRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.only(bottom: 100, left: 10, right: 10),
            child: AutoSizeText(
              'Waiting for host to start the game...',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF8B5CF6)),
              maxFontSize: 40,
              minFontSize: 10,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 120),
            child:
                Image(image: AssetImage('assets/ruleta_flutter_sin_fondo.png')),
          ),
        ],
      ),
    ));
  }
}
