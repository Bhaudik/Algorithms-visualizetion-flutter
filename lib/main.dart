// import 'package:flutter/material.dart';
// import 'Sign_in_Sign_up/login.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: Home(),
//
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'main_App.dart';

void main() async {
  await _initHive();
  runApp(const MainApp());
}

Future<void> _initHive() async{

  await Hive.initFlutter();
  await Hive.openBox("login");
  await Hive.openBox("accounts");
}

