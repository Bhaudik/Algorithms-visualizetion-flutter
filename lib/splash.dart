import 'package:flutter/material.dart';
//import 'package:your_app/.dart';


import 'Sign_in_Sign_up/login.dart';
import 'main_App.dart'; // Import your main app file

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization logic here, such as loading data, setting up services, etc.
    // For demonstration purposes, we'll simulate a delay using Future.delayed.

    Future.delayed(Duration(seconds: 5), () {
      // Navigate to the main screen after the splash screen is shown
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4DEC6),
      body:
      Center(
        child: Container(
          height: 200,
          width: 200,
          child: Center(
            child:
            Image.asset("assets/Images/icon.png"),


          ),
        ),
      ),
    );
  }
}
