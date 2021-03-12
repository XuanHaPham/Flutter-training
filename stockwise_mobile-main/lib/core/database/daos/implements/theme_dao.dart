import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stockwise_mobile/core/database/daos/interfaces/itheme_dao.dart';

const currentThemeModeKey = 'currentThemeMode';

class ThemeDao implements IThemeDao {
  Future<void> saveThemeMode(String themeModeString) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      currentThemeModeKey,
      themeModeString,
    );
  }

  Future<String> getMyTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeString = prefs.getString(currentThemeModeKey);

    if (themeModeString == null) {
      return 'light';
    }

    return themeModeString;
  }
}
