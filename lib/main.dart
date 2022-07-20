import 'package:flutter/material.dart';
import 'package:larix/screens/login/login_screen.dart';
import 'package:larix/screens/signup/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Larix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      routes: {
        '/login': (BuildContext context) {
          return const LoginScreen();
        },
        '/register': (BuildContext context) {
          return const SignupScreen();
        }
      },
    );
  }
}
