import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clowing_ver3/screens/closet/add/add_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/bag_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/fashion_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/outer_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/shoes_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/top_screen.dart';
import 'package:flutter/material.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';

class LowScreen extends StatefulWidget {
  @override
  _LowScreenState createState() => _LowScreenState();
}

class _LowScreenState extends State<LowScreen> {
  final TextEditingController _searchController = TextEditingController();
  String selectedCategory = '하의'; // 선택된 카테고리를 추적

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
      body: Row(
        // Row로 변경하여 사이드 메뉴와 콘텐츠가 옆에 위치하도록 함
        children: [
          Container(
            width: 90,
            padding: const EdgeInsets.only(left: 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSideMenuItem('상의', selectedCategory == '상의'),
                _buildSideMenuItem('하의', selectedCategory == '하의'),
                _buildSideMenuItem('아우터', selectedCategory == '아우터'),
                _buildSideMenuItem('신발', selectedCategory == '신발'),
                _buildSideMenuItem('가방', selectedCategory == '가방'),
                _buildSideMenuItem('패션 소품', selectedCategory == '패션 소품'),
              ],
            ),
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: Container(
              color: Colors.white,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
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
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('clothes')
                          .where('category', isEqualTo: selectedCategory)
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
                            childAspectRatio: 9 / 16,
                          ),
                          itemCount: clothes.length,
                          itemBuilder: (context, index) {
                            final item = clothes[index];
                            return Column(
                              children: [
                                Expanded(
                                  child: Image.network(
                                    item['imageUrl'],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  item['name'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddScreen()),
                        );
                      },
                      child: Text('$selectedCategory 추가하기'),
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
            setState(() {
              selectedCategory = title; // 선택된 카테고리 업데이트
            });
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
}
