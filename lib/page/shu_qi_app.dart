import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shuqi/generated/l10n.dart';
import 'package:shuqi/model/theme_model.dart';

import 'package:shuqi/utils/route_manager.dart';

class ShuQiApp extends StatelessWidget {
  const ShuQiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "书旗",
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        RefreshLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      theme: context.watch<ThemeModel>().theme,
      onGenerateRoute: RouteManager.router.generator,
      builder: EasyLoading.init(),
    );
  }
}
