import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:plec_app_flutter/global/enviroment.dart';

class UserProvider extends ChangeNotifier {
  Future addUser(String email) async {
    final data = {'email': email};

    final resp = await http.post('${Enviroment.apiUrl}/users/players' as Uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    print(resp.body);
  }
}
