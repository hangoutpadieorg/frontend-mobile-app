import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/common/constants/size_config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padie_mobile/src/onBoarding/onBoarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_screen/splash_screen.dart';
import 'src/nav_bar.dart';
//// 428 926
int? isViewed;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final sharePreferences = await SharedPreferences.getInstance();
  ////////onBoard
  isViewed = sharePreferences.getInt('onBoard');
  print('saved');
      runApp(const ProviderScope(
       child: MyApp(),
  ));
}
// overrides: [
//   sharedPreferencesProvider.overrideWithValue(sharePreferences),
// ],
// final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
//   throw UnimplementedError();
// });

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child)=>MaterialApp(
          scrollBehavior: const MaterialScrollBehavior(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: isViewed != 0 ? const SplashScreen() : const Navigation(),
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