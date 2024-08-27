import 'package:clowing_ver3/screens/ootd/clothes/ootd_clothes.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class OotdMainScreen extends StatefulWidget {
  @override
  _OotdMainScreenState createState() => _OotdMainScreenState();
}

class _OotdMainScreenState extends State<OotdMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ootd', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false, // This removes the back button
      ),
      body: Stack(
        children: [
          // Top 2/3 background color
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 3 / 5,
            child: Container(
              color: Colors.white, // 상단 2/3
            ),
          ),
          // Bottom 1/3 background color
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 2 / 5,
            child: Container(
              color: Color(0xFFCCEDFF), // 하단 1/3
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset(
                      'assets/images/mannequin.png', // Replace with your closet image asset path
                      fit: BoxFit.contain, // 조정 방법 (fit 속성 사용 가능)
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OotdClothesScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF63A0C3), // 박스 색상
                    padding: EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15), // 내부 패딩
                    textStyle:
                        TextStyle(fontSize: 16, color: Colors.white), // 글씨 색상
                    fixedSize: Size(330, 55), // 가로 및 세로 크기
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // 라운드
                    ),
                  ),
                  child: Text(
                    '데일리 룩북 관리하기',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(), // Add the BottomNavBar widget here
    );
  }
}
