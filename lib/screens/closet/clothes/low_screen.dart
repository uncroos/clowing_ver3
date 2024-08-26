import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: _buildSearchField(),
          ),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 90,
                  color: Colors.white,
                  child: Column(
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
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text('Container 2b', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            color: Colors.red,
            child: Center(
              child: Text('Container 1', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      width: double.infinity,
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
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}