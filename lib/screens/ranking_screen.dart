import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class RankingScreen extends StatefulWidget {
  const RankingScreen({Key? key}) : super(key: key);

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  int _selectedIndex = 1;

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
          title: const Text('LeaderBoard'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('RankingScreen'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.emoji_events_sharp),
              label: 'Ranking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: AppTheme.primary,
          onTap: _onItemTapped,
        ));
  }
}
