import 'package:fluro/fluro.dart';
import 'package:shuqi/page/home_page.dart';
import 'package:flutter/material.dart';

class RouterPath {
  static const home = "/home";
}

class RouteManager {
  static final RouteManager _manager = RouteManager._internal();
  late final FluroRouter _router;

  static FluroRouter get router => _manager._router;

  RouteManager._internal() {
    _router = FluroRouter();
    addHomePage();
  }

  void addHomePage() {
    final handler = Handler(handlerFunc:
        (BuildContext? context, Map<String, List<String>> parameters) {
      return const HomePage();
    });
    _router.define(RouterPath.home, handler: handler);
  }
}
