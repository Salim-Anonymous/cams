import 'package:cams/screens/chat.dart';
import 'package:cams/screens/club.dart';
import 'package:cams/screens/club_recommendation.dart';
import 'package:cams/screens/news.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import "package:flutter/material.dart";

//stateful widget with nav bar
class MainScreen extends StatefulWidget{
  const MainScreen({Key? key}) : super(key: key);

  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //logic for navigation bar
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    NewsScreen(),
    ChatPage(),
    ReconScreen(),
    ClubScreen(),
    Text(
      'Index 4: School',
      style: MainScreen.optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        //dynamic child changes based on nav bar selection
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: const Color.fromRGBO(19,138,139,1.0),
        items: const [
          Icon(Icons.newspaper_outlined, size: 25, color: Color.fromRGBO(7, 3, 28, 1.0)),
          Icon(Icons.chat_bubble_outline, size: 25, color: Color.fromRGBO(7, 3, 28, 1.0)),
          Icon(Icons.recommend_outlined, size: 25, color: Color.fromRGBO(7, 3, 28, 1.0)),
          Icon(Icons.home_outlined, size: 25, color: Color.fromRGBO(7, 3, 28, 1.0)),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        animationCurve: Curves.easeInToLinear,
        animationDuration: const Duration(milliseconds: 150),
        height: 70,
      )
    );
  }
}