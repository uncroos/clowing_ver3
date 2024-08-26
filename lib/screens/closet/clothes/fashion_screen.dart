import 'package:clowing_ver3/screens/closet/add/add_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/bag_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/low_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/outer_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/shoes_screen.dart';
import 'package:clowing_ver3/screens/closet/clothes/top_screen.dart';
import 'package:flutter/material.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';

class FashionScreen extends StatefulWidget {
  @override
  _FashionScreenState createState() => _FashionScreenState();
}

class _FashionScreenState extends State<FashionScreen> {
  final TextEditingController _searchController = TextEditingController();
  String selectedCategory = '패션 소품'; // 현재 선택된 카테고리

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
                _buildSideMenuItem(
                    '패션 소품', selectedCategory == '패션 소품'), // 패션 소품 is selected
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
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: [], // 이곳에 패션 소품 데이터 추가 예정
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
                      child: Text('패션 소품 추가하기'),
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
      padding: const EdgeInsets.symmetric(
          vertical: 12.0, horizontal: 8.0), // 사이드 메뉴의 패딩 조정
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
    setState(() {
      selectedCategory = title; // 선택된 카테고리 업데이트
    });

    Widget screen;
    switch (title) {
      case '상의':
        screen = TopScreen();
        break;
      case '하의':
        screen = LowScreen();
        break;
      case '아우터':
        screen = OuterScreen();
        break;
      case '신발':
        screen = ShoesScreen();
        break;
      case '가방':
        screen = BagScreen();
        break;
      case '패션 소품':
      default:
        screen = FashionScreen();
        break;
    }

    if (screen is! FashionScreen) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    }
  }
}
