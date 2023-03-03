import 'package:flutter/material.dart';
import 'package:plec_app_flutter/theme/app_theme.dart';
import 'package:plec_app_flutter/widgets/circle_avatar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.popAndPushNamed(context, 'home');
    } else if (index == 1) {
      Navigator.popAndPushNamed(context, 'ranking');
    } else if (index == 2) {
      Navigator.popAndPushNamed(context, 'settings');
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: <Widget>[appBarActions(context)],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, 'join_game'),
                  child: const Text('Join game')),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppTheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }

  Row appBarActions(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () => Navigator.pushNamed(context, 'profile_settings'),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
              child: CustomAvatarProfile(
                backgroundColor: Colors.indigo,
              ),
            )),
      ],
    );
  }
}
