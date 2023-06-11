import 'package:flutter/material.dart';
import 'package:plec_app_flutter/services/user_provider.dart';

import '../models/user_response.dart';

class NicknameProvider with ChangeNotifier {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  String nickname = '';

  Future getnickname() async {
    return userResponseFromJson(await UserProvider.getUserData()).nickname;
  }
}
