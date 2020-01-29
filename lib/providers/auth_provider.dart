import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_ids/utils/hive_keys.dart';

class AuthProvider with ChangeNotifier {
  String _password;
  bool _isAuth = false;

  String get password {
    return _password;
  }

  bool get isAuth {
    return _isAuth;
  }

  Future<void> retrievePassword() async {
    String temp = await Hive.box(HiveKeys.authBoxName)
        .get(HiveKeys.passwordKey);
    if (temp != null && temp.isNotEmpty) {
      _password = temp;
      notifyListeners();
    }
  }

  bool checkPassword(String password){
    return _password == password;
  }

  void login() {
    _isAuth = true;
    notifyListeners();
  }

  void savePassword(String password) {
    Hive.box(HiveKeys.authBoxName).put(HiveKeys.passwordKey, password);
    _password = password;
    notifyListeners();
  }
}
