import 'package:flutter/material.dart';

class Dimensions {
  static const double xs = 4;
  static const double sm = 8;
  static const double ms = 12;
  static const double md = 16;
  static const double bg = 20;
  static const double xl = 24;
  static const double xxl = 28;
  static const double sxl = 32;

  static double getScreenFractionWidth(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.width * fraction;
  }

  static double getScreenFractionHeight(BuildContext context, double fraction) {
    return MediaQuery.of(context).size.height * fraction;
  }
}
