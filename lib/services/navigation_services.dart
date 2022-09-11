import 'package:flutter/material.dart';

/// Navigation service without state.
class NavigationServices {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop({Object? argument}) {
    return _navigationKey.currentState?.pop(argument);
  }

  void popUntil() {
    int count = 0;
    return _navigationKey.currentState?.popUntil((_) => count++ >= 2);
  }

  Future<dynamic> popTo(String routeName, {Object? arguments}) {
    return _navigationKey.currentState!
        .popAndPushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return _navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> moveTo(String routeName,
      {Object? arguments, Object? result}) {
    return _navigationKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments, result: result);
  }

  Future<dynamic> pushTo(String routeName, {Object? arguments}) {
    return _navigationKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }
}