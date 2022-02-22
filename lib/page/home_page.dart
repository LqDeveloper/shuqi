import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shuqi/generated/l10n.dart';
import 'package:shuqi/model/global_model.dart';
import 'package:shuqi/page/book_store_page.dart';
import 'package:shuqi/page/bookshelf_page.dart';
import 'package:shuqi/page/me_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [BookshelfPage(), BookStorePage(), MePage()],
      ),
      bottomNavigationBar: _CustomBottomNavBar(
        onTap: (index) {
          _controller.jumpToPage(index);
        },
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  final ValueChanged<int> onTap;

  _CustomBottomNavBar({Key? key, required this.onTap}) : super(key: key);
  final _selectImages = [
    "assets/images/tab_bookshelf_p.png",
    "assets/images/tab_bookstore_p.png",
    "assets/images/tab_me_p.png"
  ];
  final _unselectImages = [
    "assets/images/tab_bookshelf_n.png",
    "assets/images/tab_bookstore_n.png",
    "assets/images/tab_me_n.png"
  ];
  final _titles = [
    S.current.tab_bookshelf,
    S.current.tab_bookstore,
    S.current.tab_me
  ];

  @override
  Widget build(BuildContext context) {
    return Selector<GlobalModel, int>(
        builder: (_, currentIndex, child) {
          return BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<GlobalModel>().tapIndex = index;
              onTap(index);
            },
            items: List.generate(_titles.length, (index) {
              return BottomNavigationBarItem(
                  icon: _getUnSelectedImage(index),
                  activeIcon: _getSelectedImage(index),
                  label: _titles[index]);
            }),
          );
        },
        selector: (_, model) => model.tapIndex);
  }

  Widget _getSelectedImage(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Image.asset(
        _selectImages[index], width: 22,
        excludeFromSemantics: true, //去除图片语义
        gaplessPlayback: true,
      ),
    );
  }

  Widget _getUnSelectedImage(int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Image.asset(
        _unselectImages[index], width: 22,
        excludeFromSemantics: true, //去除图片语义
        gaplessPlayback: true,
      ),
    );
  }
}
