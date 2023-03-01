import 'package:flutter/material.dart';

import 'package:plec_app_flutter/router/app_routes.dart';
import 'package:plec_app_flutter/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.getAppRoutes(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: AppTheme.lightTheme);
  }
}
//   class LoginIn extends StatelessWidget {
//    LoginIn({Key? key}) : super(key: key);

//    final GoogleSignIn _googleSignIn = GoogleSignIn();

// @override
// Widget build(BuildContext context){
//   return Scaffold(
//     body: Center(
//       child: MaterialButton(
//         onPressed: (){
//           _googleSignIn.signIn().then((value) {
//             String userName= value!.displayName!;
//             String profilePicture = value.photoUrl!;
//           });
//         },
//         color: Colors.red,
//         height: 50,
//         minWidth: 100,
//         child: const Text('Login with Google', style: TextStyle(color: Colors.white)),
//       )
//     )
//   );
// } 
// }