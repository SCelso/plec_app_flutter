import 'package:flutter/material.dart';

class JoinGameScreen extends StatelessWidget {
  const JoinGameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Game'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('JoinGameScreen'),
      ),
    );
  }
}
