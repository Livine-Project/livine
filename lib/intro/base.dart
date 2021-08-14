import 'package:app/main.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/paitent.dart';
import 'package:app/pages/profile.dart';
import 'package:app/pages/settings.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentindex = 0;

  final List<Widget> _children = [
    Home(),
    Patient(),
    Profile(),
    Settings(),
    // WorkingOut(),
    //Grocery(),
    // Profile(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: _children[_currentindex],
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
      backgroundColor: dark
          ? Colors.grey[900]
          : Colors.white,
        items: <Widget>[
          Icon(Icons.home, size: 30, color: Colors.black),
          Icon(FontAwesomeIcons.heartbeat, size: 30, color: Colors.black),
          Icon(FontAwesomeIcons.userCircle, size: 27, color: Colors.black),
          Icon(Icons.settings, size: 30, color: Colors.black),
        ],
        onTap: (int index) {
          setState(() {
            _currentindex = index;
          });
        },
      ),
    );
  }
}

