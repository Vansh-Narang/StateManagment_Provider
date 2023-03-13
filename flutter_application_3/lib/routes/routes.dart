import 'package:flutter/material.dart';
import 'package:flutter_application_3/pages/login.dart';
import 'package:flutter_application_3/pages/main_page.dart';
import 'package:flutter_application_3/pages/settings.dart';

class RouteManager {
  static const String loginPage = '/';
  static const String mainPage = '/mainPage';
  static const String settingsPage = '/settingsPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(
          builder: (context) => Login(),
        );

      case mainPage:
        return MaterialPageRoute(
          builder: (context) => MainPage(),
        );

      case settingsPage:
        return MaterialPageRoute(
          builder: (context) => Settings(),
        );

      default:
        throw FormatException('Route not found! Check routes again!');
    }
  }
}
