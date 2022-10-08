import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padie_mobile/common/widgets/buttons.dart';

import '../util.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      drawer: const DrawerK(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 30,
        ),
        child: Column(
          children: [
            const Text(
              'My Profile',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 30,),

            CircleAvatar(
              radius: 100,
              child: Image.asset('assets/images/profile.png'),
            ),
            const SizedBox(height: 25,),
             const Align(
               alignment: Alignment.topLeft,
               child: Text(
                'Paul Osho',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                   ),
             ),
                 const SizedBox(),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'paulosho2015@gmail.com',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
                 const SizedBox(),
            const Align(
                   alignment: Alignment.topLeft,
                   child: Text(
                     '+234 9025 2623 15',
                     style: TextStyle(fontSize: 18, color: Colors.black,
                     ),
                   ),
                 ),
            const SizedBox(),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                  'Lagos, Nigeria',
                  style: TextStyle(
               fontSize: 18,
               color: Colors.black,
                  ),
                ),
            ),
            const SizedBox(height: 50,),
            MyButton(withLogo: false,label: 'BOOK NOW', onTap: (){}, isSmall: true, isOrange: true),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
