import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyloadingWrapper extends StatelessWidget {
  final Widget child;

  const EasyloadingWrapper({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterEasyLoading(
      child: child,
    );
  }
}
