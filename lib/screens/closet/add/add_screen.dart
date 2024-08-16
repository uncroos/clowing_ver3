import 'package:clowing_ver3/screens/closet/fin/finish_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  File? _image;
  Color? _selectedColor;
  final _materialController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _materialController.addListener(() {
      setState(() {});
    });
    _descriptionController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _materialController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              '내 옷장',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Row(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 120,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: _image == null
                        ? Icon(Icons.camera_alt,
                            size: 50, color: Colors.grey[600])
                        : Image.file(_image!, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: '이름',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        items: [
                          DropdownMenuItem(child: Text("상의"), value: "상의"),
                          DropdownMenuItem(child: Text("하의"), value: "하의"),
                          DropdownMenuItem(child: Text("아우터"), value: "아우터"),
                          DropdownMenuItem(child: Text("신발"), value: "신발"),
                          DropdownMenuItem(child: Text("가방"), value: "가방"),
                          DropdownMenuItem(child: Text("패션소품"), value: "패션소품"),
                        ],
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          labelText: '카테고리',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              '컬러',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 5.5,
              children: [
                for (var color in [
                  Colors.red,
                  Colors.orange,
                  Colors.yellow,
                  Colors.green,
                  Colors.blue,
                  Colors.purple,
                  Colors.pink,
                  Colors.grey,
                  Colors.white,
                  Colors.black,
                  Colors.brown
                ])
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: color,
                        border: Border.all(
                          color: _selectedColor == color
                              ? Colors.black
                              : Colors.transparent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('소재'),
                    Text(
                      '${_materialController.text.length}/100',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                TextField(
                  controller: _materialController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    counterText: '',
                  ),
                  maxLength: 100,
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Icon(Icons.camera_alt, color: Colors.blue),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '여기를 눌러 택을 촬영해보세요!',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('설명'),
                        Text(
                          '${_descriptionController.text.length}/100',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                      ),
                      maxLength: 100,
                      maxLines: 3,
                    ),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
            SizedBox(height: 35),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FinishScreen()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.brown[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '완료',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
