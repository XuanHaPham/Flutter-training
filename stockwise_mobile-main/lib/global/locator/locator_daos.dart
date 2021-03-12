import 'package:stockwise_mobile/core/database/daos/implements/theme_dao.dart';
import 'package:stockwise_mobile/core/database/daos/interfaces/itheme_dao.dart';
import 'package:stockwise_mobile/global/locator/locator.dart';

void setupDaos() {
  locator.registerLazySingleton<IThemeDao>(() => ThemeDao());
}
