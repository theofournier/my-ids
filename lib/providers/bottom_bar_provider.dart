import 'package:flutter/foundation.dart';

class BottomBarProvider with ChangeNotifier {
  String _currentRouteName = "/profile";

  get currentRouteName{
    return this._currentRouteName;
  }

  set currentRouteName(String routeName) {
    this._currentRouteName = routeName;
    notifyListeners();
  }
}