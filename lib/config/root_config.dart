import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shuqi/config/provide_wrapper.dart';
import 'package:shuqi/config/pull_refresh_wrapper.dart';
import 'package:shuqi/config/screen_wrapper.dart';
import 'package:shuqi/utils/logger_utils.dart';
import 'package:shuqi/utils/sp_utils.dart';

class RootConfig {
  static void runShuQiApp(Widget child) {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await initLib();
      // FlutterError.onError = (details) {
      //   Zone.current.handleUncaughtError(details.exception, details.stack!);
      // };

      // ErrorWidget.builder = (detail) {
      //   return Container(
      //     color: Colors.green,
      //     child: Text("$detail"),
      //   );
      // };
      runApp(ProvierWrapper(
          child: PullRefreshWrapper(
        child: child,
      )));
    }, (Object error, StackTrace stack) {
      // if (kDebugMode) {
      //   FlutterErrorDetails detail =
      //       FlutterErrorDetails(exception: error, stack: stack);
      //   FlutterError.dumpErrorToConsole(detail);
      // } else {
      //   //异常上报
      // }
    });
  }

  static Future initLib() async {
    await SPUtils.initSP();
    conifgEasyLoading();
  }

  //https://github.com/0xPool/flutter_easyloading/blob/master/README-zh_CN.md
  static void conifgEasyLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  static void handleError(String message, Object error, StackTrace? stack) {
    LoggerUtils.e(message, error, stack);
  }
}
