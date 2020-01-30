import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
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
  }

  Future<bool> checkBiometrics() async {
    final LocalAuthentication auth = LocalAuthentication();
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    return canCheckBiometrics;
  }

  Future<List<BiometricType>> availableBiometrics() async{
    final LocalAuthentication auth = LocalAuthentication();
    List<BiometricType> availableBiometrics = [];
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    return availableBiometrics;
  }

  Future<void> authenticateBiometrics(String title, Function onError, Function onSuccess) async{
    final LocalAuthentication auth = LocalAuthentication();
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: title,
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
      onError();
    }

    if(authenticated){
      onSuccess();
    } else {
      onError();
    }
  }

  void saveBiometricEnable(bool isEnable){
    Hive.box(HiveKeys.authBoxName).put(HiveKeys.isBiometricEnabledKey, isEnable);
  }

  bool checkBiometricEnable(){
    return Hive.box(HiveKeys.authBoxName).get(HiveKeys.isBiometricEnabledKey) ?? false;
  }
}
