import 'package:clowing_ver3/screens/ai/ai_main.dart';
import 'package:flutter/material.dart';

class AiCompleteScreen extends StatefulWidget {
  @override
  _AiCompleteScreenState createState() => _AiCompleteScreenState();
}

class _AiCompleteScreenState extends State<AiCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Light blue background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 350.0), // Adjust this value to position the button
          ),
          Image.asset(
            'assets/images/ai_pin.png', // Replace with your logo image asset path
            width: 180,
            height: 180,
          ),
          Text(
            '개시 완료',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Spacer(), // Takes up the remaining space
          Padding(
            padding: const EdgeInsets.only(
                bottom: 100.0), // Adjust this value to position the button
            child: Button(),
          ),
        ],
      ),
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
