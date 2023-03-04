import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:plec_app_flutter/global/enviroment.dart';

class UserProvider extends ChangeNotifier {
  Future addUser(String email) async {
    final data = {'email': email};
    // print('${Enviroment.apiUrl}/users/players');
    var uri = Uri.parse('${Enviroment.apiUrl}/users/players');
    final resp = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200) {
      print(resp.body);
      return resp.body;
    }
  }
}
