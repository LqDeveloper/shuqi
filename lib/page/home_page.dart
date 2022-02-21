import 'package:flutter/material.dart';
import 'package:shuqi/config/easyloading_wrapper.dart';
import 'package:shuqi/config/pull_refresh_wrapper.dart';
import 'package:shuqi/config/screen_wrapper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "书旗",
    );
  }
}
