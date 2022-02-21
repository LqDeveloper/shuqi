import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shuqi/config/easyloading_wrapper.dart';
import 'package:shuqi/config/pull_refresh_wrapper.dart';
import 'package:shuqi/config/screen_wrapper.dart';
import 'package:shuqi/page/custom_error.dart';
import 'package:shuqi/utils/logger_utils.dart';
import 'package:shuqi/utils/sp_utils.dart';

class RootConfig {
  static void runShuQiApp(Widget child) {
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await initLib();
      FlutterError.onError = (details) {
        handleError("Flutter引起的错误", details.exception, details.stack);
      };
      ErrorWidget.builder = (detail) =>
          CustomErrorWidget(error: detail.exception, stack: detail.stack);
      runApp(ScreenWrapper(
        child: EasyloadingWrapper(
          child: PullRefreshWrapper(
            child: child,
          ),
        ),
      ));
    }, (Object error, StackTrace stack) {
      handleError("F未被 Flutter 捕获的错误", error, stack);
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
