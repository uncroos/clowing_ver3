import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clowing_ver3/screens/ootd/ootd_completion_screen.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class OotdClothesScreen extends StatefulWidget {
  @override
  _OotdClothesScreenState createState() => _OotdClothesScreenState();
}

class _OotdClothesScreenState extends State<OotdClothesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String selectedCategory = '상의'; // 선택된 카테고리를 추적
  List<String> selectedItems = []; // 선택된 아이템을 추적

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
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 4,
                        ),
                        itemCount: clothes.length,
                        itemBuilder: (context, index) {
                          final item = clothes[index];
                          final isSelected = selectedItems.contains(item.id);
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  selectedItems.remove(item.id);
                                } else {
                                  selectedItems.add(item.id);
                                }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(8.0), // 카드의 외부 여백 설정
                              child: Stack(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0), // 라운드 설정
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(
                                                    12.0)), // 이미지의 모서리 라운드 설정
                                            child: Image.network(
                                              item['imageUrl'],
                                              fit: BoxFit.cover,
                                              width: double.infinity,
                                            ),
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
                                  ),
                                  Positioned(
                                    top: 8,
                                    left: 8,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.white.withOpacity(0.8),
                                      ),
                                      child: Checkbox(
                                        value: isSelected,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            if (value == true) {
                                              selectedItems.add(item.id);
                                            } else {
                                              selectedItems.remove(item.id);
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0), // Container의 padding 설정
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OotdCompletionScreen()),
                );
              },
              child: Text('룩북 만들기'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF63A0C3),
                textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          )
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
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      width: double.infinity,
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
    );
  }
}
