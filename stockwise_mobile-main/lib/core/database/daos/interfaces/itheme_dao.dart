abstract class IThemeDao {
  Future<void> saveThemeMode(String themeModeString);
  Future<String> getMyTheme();
}
