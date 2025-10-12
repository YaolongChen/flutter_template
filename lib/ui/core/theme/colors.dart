import 'package:flutter/material.dart';

abstract final class AppColors {
  static ColorScheme lightColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: Colors.blue,
  );

  static ColorScheme dartColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.blue,
  );
}