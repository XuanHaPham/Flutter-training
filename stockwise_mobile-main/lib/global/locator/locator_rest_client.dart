import 'package:dio/dio.dart';
import 'package:stockwise_mobile/core/api/rest_client.dart';
import 'package:stockwise_mobile/global/environment.dart';
import 'package:stockwise_mobile/global/locator/locator.dart';

void setupRestClient({String bearerAuthToken}) {
  var dio = Dio();
  dio.options = BaseOptions(
    headers: <String, dynamic>{
      'ApiKey': EnvironmentUtil.getEnvironmentConfigs().apiKey,
    },
  );

  if ([null, ''].contains(bearerAuthToken) == false) {
    dio.options.headers["Authorization"] = "Bearer $bearerAuthToken";
  }

  try {
    locator.unregister(instanceName: "RestClient");
  } catch (e) {}

  locator.registerLazySingleton(
    () => RestClient(
      dio,
      baseUrl: EnvironmentUtil.getEnvironmentConfigs().apiUrl,
    ),
    instanceName: "RestClient",
  );
}

RestClient getRestClient() {
  return locator.get<RestClient>(instanceName: 'RestClient');
}
