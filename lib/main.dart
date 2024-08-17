import 'package:clowing_ver3/screens/ai/ai_main.dart';
import 'package:clowing_ver3/screens/closet/closet_main.dart';
import 'package:clowing_ver3/screens/ootd/ootd_main.dart';
import 'package:clowing_ver3/screens/splash/splash.dart';
import 'package:clowing_ver3/screens/washing/washing_main.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';
// Import the splash screen

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();

  // runApp() 호출 전 Flutter SDK 초기화
  KakaoSdk.init(
    nativeAppKey: 'e47a16bbc2de7f9bb684384b295bcd3c',
    javaScriptAppKey: '0630e9c5a052ae423cfc0c573f8ed152',
  );
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
