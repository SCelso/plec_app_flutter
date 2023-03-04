import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:roulette/roulette.dart';

import '../widgets/widgets.dart' show MyRoulette;

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  //ROULETTE
  static final _random = Random();

  late RouletteController _controller;
  bool _clockwise = true;

  final colors = <Color>[
    Colors.red.withAlpha(50),
    Colors.green.withAlpha(30),
    Colors.blue.withAlpha(70),
    Colors.yellow.withAlpha(90),
    Colors.amber.withAlpha(50),
    Colors.indigo.withAlpha(70),
  ];

  @override
  void initState() {
    // Initialize the controller
    final group = RouletteGroup.uniform(
      colors.length,
      colorBuilder: colors.elementAt,
    );
    _controller = RouletteController(vsync: this, group: group);
    super.initState();
  }

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
          Padding(
            padding: const EdgeInsets.only(bottom: 250),
            child: GestureDetector(
                onTap: () => _controller.rollTo(
                      3,
                      clockwise: _clockwise,
                      offset: _random.nextDouble(),
                    ),
                child: MyRoulette(controller: _controller)),
          ),
          ElevatedButton.icon(
            onPressed: () {
              signInWithGoogle().then((value) {
                String userName = value.user!.displayName.toString();

                print(userName);
                Navigator.popAndPushNamed(context, 'home');
              }).catchError((error) => print(error));
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

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
