import 'package:bancvest_app/screens/home/home_screen.dart';
import 'package:bancvest_app/screens/login_signup/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Bancvest',
      home: LoginScreen(),
    );
  }
}
