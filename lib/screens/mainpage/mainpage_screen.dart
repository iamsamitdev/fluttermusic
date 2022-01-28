import 'package:flutter/material.dart';
import 'package:fluttermusic/screens/collection/collection_screen.dart';
import 'package:fluttermusic/screens/home/home_screen.dart';
import 'package:fluttermusic/screens/profile/profile_screen.dart';
import 'package:fluttermusic/screens/search/search_screen.dart';

class MainPageScreen extends StatefulWidget {
  MainPageScreen({Key? key}) : super(key: key);

  @override
  _MainPageScreenState createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {

  int _currentTab = 0;

  final Tabs = [
    HomeScreen(),
    SearchScreen(),
    CollectionScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Tabs[_currentTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTab,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey, 
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'หน้าหลัก'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'ค้นหา'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark_outlined),
              label: 'คอลเลกชัน'
            ),    
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'บัญชี'
            )
          ],
          onTap: (index){
            setState(() {
              _currentTab = index;
            });
          },
        ),
      )
    );
  }
}
