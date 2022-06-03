import 'package:flutter/material.dart';

// import 'package:software1_conductor/app/core/theme/color_theme.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Color(0xff1B1B1B),
  accentColor: Colors.greenAccent,
  fontFamily: 'Georgia',
  backgroundColor: Color(0xff1B1B1B),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xff1B1B1B),
    selectedIconTheme: IconThemeData(color: Colors.white),
    selectedItemColor: Colors.white,
    unselectedIconTheme: IconThemeData(color: Colors.white38),
    unselectedItemColor: Colors.white38,
    // showSelectedLabels:
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.white),
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);
