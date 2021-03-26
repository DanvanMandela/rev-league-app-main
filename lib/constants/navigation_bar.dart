import 'package:attendant/screens/registerDriver.dart';
import 'package:flutter/material.dart';
import 'package:attendant/screens/racing.dart';
import 'package:attendant/screens/about.dart';

class MyNavBar extends StatefulWidget {
  MyNavBar({Key key}) : super(key: key);

  final String title = "MyNavBar"; //add this line

  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    //Add pages to appear on the App, via Navigation Bar
    Racing(),
    RegisterDriver(),
    AboutUs(),
  ];

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.speed),
            label: 'Race',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_motorsports_outlined),
            label: 'Driver',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
