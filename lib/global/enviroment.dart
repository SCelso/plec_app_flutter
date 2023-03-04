import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String? port = "";
  static String? androidHost = "";
  static String? iosHost = "";
  static get apiUrl => Platform.isAndroid
      ? 'http://$androidHost:$port/api'
      : 'http://$iosHost:$port/api';
  static get socketUrl => Platform.isAndroid
      ? 'http://$androidHost:$port'
      : 'http://$iosHost:$port';

  Future loadEnviroment() async {
    await dotenv.load(fileName: ".env");
    port = dotenv.env['PORT'];
    androidHost = dotenv.env['HOST_ANDROID'];
    iosHost = dotenv.env['HOST_IOS'];
  }
}
