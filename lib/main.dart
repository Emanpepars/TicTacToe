import 'package:flutter/material.dart';

import 'Login.dart';
import 'XOGame.dart';

void main() {
  runApp(
    MyApplication(),
  );
}

class MyApplication extends StatelessWidget {
  const MyApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.routeName,
        routes: {
          XOScreen.routeName: (context) => XOScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
        });
  }
}
