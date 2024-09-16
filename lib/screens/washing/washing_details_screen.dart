import 'package:clowing_ver3/screens/washing/washing_completed_screen.dart';
import 'package:flutter/material.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';

class WashingDetailsScreen extends StatefulWidget {
  final String imageUrl;
  final String color; // 여전히 String 타입으로 유지
  final String name;
  final String material;
  final String description;

  WashingDetailsScreen({
    required this.imageUrl,
    required this.color,
    required this.name,
    required this.material,
    required this.description,
  });

  @override
  _WashingDetailsScreenState createState() => _WashingDetailsScreenState();
}

class _WashingDetailsScreenState extends State<WashingDetailsScreen> {
  // String 타입의 색상 코드를 Color로 변환하는 함수
  Color colorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", ""); // # 제거
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor; // 6자리일 경우 FF(불투명) 추가
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  // 색상 코드로부터 색상 이름을 반환하는 함수
  String colorName(Color color) {
    Map<int, String> colorMap = {
      0xFF000000: 'Black',
      0xFFFFFFFF: 'White',
      0xFFFF0000: 'Red',
      0xFF00FF00: 'Green',
      0xFF0000FF: 'Blue',
      0xFF6E8C6F: 'Olive Green', // 예시로 추가
    };

    return colorMap[color.value] ?? 'Color';
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final color = colorFromHex(widget.color); // String 색상 코드를 Color로 변환

    return Scaffold(
      appBar: AppBar(
        title: Text('세탁기', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.imageUrl,
                height: screenSize.width / 2, // Adjusted for responsiveness
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: screenSize.width - 20,
              height: 200,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5), // Light gray background color
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '색상분류: ${colorName(color)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '소재: ${widget.material}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '세부사항',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WashingCompletedScreen(),
                    ),
                  );
                },
                child: Text('세탁 처리하기'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF6E8C6F),
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(), // Add the BottomNavBar widget
    );
  }
}
