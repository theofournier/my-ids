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
}
