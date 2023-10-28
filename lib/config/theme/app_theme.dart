import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.blue,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
    );
  }
}
