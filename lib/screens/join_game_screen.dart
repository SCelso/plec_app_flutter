import 'package:flutter/material.dart';
import 'package:plec_app_flutter/widgets/custom_input_field.dart';

class JoinGameScreen extends StatelessWidget {
  const JoinGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Game'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Code',
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text('Send')),
          ],
        ),
      ),
    );
  }
}
