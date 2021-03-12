import 'package:flutter/material.dart';

abstract class IThemeService {
  Future<ThemeMode> getThemeFromLocalStorage();
  Future<void> saveThemeToLocalStorage(ThemeMode themeMode);
}
