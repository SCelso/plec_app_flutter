import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

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
              signInWithGoogle().then((value) async {
                String userName = value.user!.displayName.toString();
                String userEmail = value.user!.email.toString();
                print(userEmail);

                final userProvider =
                    Provider.of<UserProvider>(context, listen: false);
                userProvider.addUser(userEmail);

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
  // await Firebase.initializeApp();
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
