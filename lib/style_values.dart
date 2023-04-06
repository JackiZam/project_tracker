import 'package:flutter/material.dart';

// Colors for theme idea 1 (pink/purple)
Color darkPink = const Color(0xFF9C0D38);
Color lightPink = const Color(0xFFFAE3E8);
Color darkPurple = const Color(0xFF423153);

// Colors for theme idea 2 (blues)
Color icyBlue = const Color(0xFFD9F1F6);
Color deeperBlue = const Color(0xFF222975);
Color buttonBlue = const Color(0xFF0066B1);
Color offWhite = const Color(0xFFF5F5F5);

class ButtonColor extends MaterialStateColor {
  ButtonColor(super.defaultValue);

  @override
  Color resolve(Set<MaterialState> states) {
    return lightPink;
  }
}
