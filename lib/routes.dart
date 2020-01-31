import 'package:flutter/material.dart';
import 'package:my_ids/screens/auth/login_screen.dart';
import 'package:my_ids/screens/auth/register_screen.dart';
import 'package:my_ids/screens/edit_id/edit_id_screen.dart';
import 'package:my_ids/screens/home/home_screen.dart';
import 'package:my_ids/screens/id/id_screen.dart';
import 'package:my_ids/screens/ids/ids_screen.dart';
import 'package:my_ids/screens/profile/profile_screen.dart';
import 'package:my_ids/screens/settings/settings_screen.dart';
import 'package:my_ids/screens/splash/splash_screen.dart';
import 'package:my_ids/screens/update_master_code/update_master_code_screen.dart';

final routes = <String, WidgetBuilder> {
  SplashScreen.routeName: (ctx) => SplashScreen(),
  HomeScreen.routeName: (ctx) => HomeScreen(),
  IdsScreen.routeName: (ctx) => IdsScreen(),
  IdScreen.routeName: (ctx) => IdScreen(),
  ProfileScreen.routeName: (ctx) => ProfileScreen(),
  SettingsScreen.routeName: (ctx) => SettingsScreen(),
  EditIdScreen.routeName: (ctx) => EditIdScreen(),
  RegisterScreen.routeName: (ctx) => RegisterScreen(),
  LoginScreen.routeName: (ctx) => LoginScreen(),
  UpdateMasterCodeScreen.routeName: (ctx) => UpdateMasterCodeScreen(),
};