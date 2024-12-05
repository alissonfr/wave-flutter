import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData.dark().copyWith(
    primaryColor: Color(0xFFF43048),
    colorScheme: ColorScheme.dark(
      primary: Color(0xFFF43048),
      secondary: Color(0xFFF43048),
    ),
    scaffoldBackgroundColor: Color(0xFF121212),
  );
}

class Palette {
  static const MaterialColor secondaryColor =
      MaterialColor(0xFF121212, <int, Color>{});

  static const MaterialColor secondarySwatchColor =
      MaterialColor(0xFF2A2A2A, <int, Color>{});
}
