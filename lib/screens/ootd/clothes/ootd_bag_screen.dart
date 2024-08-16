import 'package:clowing_ver3/screens/ootd/clothes/ootd_fashion_screen.dart';
import 'package:clowing_ver3/screens/ootd/clothes/ootd_low_screen.dart';
import 'package:clowing_ver3/screens/ootd/clothes/ootd_outer_screen.dart';
import 'package:clowing_ver3/screens/ootd/clothes/ootd_shoes_screen.dart';
import 'package:clowing_ver3/screens/ootd/clothes/ootd_top_screen.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';
import 'package:clowing_ver3/widgets/ootd_button.dart';
import 'package:flutter/material.dart';

// Import LowScreen

class OotdBagScreen extends StatefulWidget {
  @override
  _OotdBagScreenState createState() => _OotdBagScreenState();
}

class _OotdBagScreenState extends State<OotdBagScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('룩북', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color(0xFFCCEDFF),
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
              height: 500,
              padding: const EdgeInsets.only(left: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSideMenuItem('상의', false),
                  _buildSideMenuItem('하의', false),
                  _buildSideMenuItem('아우터', false),
                  _buildSideMenuItem('신발', false),
                  _buildSideMenuItem('가방', true),
                  _buildSideMenuItem('패션 소품', false),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          OotdButton(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _buildSideMenuItem(String title, bool isSelected) {
    return Container(
      color: isSelected ? const Color(0xFFEBEBEB) : Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
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
            ),
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
          MaterialPageRoute(builder: (context) => OotdTopScreen()),
        );
        break;
      case '하의':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OotdLowScreen()),
        );
        break;
      case '아우터':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OotdOuterScreen()),
        );
        break;
      case '신발':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OotdShoesScreen()),
        );
        break;
      case '가방':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OotdBagScreen()),
        );
        break;
      case '패션 소품':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OotdFashionScreen()),
        );
        break;
    }
  }
}
