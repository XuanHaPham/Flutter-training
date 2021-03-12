import 'package:flutter/material.dart';

enum Environment {
  dev,
  prod,
}

class EnvironmentConfigs {
  final String apiUrl;
  final String apiKey;

  const EnvironmentConfigs({
    @required this.apiUrl,
    @required this.apiKey,
  });
}

const Map<Environment, EnvironmentConfigs> _environmentWithConfigsMap = {
  Environment.dev: const EnvironmentConfigs(
    apiUrl: 'https://dev-don-api.ecr-aws.co.uk/',
    apiKey: '',
  ),
  Environment.prod: const EnvironmentConfigs(
    apiUrl: 'https://dev-gwr-atseat-api.ecr-aws.co.uk/',
    apiKey: '',
  ),
};

class EnvironmentUtil {
  static Environment _currentEnvironment;

  static EnvironmentConfigs _currentEnvironmentConfigs;

  static void setEnvironment(Environment env) {
    _currentEnvironment = env;
    _currentEnvironmentConfigs = _environmentWithConfigsMap[env];
  }

  static Environment getEnvironment() {
    return _currentEnvironment;
  }

  static EnvironmentConfigs getEnvironmentConfigs() {
    return _currentEnvironmentConfigs;
  }
}
