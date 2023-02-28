import 'package:flutter/material.dart';
import 'package:plec_app_flutter/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [appBarActions(context)],
      ),
      body: const Center(
        child: Text('HomeScreen'),
      ),
    );
  }

  Container appBarActions(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Row(
        children: [
          const Text('lvl 100'),
          //  const VerticalDivider(width: 200),
          InkWell(
              onTap: () => Navigator.pushNamed(context, 'profile_settings'),
              child: CircleAvatar(
                  backgroundColor: Colors.indigo[900],
                  child: const Text('SC'))),
        ],
      ),
    );
  }
}
