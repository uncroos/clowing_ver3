import 'package:clowing_ver3/screens/start/login_main.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => StartScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF83ACE9), // Light blue color
      body: Center(
        child: Image.asset(
          'assets/images/logo_white.png', // Replace with your logo image asset path
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
