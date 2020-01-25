import 'package:flutter/material.dart';

class Utils {
  static Future<void> sleep(int seconds) {
    return Future.delayed(Duration(seconds: seconds));
  }

  static String getHexFromColor(Color color) {
    try {
      return color.value.toRadixString(16).substring(2, 8);
    } catch (e) {
      return null;
    }
  }

  static bool isToday(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final aDate = DateTime(date.year, date.month, date.day);
    if (aDate == today) {
      return true;
    }
    return false;
  }
}
