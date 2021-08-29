import 'package:e_commerce/shared/stayle/default_color.dart';
import 'package:e_commerce/shared/stayle/stayles.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Color(0xFF2a2b2b),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: indigo(),
      backgroundColor: Color(0xFF2a2b2b),
      unselectedItemColor: Colors.grey,
      elevation: 1.0),
  appBarTheme: AppBarTheme(
      color: Color(0xFF2a2b2b),
      elevation: 0.0,
      iconTheme: IconThemeData(color: Color(0xFFffffff))),
  textTheme: TextTheme(
      headline5: white24bold(),
      headline6: white22bold(),
      bodyText1: white20regular(),
      bodyText2: white18regular(),
      subtitle1: white16regular(),
      subtitle2: indigo16bold()),
);


ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
      color: Colors.white10,
      elevation: 0.0,
      iconTheme: IconThemeData(color: indigo())),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: indigo(),
      unselectedItemColor: Colors.grey[600],
      elevation: 1.0),
  textTheme: TextTheme(
      headline5: black24bold(),
      headline6: indigo22bold(),
      bodyText1: black20bold(),
      bodyText2: black18regular(),
      subtitle1: black16regular(),
      subtitle2: indigo16bold()),
  // primaryColor: Colors.indigo,
  fontFamily: 'amiri',
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
