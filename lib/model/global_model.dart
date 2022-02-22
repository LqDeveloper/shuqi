import 'package:flutter/cupertino.dart';

class GlobalModel with ChangeNotifier {
  int _tapIndex = 0;

  int get tapIndex => _tapIndex;

  set tapIndex(int value) {
    _tapIndex = value;
    notifyListeners();
  }
}
