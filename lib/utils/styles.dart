import 'package:flutter/material.dart';

class StyleCollections {
  static Color lightText = const Color(0xff8789A3);
  static Color primaryColor = const Color(0xff240F4F);
  static TextStyle headerTextLight =
      TextStyle(fontSize: 18, color: lightText, fontWeight: FontWeight.w500);
  static TextStyle headerTextDark =
      TextStyle(fontSize: 18, color: primaryColor, fontWeight: FontWeight.w500);
  static TextStyle headerTextLight2 =
      TextStyle(fontSize: 24, color: lightText, fontWeight: FontWeight.w500);
  static TextStyle headerTextDark2 =
      TextStyle(fontSize: 24, color: primaryColor, fontWeight: FontWeight.w500);
  static TextStyle bodyTextLight = TextStyle(fontSize: 16, color: lightText);
  static TextStyle bodyTextDark = TextStyle(fontSize: 16, color: primaryColor);
  static TextStyle arabicTextColor =
      const TextStyle(fontSize: 16, color: Color(0xff863ED5));
}
