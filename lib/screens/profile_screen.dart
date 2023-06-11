import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plec_app_flutter/services/nickname_provider.dart';
import 'package:plec_app_flutter/theme/app_theme.dart';
import 'package:provider/provider.dart';

import '../models/user_response.dart';
import '../services/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userFromDB = FirebaseAuth.instance.currentUser!;
  dynamic user;

  @override
  void initState() {
    user = getUser();
    super.initState();
  }

  Future getUser() async {
    return userResponseFromJson(await UserProvider.getUserData());
  }

  @override
  Widget build(BuildContext context) {
    final nicknameTextField = Provider.of<NicknameProvider>(context);
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
              create: (_) => NicknameProvider(),
              child: Form(
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
                      initialValue: user.nickname,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp("[a-zA-Z0-9]")),
                      ],
                      decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppTheme.primary)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppTheme.primary, width: 3)),
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
              )),
        ],
      )),
    );
  }
}
