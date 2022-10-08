import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padie_mobile/common/constants/size_config.dart';
import 'package:padie_mobile/src/nav_bar.dart';

import '../../../../common/constants/colors.dart';
import '../../../../common/widgets/buttons.dart';
import '../../../../common/widgets/textfields.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}
final TextEditingController name = TextEditingController();
final TextEditingController phone = TextEditingController();
final TextEditingController password = TextEditingController();


class _LoginViewState extends State<LoginView> {
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
                  left: getProportionateScreenWidth(31),
                bottom: getProportionateScreenHeight(50)
              ),
              child: Column(
                children: [
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: kGrey,
                      fontSize: 25,
                    ),
                  ),

                  const SizedBox(height: 40,),

                  MyTextField(title: 'Email Address', height: 16, controller: name),
                  const SizedBox(height: 18,),
                  MyTextField(title: 'Password', height: 16, controller: password),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(onPressed: (){},
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: kGrey,
                              fontSize: 16,
                            ),
                          ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 47,),
                  MyButton(label: 'LOGIN', isSmall: false, isOrange: true,withLogo: false,                   onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Navigation()));
                    },
                  ),
                  const SizedBox(height: 30,),
                  const Text(
                    'Or',
                    style: TextStyle(
                      fontSize: 18,
                      color: kGrey,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  MyButton(label: 'LOGIN WITH GOOGLE', onTap: (){}, isSmall: false, isOrange: false,withLogo: true, icon: FontAwesomeIcons.google,),
                  const SizedBox(height: 22,),
                  MyButton(label: 'LOGIN WITH APPLE', onTap: (){}, isSmall: false, isOrange: false,withLogo: true, icon: FontAwesomeIcons.apple,),
                  // const SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
