import 'package:flutter/material.dart';
import 'package:stockwise_mobile/ui/screens/auth_screen/auth_screen.dart';
import 'package:stockwise_mobile/ui/screens/home_screen/home_screen.dart';
import 'package:stockwise_mobile/ui/screens/splash_screen/splash_screen.dart';
import 'package:stockwise_mobile/ui/screens/test_screen/test_screen.dart';

class AppRouteProps {
  final Widget Function(RouteSettings) routeBuilder;
  final Type argumentsType;

  const AppRouteProps({
    @required this.routeBuilder,
    @required this.argumentsType,
  });
}

class AppRouter {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String test = '/test';

  static Map<String, AppRouteProps> routerBuildMap = {
    splash: AppRouteProps(
      routeBuilder: (settings) => SplashScreen(),
      argumentsType: Null,
    ),
    home: AppRouteProps(
      routeBuilder: (settings) => HomeScreen(),
      argumentsType: Null,
    ),
    login: AppRouteProps(
      routeBuilder: (settings) => AuthScreen(),
      argumentsType: Null,
    ),
    test: AppRouteProps(
      routeBuilder: (settings) => TestScreen(arguments: settings.arguments),
      argumentsType: TestScreenArguments,
    ),
  };
}

class MyRouterUtils {
  static PageRoute _buildPageRoute(
    RouteSettings settings,
    Widget widget,
  ) {
    return MaterialPageRoute(
      builder: (_) => widget,
      settings: settings,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var myRouteBuilder = AppRouter.routerBuildMap[settings.name]?.routeBuilder;
    if (myRouteBuilder != null) {
      return _buildPageRoute(settings, myRouteBuilder(settings));
    }

    return _buildPageRoute(
      settings,
      Scaffold(
        body: Center(
          child: Text('No route found: ${settings.name}.'),
        ),
      ),
    );
  }
}
