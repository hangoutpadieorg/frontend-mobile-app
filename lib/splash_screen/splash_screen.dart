import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/src/controllers/profile_controller.dart';
import 'package:padie_mobile/src/services/auth/shared_prefernces.dart';
import '../common/constants/strings.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/splash";

  Future<void> navigateTo(BuildContext context, WidgetRef ref) async {
    String? token = await Preferences().getToken();
    if (token != null) {
      debugPrint("token is not null");
      final profileFuture = ref.watch(profileControllerProvider);
      profileFuture.when(
          error: (e, st) =>
              Navigator.of(context).pushReplacementNamed(login),
          loading: () => debugPrint("loading"),
          data: (profile) {
            debugPrint("data");
            if (profile.phoneNumber!.isNotEmpty) {
              Navigator.of(context).pushReplacementNamed(navigation);
            } else {
              Navigator.of(context).pushReplacementNamed(login);
            }
          });
    } else {
      Navigator.of(context).pushReplacementNamed(onBoarding);
    }
  }

  @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //       const Duration(seconds: 2),() =>
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => const OnBoarding())));
  // }
  Widget build(BuildContext context, WidgetRef ref) {
    navigateTo(context, ref);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/splash_bg.jfif'
              ),
              filterQuality: FilterQuality.low,
              fit: BoxFit.cover,
              opacity: 0.5,
            )
        ),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Image.asset('assets/images/splash.png',
          // height: 50,
          width: MediaQuery.of(context).size.width * 0.8,
        ),
      ),
    );
  }
}


