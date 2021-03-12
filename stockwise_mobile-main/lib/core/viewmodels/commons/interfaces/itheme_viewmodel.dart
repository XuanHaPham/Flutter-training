import 'package:flutter/material.dart';

abstract class IThemeViewmodel implements ChangeNotifier {
  ThemeMode get currentThemeMode;

  Future<void> initTheme();
  Future<void> toggleTheme();
}
