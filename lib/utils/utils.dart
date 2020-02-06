import 'dart:math';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';

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

  static void undoFlushbar(BuildContext context, String message, Function onUndo){
    Flushbar flushbar;
    flushbar = Flushbar(
      message: message,
      duration: Duration(seconds: 3),
      mainButton: FlatButton(
        onPressed: () {
          flushbar.dismiss(true);
        },
        child: Text(
          S.of(context).undo.toUpperCase(),
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ),
    )..show(context).then((result) {
      if (result ?? false)
        onUndo();
    });
  }

  static bool isMasterCodeValid(String value) {
    if (value != null && value.length >= 4 && value.length <= 8) return true;
    return false;
  }

  static String generatePassword(bool _isWithLowercase, bool _isWithUppercase,
      bool _isWithNumbers, bool _isWithSymbols, int _numberCharPassword) {

    //Define the allowed chars to use in the password
    String _lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
    String _upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String _numbers = "0123456789";
    String _special = "@#=+!£\$%&?[](){}";

    //Create the empty string that will contain the allowed chars
    String _allowedChars = "";

    //Put chars on the allowed ones based on the input values
    _allowedChars += (_isWithLowercase ? _lowerCaseLetters : '');
    _allowedChars += (_isWithUppercase ? _upperCaseLetters : '');
    _allowedChars += (_isWithNumbers ? _numbers : '');
    _allowedChars += (_isWithSymbols ? _special : '');

    int i = 0;
    String _result = "";

    //Create password
    while (i < _numberCharPassword.round()) {
      //Get random int
      int randomInt = Random.secure().nextInt(_allowedChars.length);
      //Get random char and append it to the password
      _result += _allowedChars[randomInt];
      i++;
    }

    return _result;
  }
}
