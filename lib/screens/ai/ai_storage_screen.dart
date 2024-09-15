import 'package:clowing_ver3/screens/ai/ai_main.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class AiStorageScreen extends StatefulWidget {
  @override
  _AiStorageScreenState createState() => _AiStorageScreenState();
}

class _AiStorageScreenState extends State<AiStorageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: SizedBox(),
        title: Text(
          '코디 추천',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Spacer(),
            Spacer(),
            Spacer(),
            Spacer(),
            Image.asset(
              'assets/images/qw.png', // Camo hoodie image
              width: 150, // Adjust width as needed
              height: 150, // Adjust height as needed
              fit: BoxFit.contain, // Adjust image scaling
            ),
            SizedBox(height: 15),
            Image.asset(
              'assets/images/as.png', // Pants and shoes image
              width: 150, // Adjust width as needed
              height: 150, // Adjust height as needed
              fit: BoxFit.contain, // Adjust image scaling
            ),
            Spacer(),
            Spacer(),
            Spacer(),
            Button(),
            Spacer(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget Button() {
    return InkWell(
      onTap: () {
        // Navigate to the closet main screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AiMainScreen()),
        );
      },
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        elevation: 2,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              const Text(
                "확인하러 가기",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
