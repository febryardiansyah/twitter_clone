import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/home_screen/home_screen.dart';
import 'package:twitter_clone/utils/base_color.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({Key key}) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  List<Widget> _children = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: BaseColor.blue3,
        onTap: _onTap,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),backgroundColor: BaseColor.blue1,title: Center()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),backgroundColor: BaseColor.blue1,title: Center()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),backgroundColor: BaseColor.blue1,title: Center()
          ),
        ],
      ),
    );
  }
  void _onTap(int newValue){
    setState(() {
      _currentIndex = newValue;
    });
  }
}