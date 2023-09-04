import 'package:flutter/material.dart';

class AppTheme {
  static final defaultLightColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.purple,
  );

  static final defaultDarkColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.purple,
    brightness: Brightness.dark,
  );

  static const mode = ThemeMode.dark;

  static ThemeData getLightTheme(ColorScheme? lightColorScheme) {
    return ThemeData(
      colorScheme: lightColorScheme ?? AppTheme.defaultLightColorScheme,
      useMaterial3: true,
    );
  }

  static ThemeData getDarkTheme(ColorScheme? darkColorScheme) {
    return ThemeData(
      colorScheme: darkColorScheme ?? AppTheme.defaultLightColorScheme,
      useMaterial3: true,
    );
  }
}
