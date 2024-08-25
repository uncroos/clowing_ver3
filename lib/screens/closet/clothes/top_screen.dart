import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clowing_ver3/screens/closet/add/add_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/bag_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/fashion_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/low_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/outer_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/shoes_screen.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class TopScreen extends StatefulWidget {
  @override
  _TopScreenState createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 옷장', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1E5DB),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '검색어 입력',
                            hintStyle: TextStyle(color: Colors.black45),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Icon(Icons.search, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 90,
                padding: const EdgeInsets.only(left: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSideMenuItem('상의', true),
                    _buildSideMenuItem('하의', false),
                    _buildSideMenuItem('아우터', false),
                    _buildSideMenuItem('신발', false),
                    _buildSideMenuItem('가방', false),
                    _buildSideMenuItem('패션 소품', false),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 0),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Row(
                children: [
                  VerticalDivider(thickness: 1, width: 1),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('clothes')
                            .where('category', isEqualTo: '상의')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          final clothes = snapshot.data!.docs;
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 4,
                            ),
                            itemCount: clothes.length,
                            itemBuilder: (context, index) {
                              final item = clothes[index];
                              return Card(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        item['imageUrl'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        item['name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
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
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height *
                  0.6, // Set dynamic height
              child: Row(
                children: [
                  VerticalDivider(thickness: 1, width: 1),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              children: [],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddScreen()),
                                );
                              },
                              child: Text('신발 추가하기'),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.brown[200],
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.w900, fontSize: 17),
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildSideMenuItem(String title, bool isSelected) {
    return Container(
      color: isSelected ? const Color(0xFFEBEBEB) : Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: () {
            _onMenuItemSelected(title);
          },
          child: Text(
            title,
            style: TextStyle(
                color: isSelected ? Colors.black : const Color(0xFF787878),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 13),
          ),
        ),
      ),
    );
  }

  void _onMenuItemSelected(String title) {
    switch (title) {
      case '상의':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TopScreen()),
        );
        break;
      case '하의':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LowScreen()),
        );
        break;
      case '아우터':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OuterScreen()),
        );
        break;
      case '신발':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShoesScreen()),
        );
        break;
      case '가방':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BagScreen()),
        );
        break;
      case '패션 소품':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FashionScreen()),
        );
        break;
    }
  }
}
