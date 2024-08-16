import 'package:clowing_ver3/screens/start/age_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class GenderScreen extends StatefulWidget {
  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String _selectedGender = '성별을 선택하세요';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            Text(
              '성별을\n선택해주세요!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Text(
              '성별',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ChoiceBox(
              title: '성별',
              options: [
                "성별을 선택하세요",
                "여자",
                "남자",
                "기타",
              ],
              onSelected: (String selectedOption) {
                setState(() {
                  _selectedGender = selectedOption;
                });
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 60.0),
              child: nextPageButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget nextPageButton() {
    return InkWell(
      onTap: () {
        // Navigate to the next screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AgeScreen()),
        );
      },
      child: Card(
        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        elevation: 2,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFC9DEFF),
            borderRadius: BorderRadius.circular(7),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              const Text(
                "다음",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceBox extends StatefulWidget {
  final String title; // ChoiceBox title
  final List<String> options; // List of selectable options
  final Function(String)
      onSelected; // Function to call when an option is selected

  ChoiceBox({
    required this.title,
    required this.options,
    required this.onSelected,
  });

  @override
  _ChoiceBoxState createState() => _ChoiceBoxState();
}

class _ChoiceBoxState extends State<ChoiceBox> {
  int _selectedIndex = 0; // Currently selected option index

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
              widget.onSelected(
                  widget.options[selectedItem]); // Pass the selected option
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
        widget.options[_selectedIndex],
        style: TextStyle(
          fontSize: 22.0,
          color: _selectedIndex == 0 ? Colors.grey : Colors.black,
        ),
      ),
    );
  }
}
