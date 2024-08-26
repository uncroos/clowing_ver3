import 'package:clowing_ver3/screens/washing/washing_completed_screen.dart';
import 'package:flutter/material.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';

class WashingDetailsScreen extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String material;
  final String description;

  WashingDetailsScreen({
    required this.imageUrl,
    required this.name,
    required this.material,
    required this.description,
  });

  @override
  _WashingDetailsScreenState createState() => _WashingDetailsScreenState();
}

class _WashingDetailsScreenState extends State<WashingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '소재: ${widget.material}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '${widget.name} 세부사항',
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
              ),
            ),
            SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(8.0), // Container의 padding 설정
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WashingCompletedScreen()),
                  );
                },
                child: Text('세탁 처리하기'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.brown[200],
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(), // Add the BottomNavBar widget
    );
  }
}
