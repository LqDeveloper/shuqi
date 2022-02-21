import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final Object error;
  final StackTrace? stack;

  const CustomErrorWidget({Key? key, required this.error, required this.stack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("发生了错误"),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "错误描述:",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                Text(
                  "$error",
                  style: const TextStyle(fontSize: 15, color: Colors.red),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "错误栈信息:",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                Text(
                  "$stack",
                  style: const TextStyle(fontSize: 15, color: Colors.red),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
