import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plec_app_flutter/providers/nickname_provider.dart';
import 'package:plec_app_flutter/theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ChangeNotifierProvider(
              create: (_) => NicknameProvider(), child: _Profile()),
        ],
      )),
    );
  }
}

class _Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userFromDB = FirebaseAuth.instance.currentUser!;
    final nicknameTextField = Provider.of<NicknameProvider>(context);
    final nickname = nicknameTextField.getnickname().toString();
    return Form(
      key: nicknameTextField.key,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.indigo,
            backgroundImage: NetworkImage(userFromDB.photoURL!),
            radius: 80,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            autocorrect: false,
            initialValue: nickname,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),
            ],
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.primary)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.primary, width: 3)),
                hintText: 'Cargar Nickname',
                labelText: 'Nickname',
                labelStyle: TextStyle(color: Colors.grey)),
            onChanged: (value) => nicknameTextField.nickname = value,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              final nickname = nicknameTextField.nickname;
              final userProvider =
                  Provider.of<UserProvider>(context, listen: false);
              userProvider.changeNickname(nickname);
            },
            child: const Text('Cambiar Nickname'),
          ),
        )
      ]),
    );
  }
}
