import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static var port = dotenv.env['PORT'];
  static var androidUrl = dotenv.env['ANDROID_URL'];
  static var iosUrl = dotenv.env['IOS_URL'];
  static String apiUrl = Platform.isAndroid
      ? 'http://$androidUrl:$port/api'
      : 'http://$iosUrl:$port/api';
  static String socketUrl =
      Platform.isAndroid ? 'http://$androidUrl:$port' : 'http://$iosUrl:$port';
}
