import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStyles {
  static double baseFontSize = 16.0;

  static TextStyle get normalText => TextStyle(
        fontSize: baseFontSize,
      );

  static TextStyle get heading1 => TextStyle(
        fontSize: baseFontSize + 8,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get heading2 => TextStyle(
        fontSize: baseFontSize + 4,
        fontWeight: FontWeight.bold,
      );

  static Future<void> loadFontSize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    baseFontSize = prefs.getDouble('fontSize') ?? 16.0;
  }

  static Future<void> saveFontSize(double fontSize) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('fontSize', fontSize);
    baseFontSize = fontSize;
  }
}
