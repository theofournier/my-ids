import 'package:flutter/foundation.dart';
import 'package:my_ids/screens/ids/ids_screen.dart';

class BottomBarProvider with ChangeNotifier {
  String _currentRouteName = IdsScreen.routeName;

  get currentRouteName{
    return this._currentRouteName;
  }

  set currentRouteName(String routeName) {
    this._currentRouteName = routeName;
    notifyListeners();
  }
}