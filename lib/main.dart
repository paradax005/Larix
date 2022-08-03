import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:larix/screens/login/login_screen.dart';
import 'package:larix/screens/main/main_screen.dart';
import 'package:larix/screens/signup/signup_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Larix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Poppins',
      ),
      home: const LoginScreen(),
      // routes: {
      //   '/login': (BuildContext context) {
      //     return const LoginScreen();
      //   },
      //   '/register': (BuildContext context) {
      //     return const SignupScreen();
      //   },
      //   '/home': (BuildContext context) {
      //     return const MainScreen();
      //   }
      // },
      getPages: [
        GetPage(
          name: '/login',
          page: () => const LoginScreen(),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: '/register',
          page: () => const SignupScreen(),
          transition: Transition.leftToRight,
          transitionDuration: const Duration(milliseconds: 400),
        ),
        GetPage(
          name: '/home',
          page: () => const MainScreen(),
          transition: Transition.fade,
          transitionDuration: const Duration(seconds: 1),
        ) // Dynamic route
      ],
    );
  }
}
