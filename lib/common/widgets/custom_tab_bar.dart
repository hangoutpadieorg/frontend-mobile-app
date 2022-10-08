import 'package:flutter/material.dart';
import 'package:padie_mobile/common/constants/colors.dart';

import '../constants/size_config.dart';
// import 'package:numbers/utils/size_config.dart';

class TabBarComponent extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> tabViews;

  const TabBarComponent({Key? key, required this.tabs, required this.tabViews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(children: [
        TabBar(
          labelColor: Colors.black,
          // unselectedLabelColor: Color(0xFFB6B6B6),
          isScrollable: true,
          indicator: CustomTabIndicator(),
          labelPadding: const EdgeInsets.only(left: 20, right: 20),
          labelStyle: TextStyle(
              fontSize: getFontSize(18),
              fontWeight: FontWeight.w700,
              // fontFamily: 'Ubuntu'
          ),
          tabs: tabs.map((tab) => Tab(text: tab)).toList(),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          // height: 10,
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: tabViews,
          ),
        ),
      ]),
    );
  }
}

/* ---------------------CUSTOM_PAINTER------------------------ */
class CustomTabIndicator extends Decoration {
  @override
  _CustomPainter createBoxPainter([VoidCallback? onChanged]) =>
      _CustomPainter(this, onChanged);
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;

  _CustomPainter(this.decoration, VoidCallback? onChanged)
      :
        super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    

    final Rect rect = Rect.fromLTWH(
        configuration.size!.width / 4.4 + offset.dx - 30,
        offset.dy + 40,
        150,
        3);
    final Paint paint = Paint();
    paint.color = kOrange;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topLeft: const Radius.circular(0),
        topRight: const Radius.circular(0),
      ),
      paint,
    );
  }
}
