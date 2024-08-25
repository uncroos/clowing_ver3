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
  final _materialController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _nameController = TextEditingController();
  String? _selectedCategory;

  @override
  void dispose() {
    _materialController.dispose();
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
        _selectedCategory == null) {
      // 모든 필수 필드가 채워지지 않은 경우
      return;
    }

    // Firebase Storage에 이미지 업로드
    String imageUrl;
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().toString()}.jpg');
    await storageRef.putFile(_image!);
    imageUrl = await storageRef.getDownloadURL();

    // Firestore에 데이터 저장
    await FirebaseFirestore.instance.collection('clothes').add({
      'name': _nameController.text,
      'category': _selectedCategory,
      'color': _selectedColor?.value,
      'material': _materialController.text,
      'description': _descriptionController.text,
      'imageUrl': imageUrl,
    });

    // 저장 후 화면 초기화
    setState(() {
      _image = null;
      _nameController.clear();
      _selectedCategory = null;
      _selectedColor = null;
      _materialController.clear();
      _descriptionController.clear();
    });

    // FinishScreen으로 이동
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FinishScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // (생략된 기존 코드)
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
