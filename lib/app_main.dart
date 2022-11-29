import 'dart:io';
import 'dart:ui';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:padie_mobile/main.dart';
import 'package:webview_flutter/webview_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'common/constants/colors.dart';
// import 'common/constants/firebase_messaging.dart';
import 'common/constants/routes.dart';
// import 'firebase_options.dart';
// import 'splash_screen/splash_screen.dart';
// import 'src/user_app/nav_bar.dart';



GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();
class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  FirebaseMessaging? messaging;

  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        setState(() {
          InAppUpdate.performImmediateUpdate();
        });
      }
    }).catchError((e) {
      debugPrint("THIS FIREBASE_MESSAGING ERROR: $e");
      // showSnack(e.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    checkForUpdate();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: kPrimaryColor));
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    // Ref ref = Ref;
    // Ref? ref;
    
    final messageFromFirebaseHandling = ref.read(messageFromFirebaseHandlingProvider);
    // you.onMessage();
    // messageFromFirebaseHandling = MessageFromFirebaseHandling.init(ref);
    messageFromFirebaseHandling.resolvePlatform();
    messageFromFirebaseHandling.onMessage();
    messageFromFirebaseHandling.onMessageOpened();
  }
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child)=>MaterialApp(
          navigatorKey: mainNavigatorKey,
          scrollBehavior: const MaterialScrollBehavior(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // routes: routes,
          initialRoute: '/',//SplashScreen.routeName
          onGenerateRoute: MyRoutes.generateRoutes,
          // home: isViewed != 0 ? const SplashScreen() :  Nav(),
        )
    );
  }
}

class MyScrollBehaviour extends MaterialScrollBehavior{
  @override
  Set<PointerDeviceKind> get dragDevice => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}