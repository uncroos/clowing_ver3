import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';

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
        padding: const EdgeInsets.all(8.0), // Padding around the GridView
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('clothes')
              .snapshots(), // Fetches all documents in the collection
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            final clothes = snapshot.data!.docs;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Display 3 items per row
                childAspectRatio: 2 / 3, // Aspect ratio for the items
                crossAxisSpacing: 8, // Horizontal spacing between items
                mainAxisSpacing: 8, // Vertical spacing between items
              ),
              itemCount: clothes.length,
              itemBuilder: (context, index) {
                final item = clothes[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  elevation: 4, // Card shadow elevation
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(
                                12)), // Rounded corners on the top
                        child: Image.network(
                          item['imageUrl'],
                          fit: BoxFit.cover,
                          height: 150, // Set a fixed height for the image
                          width: double
                              .infinity, // Make image take up the full width of the card
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                            8.0), // Padding inside the card
                        child: Text(
                          item['name'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
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
      bottomNavigationBar: BottomNavBar(), // Add the BottomNavBar widget here
    );
  }
}
