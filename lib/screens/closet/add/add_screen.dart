import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:clowing_ver3/screens/closet/fin/finish_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  String? _selectedMaterial;
  final _descriptionController = TextEditingController();
  final _nameController = TextEditingController();
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _descriptionController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _nameController.dispose();
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

  Future<void> _saveToFirebase() async {
    if (_image == null ||
        _nameController.text.isEmpty ||
        _selectedCategory == null ||
        _selectedMaterial == null) {
      // 모든 필수 필드가 채워지지 않은 경우
      return;
    }

    try {
      // Firebase Storage에 이미지 업로드
      String imageUrl;
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('images/${DateTime.now().toString()}.jpg');

      // 파일을 업로드하고 업로드 작업이 완료될 때까지 대기합니다.
      TaskSnapshot uploadTask = await storageRef.putFile(_image!);

      // 업로드된 파일의 다운로드 URL을 가져옵니다.
      imageUrl = await uploadTask.ref.getDownloadURL();

      // Firestore에 데이터 저장
      await FirebaseFirestore.instance.collection('clothes').add({
        'name': _nameController.text,
        'category': _selectedCategory,
        'color': _selectedColor?.value,
        'material': _selectedMaterial,
        'description': _descriptionController.text,
        'imageUrl': imageUrl,
        'timestamp': FieldValue.serverTimestamp(), // 타임스탬프 추가
      });

      // 저장 후 화면 초기화
      setState(() {
        _image = null;
        _nameController.clear();
        _selectedCategory = null;
        _selectedColor = null;
        _selectedMaterial = null;
        _descriptionController.clear();
      });

      // FinishScreen으로 이동
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FinishScreen()),
      );
    } catch (e) {
      print("Error uploading image: $e");
      // 여기에 사용자에게 오류를 알리는 UI를 추가할 수 있습니다.
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
                        controller: _nameController,
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
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                        },
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
              spacing: 15,
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
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: color,
                        border: Border.all(
                          color: _selectedColor == color
                              ? Colors.black
                              : color == Colors.white
                                  ? Color.fromARGB(
                                      255, 173, 173, 173) // 하얀색일 경우 얇은 회색 테두리
                                  : Colors.transparent,
                          width:
                              color == Colors.white ? 1 : 2, // 하얀색은 1, 나머지는 2
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
                      _selectedMaterial ?? '',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _selectedMaterial,
                  items: [
                    DropdownMenuItem(child: Text("폴리에스터"), value: "폴리에스터"),
                    DropdownMenuItem(child: Text("울"), value: "울"),
                    DropdownMenuItem(child: Text("실크"), value: "실크"),
                    DropdownMenuItem(child: Text("리넨"), value: "리넨"),
                    DropdownMenuItem(child: Text("나일론"), value: "나일론"),
                    DropdownMenuItem(child: Text("레이온"), value: "레이온"),
                    DropdownMenuItem(child: Text("아크릴"), value: "아크릴"),
                    DropdownMenuItem(child: Text("스판덱스"), value: "스판덱스"),
                    DropdownMenuItem(child: Text("기모"), value: "기모"),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedMaterial = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '소재',
                  ),
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
                onTap: _saveToFirebase,
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
