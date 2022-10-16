import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padie_mobile/common/constants/regex.dart';
import 'package:padie_mobile/common/constants/size_config.dart';
import 'package:padie_mobile/src/auth_pages/login/login.dart';
import 'package:padie_mobile/src/nav_bar.dart';

import '../../../../common/constants/colors.dart';
import '../../../../common/widgets/buttons.dart';
import '../../../../common/widgets/textfields.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}
final TextEditingController _name = TextEditingController();
final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();


class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
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
              child: Form(
                key: _formKey,
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

                    MyTextField(title: 'Name', height: 16, controller: _name, validator: (val){
                      if(val!.isEmpty || _name.text.length < 2){
                        return 'Please enter a valid name';
                      }
                      return null;
                    },inputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+|\s"))
                    ],),
                    const SizedBox(height: 24,),
                    MyTextField(title: 'Email Address', height: 16, controller: _email, validator: (val){
                      if(val!.isEmpty || !_email.text.contains('@')){/////////////////////
                        return 'Please enter a valid email';
                      }
                      return null;
                    }),
                    const SizedBox(height: 24,),
                    MyTextField(title: 'Password', height: 16, controller: _password, validator: (val){
                      if(val!.isEmpty || _password.text.length < 6){
                        return 'Password must not be less than 6 digits';
                      }
                      return null;
                    },),
                    const SizedBox(height: 50,),
                    MyButton(withLogo: false, label: 'SIGN UP', isSmall: false, isOrange: true, onTap: (){
                      if(_formKey.currentState!.validate()) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Login()));
                      }
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
                    MyButton(label: 'SIGN UP WITH APPLE', onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Nav()));
                    }, isSmall: false, isOrange: false,withLogo: true, icon: FontAwesomeIcons.apple,),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      const Text('Already an existing User?',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white54,
                        ),
                      ),
                      const SizedBox(width: 3,),
                      TextButton(onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Login()));
                      }, child: const Text(
                        'LOGIN HERE',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      )),
                    ],),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
