import 'package:clowing_ver3/screens/closet/closet_main.dart';
import 'package:flutter/material.dart';

class LoginSuccessfulScreen extends StatefulWidget {
  @override
  _LoginSuccessfulScreenState createState() => _LoginSuccessfulScreenState();
}

class _LoginSuccessfulScreenState extends State<LoginSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Light blue background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Spacer(),
          Image.asset(
            'assets/images/F2.png', // Replace with your logo image asset path
            width: 350,
            height: 350,
          ),
          Spacer(), // Takes up the remaining space
          Padding(
            padding: const EdgeInsets.only(
                bottom: 80.0), // Adjust this value to position the button
            child: nextPageButton(),
          ),
        ],
      ),
    );
  }

  Widget nextPageButton() {
    return InkWell(
      onTap: () {
        // Navigate to the closet main screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ClosetMainScreen()),
        );
      },
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        elevation: 2,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFC9DEFF),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              const Text(
                "클로윙 시작하기",
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
