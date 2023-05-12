import 'package:flutter/material.dart';
import 'package:plec_app_flutter/widgets/widgets.dart';

import '../models/models.dart';
import '../screens/screens.dart';

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
    appRoutes.addAll({'auth': (BuildContext context) => const AuthScreen()});

    appRoutes.addAll(
        {'join_game': (BuildContext context) => const JoinGameScreen()});
    appRoutes.addAll(
        {'questions': (BuildContext context) => const QuestionsScreen()});
    appRoutes.addAll(
        {'waiting_room': (BuildContext context) => const WaitingRoomScreen()});
    appRoutes.addAll({
      'card': (BuildContext context) => MultipleSelectionWidget(
            answers: [
              Answer(text: "Gay", val: 1),
              Answer(text: "Homosexual", val: 0),
              Answer(text: "Estonio", val: 1),
              Answer(
                  text: "Militante del gobierno bolivariano social-comunista ",
                  val: 0),
            ],
          )
    });
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
