import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'package:plec_app_flutter/router/app_routes.dart';
import 'package:plec_app_flutter/theme/app_theme.dart';

import 'providers/user_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'plecapp',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            initialRoute: AppRoutes.initialRoute,
            routes: AppRoutes.getAppRoutes(),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            theme: AppTheme.lightTheme));
  }
}
