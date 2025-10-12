import 'package:flutter/material.dart';

import 'colors.dart';

abstract final class AppTheme {
  static const InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(border: OutlineInputBorder());

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    inputDecorationTheme: _inputDecorationTheme,
  );

  static ThemeData dartTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColors.dartColorScheme,
    inputDecorationTheme: _inputDecorationTheme,
  );
}
