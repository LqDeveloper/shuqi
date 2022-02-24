import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shuqi/generated/l10n.dart';
import 'package:shuqi/utils/logger_utils.dart';
import 'package:shuqi/utils/screen_info.dart';
import 'package:shuqi/utils/sq_colors.dart';

class BookshelfPage extends StatefulWidget {
  const BookshelfPage({Key? key}) : super(key: key);

  @override
  State<BookshelfPage> createState() => _BookshelfPageState();
}

class _BookshelfPageState extends State<BookshelfPage>
    with AutomaticKeepAliveClientMixin {
  double _opacity = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double position = notification.metrics.pixels;
            if (position <= 0) {
              setState(() {
                _opacity = 0;
              });
            } else {
              setState(() {
                double temp = (position / 50);
                setState(() {
                  _opacity = temp > 1 ? 1.0 : temp;
                });
              });
            }
            return false;
          },
          child: Stack(
            children: [
              const _BookshelfWidget(),
              SizedBox(
                height: ScreenInfo.navigationBarHeight,
                child: _CustomAppBar(opacity: _opacity),
              )
            ],
          )),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _CustomAppBar extends StatelessWidget {
  final double opacity;

  const _CustomAppBar({Key? key, required this.opacity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(opacity),
      title: Text(
        S.of(context).tab_bookshelf,
        style: TextStyle(color: Colors.black.withOpacity(opacity)),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/actionbar_checkin.png",
              color: Color.lerp(Colors.white, Colors.black, opacity),
            )),
        IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/actionbar_search.png",
              color: Color.lerp(Colors.white, Colors.black, opacity),
            )),
      ],
    );
  }
}

class _BookshelfWidget extends StatefulWidget {
  const _BookshelfWidget({Key? key}) : super(key: key);

  @override
  State<_BookshelfWidget> createState() => _BookshelfWidgetState();
}

class _BookshelfWidgetState extends State<_BookshelfWidget> {
  late RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: SmartRefresher(
        controller: _refreshController,
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            const SliverVisibility(
                visible: true,
                sliver: SliverToBoxAdapter(
                  child: BookBanner(
                    url: "http://via.placeholder.com/120x160",
                  ),
                )),
            SliverGrid(
                delegate: SliverChildBuilderDelegate((cxt, index) {
                  return Container(
                    color: Colors.primaries[index % 18],
                  );
                }, childCount: 30),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 20))
          ],
        ),
      ),
    );
  }
}

class BookBanner extends StatelessWidget {
  final String url;

  const BookBanner({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        height:ScreenInfo.topSafeHeight +  250.h,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/bookshelf_bg.png",
                ),
                fit: BoxFit.cover)),
        child: Padding(
          padding:
              EdgeInsets.only(left: 15, right: 15, top: ScreenInfo.topSafeHeight + 34),
          child: Row(
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(color: Color(0x22000000), blurRadius: 8)
                ]),
                child: Image(
                  image: CachedNetworkImageProvider(url),
                  width: 120.w,
                  height: 160.h,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "逆天神医",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      const Text(
                        "读至2%，继续阅读",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
