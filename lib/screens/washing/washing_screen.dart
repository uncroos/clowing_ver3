import 'package:clowing_ver3/screens/washing/washing_details_screen.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class WashingScreen extends StatefulWidget {
  @override
  _WashingScreenState createState() => _WashingScreenState();
}

class _WashingScreenState extends State<WashingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('세탁기', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false, // This removes the back button
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            // Add your images here as GridTiles
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WashingDetailsScreen(
                      itemName: '빨간색 티셔츠',
                      imagePath: 'assets/images/red_shirt.png',
                    ),
                  ),
                );
              },
              child: GridTile(
                child: Column(
                  children: [
                    Image.asset('assets/images/red_shirt.png',
                        width: 100, height: 100),
                    SizedBox(height: 8),
                    Text('빨간색 티셔츠', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WashingDetailsScreen(
                      itemName: '과잠',
                      imagePath: 'assets/images/black.png',
                    ),
                  ),
                );
              },
              child: GridTile(
                child: Column(
                  children: [
                    Image.asset('assets/images/black.png',
                        width: 100, height: 100),
                    SizedBox(height: 8),
                    Text('과잠', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(), // Add the BottomNavBar widget here
    );
  }
}
