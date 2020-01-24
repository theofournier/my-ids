import 'package:flutter/material.dart';

final ThemeData themeData = new ThemeData(
  primarySwatch: const MaterialColor(0xFF3C70A4, AppColors.color),
  primaryColor: const Color(0xFF2c7873),
  primaryColorDark: const Color(0xFF004c48),
  primaryColorLight: const Color(0xFF5ea7a2),
  accentColor: const Color(0xFFffba5a),
  errorColor: const Color(0xFFAF6566),
  backgroundColor: AppColors.greyBackgroundLight,
  fontFamily: 'OpenSans',
);

class AppColors {
  AppColors._(); // this basically makes it so you can instantiate this class
  static const Map<int, Color> color = const <int, Color>{
    50: const Color(0x1A2c7873),
    100: const Color(0x332c7873),
    200: const Color(0x4D2c7873),
    300: const Color(0x662c7873),
    400: const Color(0x802c7873),
    500: const Color(0x992c7873),
    600: const Color(0xB32c7873),
    700: const Color(0xCC2c7873),
    800: const Color(0xE62c7873),
    900: const Color(0xFF2c7873)
  };

  static const Color greyBackgroundLight = const Color(0xFFFBFCFC);
  static const Color greyBackground = const Color(0xFFF5F5F5);
  static const Color greyBackgroundDark = const Color(0xFFECF0F1);

  static const List<Color> idColors = const [
    const Color(0xFFCD6155),
    const Color(0xFF6e5773),
    const Color(0xFF6a8caf),
    const Color(0xFF71a95a),
    const Color(0xFF36b5b0),
    const Color(0xFFe3b04b),
    const Color(0xFFfe9801),
    const Color(0xFFee8572),
    const Color(0xFFa35638),
    const Color(0xFFAAB7B8),
    const Color(0xFF5D6D7E),

  ];
}
