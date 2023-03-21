import 'dart:async';

import 'package:plec_app_flutter/models/user_response.dart';

class _UserService {
  late UserResponse _user;
  final StreamController<UserResponse> _userStreamController =
      StreamController<UserResponse>.broadcast();
  UserResponse get usuario => _user;
  bool get existeUsuario => (_user != null) ? true : false;

  Stream<UserResponse> get usuarioStream => _userStreamController.stream;

  void cargarUsuario(UserResponse user) {
    _user = user;
    _userStreamController.add(user);
  }

  void cambiarEdad(String nickname) {
    _user.nickname = nickname;
    _userStreamController.add(_user);
  }

  dispose() {
    _userStreamController.close();
  }
}

final userService = _UserService();
