import 'package:flutter/material.dart';

class BookStorePage extends StatefulWidget {
  const BookStorePage({Key? key}) : super(key: key);

  @override
  _BookStorePageState createState() => _BookStorePageState();
}

class _BookStorePageState extends State<BookStorePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Colors.green,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
