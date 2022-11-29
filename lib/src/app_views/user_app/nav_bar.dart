import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padie_mobile/src/app_views/user_app/profile/profile_page.dart';

import '../../../common/constants/colors.dart';
import 'booking/book_page.dart';
import 'contact/contact_page.dart';
import 'home_page/presentation/home_page.dart';


// import 'package:persistent_bottom_bar/persistent_bottom_bar_scaffold.dart';

class Nav extends StatelessWidget {
  static String routeName = "/navigation";
  final _tab1navigatorKey = GlobalKey<NavigatorState>();
  final _tab2navigatorKey = GlobalKey<NavigatorState>();
  final _tab3navigatorKey = GlobalKey<NavigatorState>();
  final _tab4navigatorKey = GlobalKey<NavigatorState>();

  Nav({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentBottomBarScaffold(
      items: [
        PersistentTabItem(
          tab: const HomePage(),
          icon: Icons.home,
          title: '',
          navigatorkey: _tab1navigatorKey,
        ),
        PersistentTabItem(
          tab: const ContactPage(),
          icon: Icons.phone,
          title: '',
          navigatorkey: _tab2navigatorKey,
        ),
        PersistentTabItem(
          tab: const BookPage(),
          icon: FontAwesomeIcons.calendar,
          title: '',
          navigatorkey: _tab3navigatorKey,
        ),
        PersistentTabItem(
          tab: const ProfilePage(),
          icon: Icons.person,
          title: '',
          navigatorkey: _tab4navigatorKey,
        ),
      ],
    );
  }
}



final currentTabProvider = StateProvider<int>((ref) => 0);
class PersistentBottomBarScaffold extends ConsumerStatefulWidget {
  /// pass the required items for the tabs and BottomNavigationBar
  final List<PersistentTabItem> items;

  const PersistentBottomBarScaffold({Key? key, required this.items})
      : super(key: key);

  @override
  _PersistentBottomBarScaffoldState createState() =>
      _PersistentBottomBarScaffoldState();
}


class _PersistentBottomBarScaffoldState extends ConsumerState<PersistentBottomBarScaffold> with SingleTickerProviderStateMixin{
  // int _selectedTab = 0;
  // int currentTab = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    int _selectedTab = ref.watch(currentTabProvider.notifier).state;
    return WillPopScope(
      onWillPop: () async {
        /// Check if current tab can be popped
        if (widget.items[_selectedTab].navigatorkey?.currentState?.canPop() ??
            false) {
          widget.items[_selectedTab].navigatorkey?.currentState?.pop();
          return false;
        } else {
          // if current tab can't be popped then use the root navigator
          return true;
        }
      },
      child: Scaffold(
        extendBody: true,
        /// Using indexedStack to maintain the order of the tabs and the state of the
        /// previously opened tab
        body: IndexedStack(
          index: _selectedTab,
          children: widget.items
              .map((page) => Navigator(
            /// Each tab is wrapped in a Navigator so that navigation in
            /// one tab can be independent of the other tabs
            key: page.navigatorkey,
            onGenerateInitialRoutes: (navigator, initialRoute) {
              return [
                MaterialPageRoute(builder: (context) => page.tab)
              ];
            },
          ))
              .toList(),
        ),

        /// Define the persistent bottom bar
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
                onTap: (index){
                  if (index == _selectedTab) {
                    /// if you want to pop the current tab to its root then use
                    widget.items[index].navigatorkey?.currentState
                        ?.popUntil((route) => route.isFirst);

                    // if you want to pop the current tab to its last page
                    // then use
                    widget.items[index].navigatorkey?.currentState?.pop();
                  } else {
                    setState(() {
                      _selectedTab = index;
                    });
                  }
                },
                indicatorColor: kOrange,
                tabs: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTab = 0;
                      });
                      ref.read(currentTabProvider.notifier).state = 0;
                    },
                    child: _selectedTab == 0 ?
                    const FaIcon(FontAwesomeIcons.house, size: 30, color: Colors.white,) :
                    const FaIcon(FontAwesomeIcons.house, size: 25, color: Colors.white54,),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTab == 1;
                      });
                      ref.read(currentTabProvider.notifier).state = 1;
                    },
                    child: _selectedTab == 1 ?
                    const FaIcon(FontAwesomeIcons.phone, size: 30, color: Colors.white,) :
                    const FaIcon(FontAwesomeIcons.phone, size: 25, color: Colors.white54,),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTab == 2;
                      });
                      ref.read(currentTabProvider.notifier).state = 2;
                    },
                    child: _selectedTab == 2 ?
                    const FaIcon(FontAwesomeIcons.calendar, size: 30, color: Colors.white,) :
                    const FaIcon(FontAwesomeIcons.calendar, size: 25, color: Colors.white54,),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _selectedTab == 3;
                      });
                      ref.read(currentTabProvider.notifier).state = 3;
                    },
                    child: _selectedTab == 3 ?
                    const FaIcon(FontAwesomeIcons.user, size: 30, color: Colors.white,) :
                    const FaIcon(FontAwesomeIcons.user, size: 25, color: Colors.white54,),
                  ),
                ],
                controller: _tabController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}



/// Model class that holds the tab info for the [PersistentBottomBarScaffold]
class PersistentTabItem {
  final Widget tab;
  final GlobalKey<NavigatorState>? navigatorkey;
  final String? title;
  final IconData icon;

