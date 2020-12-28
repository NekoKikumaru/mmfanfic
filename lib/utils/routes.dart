import 'package:flutter/material.dart';
import 'package:mmfanfic/ui/fanfic_screen.dart';
import 'package:mmfanfic/ui/user_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/fanfic": (BuildContext context) => FanficScreen(),
  "/user": (BuildContext context) => UserScreen()
};