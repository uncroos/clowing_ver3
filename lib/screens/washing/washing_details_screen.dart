import 'package:clowing_ver3/screens/washing/washing_main.dart';
import 'package:flutter/material.dart';

class WashingDetailsScreen extends StatelessWidget {
  final String itemName;
  final String imagePath;

  WashingDetailsScreen({required this.itemName, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("세탁기"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(imagePath, width: 200, height: 200),
                    SizedBox(height: 8),
                    Text(itemName, style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("색상분류", style: TextStyle(fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: Colors.black,
                        ),
                        SizedBox(width: 4),
                        Container(
                          width: 20,
                          height: 20,
                          color: Colors.white,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text("소재", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("폴리에스테르"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("폴리에스테르 세탁 주의사항",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("• 땀을 많이 흘렸거나 얼룩이 생겼을 경우 즉시 세탁하십시오."),
                    Text("• 손빨래를 권장하며 세탁기를 이용할 경우 세탁망을 사용하여 주십시오."),
                    Text("• 약 알칼리성 세제를 권장하며 다른 의류와 함께 세탁하지 마십시오."),
                  ],
                ),
              ),
              SizedBox(height: 120),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WashingMainScreen()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Color(0xFF6E8C6F),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '세탁 처리하기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
