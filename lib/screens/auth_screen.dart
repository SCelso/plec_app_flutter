import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              _googleSignIn.signIn().then((value) {
                String userName = value!.displayName!;

                print(userName);
                Navigator.popAndPushNamed(context, 'home');
              });
            },
            icon: const Icon(Icons.login),
            label: const Text('Login with Google',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    ));
  }
}
