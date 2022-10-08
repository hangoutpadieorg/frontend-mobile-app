import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padie_mobile/common/widgets/custom_tab_bar.dart';
import '../../../../common/constants/size_config.dart';
import '../../../../common/widgets/appbar.dart';
import '../../../../common/widgets/side_scroll_lists.dart';
import '../category_page/category.dart';
import '../event_page/event.dart';
import '../location_page/location.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    // TabController controller = TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding:  EdgeInsets.only(
            top: getProportionateScreenHeight(10),
            right: getProportionateScreenWidth(26),
            left: getProportionateScreenWidth(26),),
        child: const SingleChildScrollView(
          physics:  ScrollPhysics(),
          child: TabBarComponent(tabs: ["LOCATIONS","EVENTS","CATEGORIES"], tabViews: [
            Locations(),
            Events(),
            Categories(),
          ]),
        ),
      )
    );
  }
}


