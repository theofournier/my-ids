import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider with ChangeNotifier {
  final _passwordKey = "my_ids_passwordKey";

  String _password;

  Future<void> retrievePassword() async {
    final storage = FlutterSecureStorage();
    String temp = await storage.read(key: _passwordKey);
    if (temp != null && temp.isNotEmpty) {
      _password = temp;
      notifyListeners();
    }
  }

  bool checkPassword(String password){
    return _password == password;
  }

  void savePassword(String password) async {
    final storage = FlutterSecureStorage();
    await storage.write(key: _passwordKey, value: password);
    _password = password;
    notifyListeners();
  }
}
