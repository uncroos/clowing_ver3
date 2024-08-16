import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    Navigator.pushReplacementNamed(context, _getRouteForIndex(index));
  }

  String _getRouteForIndex(int index) {
    switch (index) {
      case 0:
        return '/closet_main';
      case 1:
        return '/washing_main';
      case 2:
        return '/ootd_main';
      case 3:
        return '/ai_main';
      default:
        return '/closet_main';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _onTabTapped,
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed, // アイコンの配置を固定
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.door_sliding_outlined,
            color: _currentIndex == 0 ? Colors.black : Colors.grey,
            size: 24.0, // アイコンのサイズを固定
          ),
          label: '', // ラベルを削除
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.local_laundry_service,
            color: _currentIndex == 1 ? Colors.black : Colors.grey,
            size: 24.0, // アイコンのサイズを固定
          ),
          label: '', // ラベルを削除
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.checkroom,
            color: _currentIndex == 2 ? Colors.black : Colors.grey,
            size: 24.0, // アイコンのサイズを固定
          ),
          label: '', // ラベルを削除
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: _currentIndex == 3 ? Colors.black : Colors.grey,
            size: 24.0, // アイコンのサイズを固定
          ),
          label: '', // ラベルを削除
        ),
      ],
    );
  }
}
