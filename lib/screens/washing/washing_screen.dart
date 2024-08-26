import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clowing_ver3/screens/washing/washing_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';

class WashingScreen extends StatefulWidget {
  @override
  _WashingScreenState createState() => _WashingScreenState();
}

class _WashingScreenState extends State<WashingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double itemHeight = screenSize.width / 3;

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
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('clothes').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final clothes = snapshot.data!.docs;

            // Sort the clothes by a timestamp field or any other field to get the oldest items
            clothes.sort((a, b) => a['timestamp'].compareTo(b['timestamp']));

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: (screenSize.width / 3) / (itemHeight + 60),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: clothes.length,
              itemBuilder: (context, index) {
                final item = clothes[index];
                final bool isOldestItem = index < 2;

                return GestureDetector(
                  onTap: () {
                    // Navigate to the detailed screen with item's data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WashingDetailsScreen(
                          imageUrl: item['imageUrl'],
                          name: item['name'],
                          material: item['material'],
                          description: item['description'],
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.network(
                                item['imageUrl'],
                                fit: BoxFit.cover,
                                height: itemHeight,
                                width: double.infinity,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                item['name'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isOldestItem)
                        Positioned(
                          left: 8,
                          top: 8,
                          child: Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 24,
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
