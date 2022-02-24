import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ScreenInfo {
  static double get width => MediaQueryData.fromWindow(ui.window).size.width;

  static double get height => MediaQueryData.fromWindow(ui.window).size.height;

  static double get scale =>
      MediaQueryData.fromWindow(ui.window).devicePixelRatio;

  static double get textScaleFactor =>
      MediaQueryData.fromWindow(ui.window).textScaleFactor;

  static double get appBarHeight => kToolbarHeight;

  static double get bottomNavHeight => kBottomNavigationBarHeight;

  static double get navigationBarHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top + kToolbarHeight;
  }

  static double get topSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top;
  }

  static double get bottomSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.bottom;
  }
}
