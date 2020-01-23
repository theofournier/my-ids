import 'package:flutter/material.dart';
import 'package:my_ids/screens/home/home_screen.dart';
import 'package:my_ids/screens/ids/ids_screen.dart';
import 'package:my_ids/screens/profile/profile_screen.dart';
import 'package:my_ids/screens/settings/settings_screen.dart';
import 'package:my_ids/screens/splash/splash_screen.dart';

final routes = <String, WidgetBuilder> {
  SplashScreen.routeName: (ctx) => SplashScreen(),
  HomeScreen.routeName: (ctx) => HomeScreen(),
  IdsScreen.routeName: (ctx) => IdsScreen(),
  ProfileScreen.routeName: (ctx) => ProfileScreen(),
  SettingsScreen.routeName: (ctx) => SettingsScreen(),
};