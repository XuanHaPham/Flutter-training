import 'package:stockwise_mobile/global/environment.dart';
import 'package:stockwise_mobile/main.dart';

void main() {
  EnvironmentUtil.setEnvironment(Environment.prod);
  mainDelegate();
}
