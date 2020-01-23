import 'package:flutter/material.dart';

class Utils {
  static Future<void> sleep(int seconds){
    return Future.delayed(Duration(seconds: seconds));
  }

  static String getHexFromColor(Color color){
    return color.value.toRadixString(16).substring(2, 8);
  }

}