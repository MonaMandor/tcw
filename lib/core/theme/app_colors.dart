// core/theme/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = Color(0xFFB7924F);
  static Color secondaryColor = HexColor("#FBD928");

  static Color scaffoldBackground = HexColor("#FFFFFF");
  static Color primaryTextColor = Color(0xFF202244);
  static Color secondaryTextColor = HexColor("#FFFFFF");
  static Color hintTextColor = const Color.fromRGBO(0, 0, 0, 0.5);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
