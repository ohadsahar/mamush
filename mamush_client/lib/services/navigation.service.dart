import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void navigateReplace(String routeName, dynamic arguments) {
    navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  void navigate(String routeName, dynamic arguments) {
    navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  void pop() {
    navigatorKey.currentState!.pop();
  }
}
