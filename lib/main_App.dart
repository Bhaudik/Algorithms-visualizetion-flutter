import 'package:flutter/material.dart';

import 'Sign_in_Sign_up//login.dart';
import 'splash.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(152, 103, 54, 1.0),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
