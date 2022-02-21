import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  static final SPUtils _instance = SPUtils._internal();

  static SPUtils get instance => _instance;

  factory SPUtils() => _instance;

  late SharedPreferences _sharedPreferences;

  SPUtils._internal() {}

  static Future<void> initSP() async {
    _instance._sharedPreferences = await SharedPreferences.getInstance();
  }
}
