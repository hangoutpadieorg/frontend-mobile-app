/*

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padie_mobile/src/book/book_page.dart';
import 'contact/contact_page.dart';
import 'home_page/presentation/home_page.dart';
import 'profile/profile_page.dart';

final currentTabProvider = StateProvider.autoDispose<int>((ref) => 0);

class Navigation extends ConsumerWidget {
  static const routeName = "/navigation";
  Navigation({Key? key}) : super(key: key);

  final List<Widget> screens = [
    const HomePage(),
    const ContactPage(),
    const BookPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentTab = ref.watch(currentTabProvider);
    return Scaffold(
      body: screens[currentTab],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Material(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                color: const Color(0xffE0E0E0),
                width: 0.5.w,
              ),
              borderRadius: BorderRadius.circular(20.0)),
          child: BottomNavigationBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            //////////////
            unselectedItemColor: const Color(0xff59647D),
            selectedItemColor: Colors.white,
            selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
            unselectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xff59647D),
            ),
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5.0.h),
                  child: const FaIcon(
                    FontAwesomeIcons.home,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5.0.h),
                  child: const FaIcon(
                    FontAwesomeIcons.home,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5.0.h),
                  child: const FaIcon(
                    FontAwesomeIcons.home,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5.0.h),
                  child: const FaIcon(
                    FontAwesomeIcons.home,
                  ),
                ),
              ),
            ],
            currentIndex: ref.watch(currentTabProvider),
            onTap: (index) {
              ref.read(currentTabProvider.notifier).state = index;
            },
          ),
        ),
      ),
    );
  }
}
*/



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padie_mobile/common/constants/colors.dart';
import 'package:padie_mobile/src/contact/contact_page.dart';
import '../common/constants/size_config.dart';
import 'book/book_page.dart';
import 'home_page/presentation/home_page.dart';
import 'profile/profile_page.dart';

final currentTabProvider = StateProvider<int>((ref) => 0);
class Navigation extends ConsumerStatefulWidget {
  static const routeName = "/navigation";

  const Navigation({Key? key}) : super(key: key);
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends ConsumerState<Navigation>
    with SingleTickerProviderStateMixin {
  bool isSelected = false;
  TabController? _tabController;
  // int currentTab = 0;
  final List<Widget> screens = const [
    HomePage(),
    ContactPage(),
    BookPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int currentTab = ref.watch(currentTabProvider.notifier).state;
    return Scaffold(
      extendBody: true,
      // extendBodyBehindAppBar: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 35, left: 35),
        child: BottomAppBar(
          color: Colors.transparent,
          child: Container(
            // margin: const EdgeInsets.only(left: 25, right: 25),
            decoration: const BoxDecoration(
              color: kOrange,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(20),
                topStart: Radius.circular(20),
                bottomEnd: Radius.circular(20),
                bottomStart: Radius.circular(20),
              ),
            ),
            height: 62,
            // width: MediaQuery.of(context).size.width * 0.8,
            child: TabBar(
              // unselectedLabelColor: Colors.white,
              indicatorColor: kOrange,
              tabs: [
                InkWell(
                  onTap: () {
                    setState(() {
                      currentTab = 0;
                    });
                    ref.read(currentTabProvider.notifier).state = 0;
                  },
                  child: currentTab == 0 ?
                      const FaIcon(FontAwesomeIcons.home, size: 30, color: Colors.white,) :
                      const FaIcon(FontAwesomeIcons.home, size: 25, color: Colors.white54,),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentTab == 1;
                    });
                    ref.read(currentTabProvider.notifier).state = 1;
                  },
                  child: currentTab == 1 ?
                  const FaIcon(FontAwesomeIcons.phone, size: 30, color: Colors.white,) :
                  const FaIcon(FontAwesomeIcons.phone, size: 25, color: Colors.white54,),
                  ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentTab == 2;
                    });
                    ref.read(currentTabProvider.notifier).state = 2;
                  },
                  child: currentTab == 2 ?
                  const FaIcon(FontAwesomeIcons.calendar, size: 30, color: Colors.white,) :
                  const FaIcon(FontAwesomeIcons.calendar, size: 25, color: Colors.white54,),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentTab == 3;
                    });
                    ref.read(currentTabProvider.notifier).state = 3;
                  },
                  child: currentTab == 3 ?
                  const FaIcon(FontAwesomeIcons.user, size: 30, color: Colors.white,) :
                  const FaIcon(FontAwesomeIcons.user, size: 25, color: Colors.white54,),
                ),
                // InkWell(
                //   onTap: () async {
                //     final profileFuture = ref.watch(profileControllerProvider);
                //     profileFuture.whenData((profile) {
                //       if (profile.documents!.isNotEmpty ||
                //           profile.businessDetails!.status == "successful") {
                //         // setState(() {
                //         ref.read(currentTabProvider.notifier).state = 2;
                //         // });
                //       } else {
                //         showDialog(
                //             context: context,
                //             builder: (context) {
                //               return const AlertDialog(
                //                 content: DialogContent(),
                //               );
                //             });
                //       }
                //     });
                //   },
                //   child: ImageIcon(
                //     AssetImage(currentTab == 2
                //         ? 'assets/images/profile_tapped.png'
                //         : 'assets/images/profileTab.png'),
                //     color: currentTab == 2 ? kTertiaryColor : Colors.white,
                //   ),
                // )
              ],
              controller: _tabController,
            ),
          ),
        ),
      ),
      body: screens[currentTab],
    );
  }
}