  PersistentTabItem(
      {required this.tab,
        this.navigatorkey,
        this.title,
        required this.icon});
}









///////

class AnchoredOverlay extends StatelessWidget {
  final bool showOverlay;
  final Widget Function(BuildContext, Offset anchor) overlayBuilder;
  final Widget child;

  const AnchoredOverlay({
    super.key,
    required this.showOverlay,
    required this.overlayBuilder,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return OverlayBuilder(
        showOverlay: showOverlay,
        overlayBuilder: (BuildContext overlayContext) {
          RenderBox box = context.findRenderObject() as RenderBox;
          final center = box.size.center(
            box.localToGlobal(
              const Offset(0.0, 0.0),
            ),
          );

          return overlayBuilder(overlayContext, center);
        },
        child: child,
      );
    });
  }
}

class OverlayBuilder extends StatefulWidget {
  final bool showOverlay;
  final Function(BuildContext) overlayBuilder;
  final Widget child;

  const OverlayBuilder({
    super.key,
    this.showOverlay = false,
    required this.overlayBuilder,
    required this.child,
  });

  @override
  OverlayBuilderState createState() => OverlayBuilderState();
}

class OverlayBuilderState extends State<OverlayBuilder> {
  OverlayEntry? overlayEntry;

  @override
  void initState() {
    super.initState();

    if (widget.showOverlay) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showOverlay());
    }
  }

  @override
  void didUpdateWidget(OverlayBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => syncWidgetAndOverlay());
  }

  @override
  void reassemble() {
    super.reassemble();
    WidgetsBinding.instance.addPostFrameCallback((_) => syncWidgetAndOverlay());
  }

  @override
  void dispose() {
    if (isShowingOverlay()) {
      hideOverlay();
    }

    super.dispose();
  }

  bool isShowingOverlay() => overlayEntry != null;

  void showOverlay() {
    overlayEntry = OverlayEntry(
      builder: (context) => widget.overlayBuilder(context),
    );
    addToOverlay(overlayEntry!);
  }

  void addToOverlay(OverlayEntry entry) async {
    Overlay.of(context)!.insert(entry);
  }

  void hideOverlay() {
    overlayEntry!.remove();
    overlayEntry = null;
  }

  void syncWidgetAndOverlay() {
    if (isShowingOverlay() && !widget.showOverlay) {
      hideOverlay();
    } else if (!isShowingOverlay() && widget.showOverlay) {
      showOverlay();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class CenterAbout extends StatelessWidget {
  final Offset position;
  final Widget child;

  const CenterAbout({
    super.key,
    required this.position,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.dy,
      left: position.dx,
      child: FractionalTranslation(
        translation: const Offset(-0.5, -0.5),
        child: child,
      ),
    );
  }
}




class CustomDropDown<T> extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.itemList,
    this.hintText = 'Hint Text',
    this.initialValue,
    this.dropdownItemBuilder,
    this.onChanged,
    this.width = 250,
    this.height = 50,
    this.decoration,
  });
  final List<T> itemList;
  final String hintText;
  final Widget? initialValue;
  final Widget Function(BuildContext, T)? dropdownItemBuilder;
  final Function(T)? onChanged;
  final double width;
  final double height;
  final BoxDecoration? decoration;
  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> with SingleTickerProviderStateMixin {
  Widget? _currentItem;

  @override
  void initState() {
    super.initState();
    _currentItem = Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          if (widget.initialValue == null)
            _currentItem == null
                ? Text(
              widget.hintText,
              style: const TextStyle(
                color: Colors.grey,
              ),
            )
                : _currentItem!
          else
            widget.initialValue!,
        ],
      ),
    );
  }

  final LayerLink _layerLink = LayerLink();
  late final _animation = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );
  late final _curveAnimation = CurvedAnimation(
    parent: _animation,
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    super.dispose();
    _animation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy),
          child: CompositedTransformFollower(
            offset: Offset(0, widget.height + 5),
            link: _layerLink,
            showWhenUnlinked: false,
            child: Material(
              elevation: 3,
              color: Colors.white,
              child: SizeTransition(
                axis: Axis.vertical,
                sizeFactor: _curveAnimation,
                child: SizedBox(
                  height: widget.itemList.length <= 3 ? widget.itemList.length * 50 : 250,
                  width: _layerLink.leaderSize!.width,
                  child: ListView(
                    children: [
                      for (int i = 0; i < widget.itemList.length; i++)
                        SizedBox(
                          width: widget.width,
                          height: widget.height,
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                _animation.reverse();
                                _currentItem = Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      widget.dropdownItemBuilder?.call(context, widget.itemList[i]) ?? const SizedBox.shrink(),
                                    ],
                                  ),
                                );
                                widget.onChanged?.call(widget.itemList[i]);
                                setState(() {});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: widget.dropdownItemBuilder?.call(context, widget.itemList[i]),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Material(
          color: Colors.white,
          child: Container(
            decoration: widget.decoration ??
                BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
            width: widget.width,
            height: widget.height,
            child: InkWell(
              onTap: () {
                if (_animation.isDismissed) {
                  _animation.forward();
                } else {
                  _animation.reverse();
                }
              },
              child: _currentItem,
            ),
          ),
        ),
      ),
    );
  }
}

