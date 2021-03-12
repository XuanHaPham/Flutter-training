import 'package:stockwise_mobile/global/global_data.dart';
import 'package:stockwise_mobile/global/locator/locator.dart';
import 'package:stockwise_mobile/global/locator/locator_daos.dart';
import 'package:stockwise_mobile/global/locator/locator_rest_client.dart';
import 'package:stockwise_mobile/global/locator/locator_services.dart';

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => GlobalData());

  setupRestClient();
  setupDaos();
  setupServices();
}
