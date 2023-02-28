import 'package:flutter/material.dart';
import 'package:plec_app_flutter/router/app_routes.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Text('Iniciar Sesión', style: TextStyle(fontSize: 16)),
                ),
                onPressed: () => Navigator.pushReplacementNamed(
                    context, AppRoutes.menuOptions[0].route)),
          ],
        ),
      ),
    );
  }
}
