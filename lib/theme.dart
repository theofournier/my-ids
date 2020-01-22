import 'package:flutter/material.dart';

final ThemeData themeData = new ThemeData(
  primarySwatch: const MaterialColor(0xFF3C70A4, AppColors.color),
  primaryColor: const Color(0xFF1d3e53),
  primaryColorDark: const Color(0xFF00182a),
  primaryColorLight: const Color(0xFF4a687f),
  accentColor: const Color(0xFFffba5a),
  errorColor: const Color(0xFFAF6566),
  fontFamily: 'OpenSans',
);

class AppColors {
  AppColors._(); // this basically makes it so you can instantiate this class
  static const Map<int, Color> color = const <int, Color>{
    50: const Color(0x1A1d3e53),
    100: const Color(0x331d3e53),
    200: const Color(0x4D1d3e53),
    300: const Color(0x661d3e53),
    400: const Color(0x801d3e53),
    500: const Color(0x991d3e53),
    600: const Color(0xB31d3e53),
    700: const Color(0xCC1d3e53),
    800: const Color(0xE61d3e53),
    900: const Color(0xFF1d3e53)
  };

  static const Color greyBackground = const Color(0xFFF5F5F5);
}
