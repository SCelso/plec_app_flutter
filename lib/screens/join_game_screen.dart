import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/socket_service.dart';

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Code'),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  final socketConnection =
                      Provider.of<SocketService>(context, listen: false)
                          .connectToSocket(TextEditingController().text);
                  Navigator.pushNamed(context, 'waiting_room');
                },
                child: const Text('Send')),
          ],
        ),
      ),
    );
  }
}
