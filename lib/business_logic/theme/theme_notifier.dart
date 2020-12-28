import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeData _themedata;
  ThemeNotifier(this._themedata);
  
  getTheme() => _themedata;

  setTheme(ThemeData themeData) async {
    _themedata = themeData;
    notifyListeners();
  }
}