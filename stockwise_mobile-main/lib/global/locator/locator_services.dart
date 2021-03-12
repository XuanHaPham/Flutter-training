import 'package:stockwise_mobile/core/services/implements/auth_service.dart';
import 'package:stockwise_mobile/core/services/implements/theme_service.dart';
import 'package:stockwise_mobile/core/services/interfaces/iauth_service.dart';
import 'package:stockwise_mobile/core/services/interfaces/itheme_service.dart';
import 'package:stockwise_mobile/global/locator/locator.dart';

void setupServices() {
  locator.registerLazySingleton<IAuthService>(() => AuthService());
  locator.registerLazySingleton<IThemeService>(() => ThemeService());
}
