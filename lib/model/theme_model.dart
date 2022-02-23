import 'package:flutter/material.dart';
import 'package:shuqi/utils/sq_colors.dart';

class ThemeModel with ChangeNotifier {
  late ThemeData _themeData;

  ThemeData get theme => _themeData;

  ThemeModel() {
    _themeData = ThemeData(primaryColor: SQColor.primary,bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 2,
      selectedItemColor: SQColor.primary,
      unselectedItemColor: SQColor.gray,
      selectedLabelStyle: const TextStyle(fontSize: 12),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
      type: BottomNavigationBarType.fixed,
    ),appBarTheme: AppBarTheme(
      color: Colors.white,
      centerTitle: true,
      titleTextStyle:TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: SQColor.darkGray),
    ));
  }
}
