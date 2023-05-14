import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class WaitingRoomScreen extends StatelessWidget {
  const WaitingRoomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              elevation: 7,
              shadowColor: Colors.grey,
              child: SizedBox(
                height: 500,
                width: 300,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          AutoSizeText(
                            'text',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30),
                            maxFontSize: 40,
                            minFontSize: 10,
                          ),
                          AutoSizeText(
                            'text',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                            maxFontSize: 40,
                            minFontSize: 10,
                          ),
                          AutoSizeText(
                            'text',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 40),
                            maxFontSize: 40,
                            minFontSize: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text('WaitingRoomScreen'),
          ],
        ),
      ),
    );
  }
}
