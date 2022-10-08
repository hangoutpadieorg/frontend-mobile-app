import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padie_mobile/common/constants/size_config.dart';
import 'package:padie_mobile/src/auth_pages/login/login.dart';

import '../../../../common/constants/colors.dart';
import '../../../../common/widgets/buttons.dart';
import '../../../../common/widgets/textfields.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}
final TextEditingController name = TextEditingController();
final TextEditingController phone = TextEditingController();
final TextEditingController password = TextEditingController();


class _SignupViewState extends State<SignupView> {
  @override
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
        child: Center(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenHeight(80),
                right: getProportionateScreenWidth(25),
                left: getProportionateScreenWidth(31)
              ),
              child: Column(
                children: [
                  const Text(
                    'Welcome to hangout padie',
                    style: TextStyle(
                      color: kGrey,
                      fontSize: 25,
                    ),
                  ),

                  const SizedBox(height: 50,),

                  MyTextField(title: 'Name', height: 16, controller: name),
                  const SizedBox(height: 24,),
                  MyTextField(title: 'Email Address', height: 16, controller: phone),
                  const SizedBox(height: 24,),
                  MyTextField(title: 'Password', height: 16, controller: password),
                  const SizedBox(height: 50,),
                  MyButton(withLogo: false, label: 'SIGN UP', isSmall: false, isOrange: true, onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
                  },),
                  const SizedBox(height: 20,),
                  const Text(
                    'Or',
                    style: TextStyle(
                      fontSize: 18,
                      color: kGrey,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  MyButton(label: 'SIGN UP WITH GOOGLE', onTap: (){}, isSmall: false, isOrange: false, withLogo: true, icon: FontAwesomeIcons.google,),
                  const SizedBox(height: 22,),
                  MyButton(label: 'SIGN UP WITH APPLE', onTap: (){}, isSmall: false, isOrange: false,withLogo: true, icon: FontAwesomeIcons.apple,),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
