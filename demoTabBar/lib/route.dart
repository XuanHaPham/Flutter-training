import 'package:demoTabBar/Left_page_2.dart';
import 'package:demoTabBar/left_page.dart';
import 'package:demoTabBar/right_page.dart';
import 'package:flutter/material.dart';

class Router {
  static const String left = '/left_page';
  static const String left2 = '/left_page_2';
  static const String right = '/right_page';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case left:
        return MaterialPageRoute(builder: (_) => LeftPage());
      case left2:
      return MaterialPageRoute(builder: (_) => LeftPage2());
      case right:
        return MaterialPageRoute(builder: (_) => RightPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route found: ${settings.name}.'),
            ),
          )
        );
    }
  }
}
