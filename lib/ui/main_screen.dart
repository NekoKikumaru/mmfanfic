import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mmfanfic/ui/create_screen.dart';
import 'package:mmfanfic/ui/home_screen.dart';
import 'package:mmfanfic/ui/library_screen.dart';
import 'package:mmfanfic/ui/user_screen.dart';
import 'package:mmfanfic/utils/widgets_helper.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreen();
  }
}

class _MainScreen extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [HomeScreen(), LibraryScreen(), CreateScreen(), UserScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MMFanfic')),
      body: IndexedStack(
        index: _currentIndex,
        children: _children
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        color: Colors.lightBlue[600],
        buttonBackgroundColor: Colors.lightBlue[600],
        backgroundColor: Colors.white,
        items: <Widget> [
          WidgetHelper().nav_icon(Icons.home),
          WidgetHelper().nav_icon(Icons.book),
          WidgetHelper().nav_icon(Icons.add),
          WidgetHelper().nav_icon(Icons.face),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      )
    );
  }
}