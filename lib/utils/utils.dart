import 'package:flutter/material.dart';

class Utils {
  static Future<void> sleep(int seconds){
    return Future.delayed(Duration(seconds: seconds));
  }

  static String getHexFromColor(Color color){
    try{
      return color.value.toRadixString(16).substring(2, 8);
    } catch (e){
      return null;
    }
  }

}