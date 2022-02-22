import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shuqi/model/global_model.dart';
import 'package:shuqi/model/theme_model.dart';

class ProvierWrapper extends StatelessWidget {
  final Widget child;

  const ProvierWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => GlobalModel())
      ],
      child: child,
    );
  }
}
