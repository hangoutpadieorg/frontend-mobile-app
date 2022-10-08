import 'dart:async';

import 'package:flutter/material.dart';
import 'package:padie_mobile/src/onBoarding/onBoarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  pageToReturn(){
    return const OnBoarding();
  }
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),() =>
        Navigator.push(context, MaterialPageRoute(builder: (context) => const OnBoarding())));
  }

  Widget build(BuildContext context) {
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
