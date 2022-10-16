import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../common/constants/colors.dart';
import '../../../../common/widgets/buttons.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.black,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(50),
                topStart: Radius.circular(50),
              ),
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/splash_bg.jfif'
                ),
                filterQuality: FilterQuality.low,
                fit: BoxFit.cover,
                opacity: 0.5,
              )
          ),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              Image.asset('assets/images/splash.png',
                // height: 50,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const Spacer(),
              const Text(
                "Email: info@hangoutpadie.com",
                style: TextStyle(
                  color: kOrange,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20,),
              const Text(
                "Hotline: +234xxxxxxxxxx",
                style: TextStyle(
                  color: kOrange,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Follow Us on",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 10,),
                  GestureDetector(
                    onTap: (){},
                      child: const FaIcon(FontAwesomeIcons.instagram,
                        color: Colors.white,
                      )),
                  const SizedBox(width: 5,),
                  GestureDetector(
                      onTap: (){},
                      child: const FaIcon(FontAwesomeIcons.facebook,color: Colors.white,)),
                  const SizedBox(width: 5,),
                  GestureDetector(
                      onTap: (){},
                      child: const FaIcon(FontAwesomeIcons.twitter,color: Colors.white,)),
                ],
              ),
              const SizedBox(height: 8,),
              const Text(
                '@HangoutPadie',
                style: TextStyle(
                  color: kOrange,
                  fontSize: 18
                ),
              ),
              const Spacer(),

              MyButton(withLogo: false,label: 'CHAT NOW', onTap: (){}, isSmall: true, isOrange: true),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
