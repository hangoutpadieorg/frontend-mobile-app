import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:padie_mobile/common/constants/size_config.dart';

import '../../../../../common/constants/colors.dart';
import '../../../../../common/widgets/buttons.dart';
import '../../../../../common/widgets/textfields.dart';



class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}
final TextEditingController _email = TextEditingController();



class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: kGrey,
                        fontSize: 25,
                      ),
                    ),

                    const SizedBox(height: 40,),

                    MyTextField(title: 'Email Address', height: 16, controller: _email, validator: (val){
                      if (val!.isEmpty || !_email.text.contains('@')) {
                        return 'Please enter valid email';
                      }
                    },),

                    const SizedBox(height: 67,),
                    MyButton(label: 'RESET PASSWORD', isSmall: false, isOrange: true,withLogo: false,
                      onTap: (){},
                    ),
                    const SizedBox(height: 30,),
                    const Text(
                      'Or',
                      style: TextStyle(
                        fontSize: 18,
                        color: kGrey,
                      ),
                    ),

                    const Spacer(),
                    MyButton(label: 'Back', onTap: (){
                      Navigator.pop(context);
                    }, isSmall: false, isOrange: false,withLogo: true, icon: FontAwesomeIcons.apple,),
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
