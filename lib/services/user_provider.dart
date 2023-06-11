import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:plec_app_flutter/global/enviroment.dart';
import 'package:plec_app_flutter/models/user_response.dart';

class UserProvider extends ChangeNotifier {
  final _storage = const FlutterSecureStorage();

  static Future<String> getUserData() async {
    const storage = FlutterSecureStorage();
    final userData = await storage.read(key: 'userData');
    return userData!;
  }

  static Future<void> deleteUserData() async {
    const storage = FlutterSecureStorage();
    storage.delete(key: 'userData');
  }

  Future addUser(String email) async {
    final data = {'email': email};
    var uri = Uri.parse('${Enviroment.apiUrl}/users/players');
    final resp = await http.post(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 201) {
      return await _saveUserData(resp.body);
    }
  }

  Future changeNickname(String nickname) async {
    final data = {'nickname': nickname};
    final userData = userResponseFromJson(await getUserData());
    final id = userData.id;
    var uri = Uri.parse('${Enviroment.apiUrl}/users/players/$id');
    final resp = await http.patch(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    if (resp.statusCode == 200) {
      return await _saveUserData(resp.body);
    } else if (resp.statusCode == 400 || resp.statusCode == 500) {
      return 'Ha ocurrido un error';
    }
  }

  Future _saveUserData(String userData) async {
    return await _storage.write(key: 'userData', value: userData);
  }

  Future _deleteUserData() async {
    return await _storage.delete(key: 'userData');
  }
}
