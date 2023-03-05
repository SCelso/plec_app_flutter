import 'package:flutter/material.dart';
import 'package:plec_app_flutter/screens/auth_page_screen.dart';
import 'package:plec_app_flutter/screens/join_game_screen.dart';
import 'package:plec_app_flutter/screens/questions_screen.dart';
import 'package:plec_app_flutter/screens/settings_screen.dart';
import 'package:plec_app_flutter/widgets/reusable_card.dart';

import '../models/models.dart';
import '../screens/screens.dart';
import '../widgets/true_false.dart';

class AppRoutes {
  static const initialRoute = 'auth';
  //static const initialRoute = 'auth_page';

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
    appRoutes.addAll({'card': (BuildContext context) => QuestionsScreen()});
    appRoutes
        .addAll({'settings': (BuildContext context) => const SettingsScreen()});

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
