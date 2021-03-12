import 'package:flutter/src/material/app.dart';
import 'package:stockwise_mobile/core/database/daos/interfaces/itheme_dao.dart';
import 'package:stockwise_mobile/core/services/interfaces/itheme_service.dart';
import 'package:stockwise_mobile/global/locator/locator.dart';

class ThemeService implements IThemeService {
  final _themeDao = locator<IThemeDao>();

  @override
  Future<ThemeMode> getThemeFromLocalStorage() async {
    String currentThemeModeString = await _themeDao.getMyTheme();
    return currentThemeModeString == 'light' ? ThemeMode.light : ThemeMode.dark;
  }

  @override
  Future<void> saveThemeToLocalStorage(ThemeMode themeMode) async {
    String currentThemeModeString =
        themeMode == ThemeMode.light ? 'light' : 'dark';
    await _themeDao.saveThemeMode(currentThemeModeString);
  }
}
