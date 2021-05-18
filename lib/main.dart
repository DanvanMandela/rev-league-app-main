import 'package:attendant/constants/navigation_bar.dart';
import 'package:attendant/constants/route_controler.dart';
import 'package:attendant/logins/loadingScreen.dart';
import 'package:attendant/logins/loginPage.dart';
import 'package:attendant/logins/resetPassword.dart';
import 'package:attendant/screens/racing.dart';
import 'package:flutter/material.dart';

import 'logins/loadingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REV VIRTUAL RACING',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Verlag',
        // primarySwatch: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),

      initialRoute: 'LoadingScreen',
      routes: {
        'LoadingScreen': (context) => LoadingScreen(),
        'RouteController': (context) => RouteController(),
        'LoginScreen': (context) => LoginScreen(),
        'MyNavBar': (context) => MyNavBar(),
        'ResetPassword': (context) => ResetPassword(),
        'Racing': (context) => Racing(),
      },
    );
  }
}
