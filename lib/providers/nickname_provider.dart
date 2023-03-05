import 'package:flutter/material.dart';

class NicknameProvider with ChangeNotifier {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  String nickname = '';
}
