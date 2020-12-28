import 'package:flutter/material.dart';
import 'package:mmfanfic/business_logic/theme/theme_data.dart';
import 'package:mmfanfic/business_logic/theme/theme_notifier.dart';
import 'package:mmfanfic/ui/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(defaultTheme),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MMFanfic',
      theme: themeNotifier.getTheme(),
      home: MainScreen(),
      // routes: routes,
    );
  }
}
