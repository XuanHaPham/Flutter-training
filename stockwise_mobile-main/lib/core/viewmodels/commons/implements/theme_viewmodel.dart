import 'package:flutter/material.dart';
import 'package:stockwise_mobile/core/services/interfaces/itheme_service.dart';
import 'package:stockwise_mobile/core/viewmodels/commons/interfaces/itheme_viewmodel.dart';
import 'package:stockwise_mobile/global/locator/locator.dart';

class ThemeViewmodel extends ChangeNotifier implements IThemeViewmodel {
  final _themeService = locator<IThemeService>();

  ThemeMode _currentThemeMode = ThemeMode.light;
  ThemeMode get currentThemeMode => _currentThemeMode;

  @override
  Future<void> initTheme() async {
    _currentThemeMode = await _themeService.getThemeFromLocalStorage();
    notifyListeners();
  }

  @override
  Future<void> toggleTheme() async {
    _currentThemeMode =
        _currentThemeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await _themeService.saveThemeToLocalStorage(_currentThemeMode);
    notifyListeners();
  }
}
