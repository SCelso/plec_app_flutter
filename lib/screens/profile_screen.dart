import 'package:flutter/material.dart';
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
    final nicknameTextField = Provider.of<NicknameProvider>(context);
    return Form(
      key: nicknameTextField.key,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            autocorrect: false,
            decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.primary)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.primary, width: 3)),
                hintText: 'Nickname',
                labelText: 'Nickname',
                labelStyle: TextStyle(color: Colors.grey)),
            onChanged: (value) => nicknameTextField.nickname = value,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            final nickname = nicknameTextField.nickname;
            final userProvider =
                Provider.of<UserProvider>(context, listen: false);
            userProvider.changeNickname(nickname);
          },
          child: const Text('Cambiar Nickname'),
        ),
      ]),
    );
  }
}
