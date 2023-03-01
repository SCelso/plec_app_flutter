import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: MaterialButton(
      onPressed: () {
        _googleSignIn.signIn().then((value) {
          String userName = value!.displayName!;

          print(userName);
        });
      },
      color: Colors.red,
      height: 50,
      minWidth: 100,
      child: const Text('Login with Google',
          style: TextStyle(color: Colors.white)),
    )));
  }
}
