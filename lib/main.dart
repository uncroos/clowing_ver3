import 'package:clowing_ver3/screens/ai/ai_main.dart';
import 'package:clowing_ver3/screens/closet/closet_main.dart';
import 'package:clowing_ver3/screens/ootd/ootd_main.dart';
import 'package:clowing_ver3/screens/splash/splash.dart';
import 'package:clowing_ver3/screens/washing/washing_main.dart';
import 'package:flutter/material.dart';
// Import the splash screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Set SplashScreen as the home widget
      routes: {
        '/closet_main': (context) => ClosetMainScreen(),
        '/washing_main': (context) => WashingMainScreen(),
        '/ootd_main': (context) => OotdMainScreen(),
        '/ai_main': (context) => AiMainScreen(),
      },
    );
  }
}
