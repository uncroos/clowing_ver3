import 'package:clowing_ver3/widgets/ai_button.dart';
import 'package:clowing_ver3/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AiInputScreen extends StatefulWidget {
  @override
  _AiInputScreenState createState() => _AiInputScreenState();
}

class _AiInputScreenState extends State<AiInputScreen> {
// Default text

  final Map<String, Color> _colorMap = {
    "원하시는 색을 입력하세요": Colors.transparent,
    "빨간색": Colors.red,
    "주황색": Colors.orange,
    "노란색": Colors.yellow,
    "초록색": Colors.green,
    "파랑색": Colors.blue,
    "보라색": Colors.purple,
    "핑크색": Colors.pink,
    "회색": Colors.grey,
    "검은색": Colors.black,
  };

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
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '코디 추천',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 300),
            Text(
              '원하시는 색을 입력하세요',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ChoiceBox(
              title: '색상',
              options: _colorMap.keys.toList(),
              colorMap: _colorMap,
              onSelected: (String selectedOption) {
                setState(() {});
              },
            ),
            SizedBox(
              height: 240,
            ),
            AiButton(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class ChoiceBox extends StatefulWidget {
  final String title; // ChoiceBox title
  final List<String> options; // List of selectable options
  final Map<String, Color> colorMap; // Map of color names to color values
  final Function(String)
      onSelected; // Function to call when an option is selected

  ChoiceBox({
    required this.title,
    required this.options,
    required this.colorMap,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    color: widget.colorMap[widget.options[index]],
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget.options[index],
                  ),
                ],
              ),
            );
          }),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  color: widget.colorMap[widget.options[_selectedIndex]],
                ),
                SizedBox(width: 8),
                Text(
                  widget.options[_selectedIndex],
                  style: TextStyle(
                    fontSize: 16.0,
                    color: _selectedIndex == 0 ? Colors.grey : Colors.black,
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_drop_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
