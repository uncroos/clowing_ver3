import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class LookbookCompletionScreen extends StatefulWidget {
  @override
  _LookbookCompletionScreenState createState() =>
      _LookbookCompletionScreenState();
}

class _LookbookCompletionScreenState extends State<LookbookCompletionScreen> {
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

      bottomNavigationBar: BottomNavBar(), // Add the BottomNavBar widget here
    );
  }
}
