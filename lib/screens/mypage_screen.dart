import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyPageScreen extends StatefulWidget {
  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  // 선택된 값 저장할 변수
  String _selectedGender = '';
  String _selectedAge = '';
  String _selectedWeight = '';
  String _selectedHeight = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이페이지'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // 저장 버튼 로직
              print('성별: $_selectedGender');
              print('나이: $_selectedAge');
              print('몸무게: $_selectedWeight');
              print('키: $_selectedHeight');
            },
            child: Text(
              '저장',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Color(0xFF90B4EA),
                  child:
                      Icon(Icons.person, size: 100, color: Color(0xFFC9DEFF)),
                ),
              ],
            ),
            SizedBox(height: 30),
            InputBox(),
            SizedBox(height: 30),
            ChoiceBox(
              title: '성별',
              options: ['여성', '남성', '기타'],
              onSelected: (String selectedOption) {
                setState(() {
                  _selectedGender = selectedOption;
                });
              },
            ),
            SizedBox(height: 30),
            ChoiceBox(
              title: '나이',
              options: [
                "10대",
                "20대",
                "30대",
                "40대",
                "50대",
                "50대 이상",
              ],
              onSelected: (String selectedOption) {
                setState(() {
                  _selectedGender = selectedOption;
                });
              },
            ),
            SizedBox(height: 30),
            ChoiceBox(
              title: '키',
              options: [
                "149cm 이하",
                "150cm",
                "155cm",
                "160cm",
                "165cm",
                "170cm",
                "175cm",
                "180cm",
                "185cm",
                "190cm",
                "191cm 이상"
              ],
              onSelected: (String selectedOption) {
                setState(() {
                  _selectedGender = selectedOption;
                });
              },
            ),
            SizedBox(height: 30),
            ChoiceBox(
              title: '키',
              options: [
                "39kg 이하",
                "40kg",
                "45kg",
                "50kg",
                "55kg",
                "60kg",
                "65kg",
                "70kg",
                "75kg",
                "80kg",
                "85kg",
                "90kg",
                "95kg",
                "100kg",
                "101kg 이상"
              ],
              onSelected: (String selectedOption) {
                setState(() {
                  _selectedGender = selectedOption;
                });
              },
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
            ),
            LogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget LogoutButton() {
    return InkWell(
      onTap: () {},
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        elevation: 2,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFDE3030),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "로그아웃",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w900,
                  fontSize: 17,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ChoiceBox 위젯 정의
class ChoiceBox extends StatefulWidget {
  final String title; // ChoiceBox 제목
  final List<String> options; // 선택 가능한 옵션 목록
  final Function(String) onSelected; // 옵션 선택 시 호출될 함수

  ChoiceBox({
    required this.title,
    required this.options,
    required this.onSelected,
  });

  @override
  _ChoiceBoxState createState() => _ChoiceBoxState();
}

class _ChoiceBoxState extends State<ChoiceBox> {
  int _selectedIndex = 0; // 현재 선택된 옵션 인덱스

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => _showDialog(
        CupertinoPicker(
          magnification: 1.22,
          squeeze: 1.2,
          useMagnifier: true,
          itemExtent: 32.0,
          onSelectedItemChanged: (int selectedItem) {
            setState(() {
              _selectedIndex = selectedItem;
              widget.onSelected(widget.options[selectedItem]); // 선택된 옵션 전달
            });
          },
          children: List<Widget>.generate(widget.options.length, (int index) {
            return Center(
              child: Text(
                widget.options[index],
              ),
            );
          }),
        ),
      ),
      child: Text(
        widget.options[_selectedIndex], // 현재 선택된 옵션 표시
        style: const TextStyle(
          fontSize: 22.0,
        ),
      ),
    );
  }
}

class InputBox extends StatelessWidget {
  final double width = 200;
  final double height = 60;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 19,
        ),
        decoration: InputDecoration(
          hintText: '안요한',
          hintStyle: TextStyle(color: Color(0xFF959AA7)),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
