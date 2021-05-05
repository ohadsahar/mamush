import 'package:flutter/material.dart';
import 'package:momrecipes/generated/fonts.gen.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: FontFamily.rubik,
  textTheme: TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 40,
      letterSpacing: 2,
    ),
    //Mini Titles
    headline2: TextStyle(
      color: Colors.black,
      fontSize: 34,
      fontWeight: FontWeight.bold,
    ),
    //Bottom Sheet
    headline3: TextStyle(
      color: Colors.black,
      fontSize: 30,
    ),
    //Mini Mini titles
    headline4: TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.w400,
    ),
    headline5: TextStyle(
      color: Colors.red,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 32,
    ),
  ),
);

class AppColors {
  static Color inputColor = Color(0xffF4F6F6);
  static Color appPrimaryColor = Color(0xff1ABB9C);
  static Color secondaryColor = Color(0xff42436A);
  static Color thirdColor = Color(0xffF4F6F6);
  static Color activeTag = Color(0xffBAF5D1);

  static const categoryScreenBackground = Color(0xffEFEFEF);
}
