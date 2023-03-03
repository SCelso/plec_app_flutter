import 'package:flutter/material.dart';
import 'package:plec_app_flutter/screens/join_game_screen.dart';
import 'package:plec_app_flutter/screens/ranking_screen.dart';

import '../models/models.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'auth';

  static final menuOptions = <MenuOption>[
    // MenuOption(route: 'home', name: 'Home Screen', screen: const HomeScreen(), icon: Icons.home_max_sharp ),
    MenuOption(
        route: 'home',
        name: 'home',
        screen: const HomeScreen(),
        icon: Icons.list_alt),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'auth': (BuildContext context) => AuthScreen()});
    appRoutes.addAll(
        {'join_game': (BuildContext context) => const JoinGameScreen()});
    appRoutes
        .addAll({'ranking': (BuildContext context) => const RankingScreen()});
    appRoutes.addAll(
        {'profile_settings': (BuildContext context) => const ProfileScreen()});
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertScreen(),
    );
  }
}
