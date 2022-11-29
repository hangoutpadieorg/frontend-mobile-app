import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:padie_mobile/common/constants/size_config.dart';
import 'package:padie_mobile/common/constants/utils.dart';
import 'package:padie_mobile/common/widgets/buttons.dart';
import 'package:padie_mobile/common/widgets/textfields.dart';
import 'package:padie_mobile/src/app_views/auth&onBoarding/auth_pages/sign_up/components/otp_page.dart';

import '../../../../../../../common/constants/colors.dart';
import '../../../../../../../common/constants/exceptions.dart';
import '../../../../../../../common/constants/general_provider.dart';
import '../../../../../../controllers/auth_controller.dart';
import 'check_your_mail.dart';




class ForgotPassword extends ConsumerStatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  ConsumerState<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  // static String routeName = "/forgot_password";
  final _formKey = GlobalKey<FormState>();
  bool progress = false;

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
        child: Padding(
          padding: EdgeInsets.only(
              top: getProportionateScreenHeight(80),
              right: getProportionateScreenWidth(25),
              left: getProportionateScreenWidth(31),
              bottom: getProportionateScreenHeight(50)
          ),
          child: Center(
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
                    }else {
                      return null;
                    }
                  },),

                  const SizedBox(height: 67,),
                  if(progress)
                    kProgressIndicator, //show loading if reset button is pressed
                  MyButton(label: 'RESET PASSWORD', isSmall: false, isOrange: true,withLogo: false,
                    // onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => CheckYourMail(otp: '1234',)));
                    // },
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        // return;
                        ref.read(loadingProvider.state)
                            .state = true;
                        setState(() {
                          progress = true;
                        });
                        Map<String, dynamic>? response = await ref
                            .read(authControllerProvider.notifier)
                            .forgetPassword(_email.text)
                            .catchError((e) {
                          ref.read(loadingProvider.state)
                              .state = false;
                          setState(() {
                            progress = false;
                          });
                          // return response;
                          if (e is CustomException) {
                            showSnackBar(context, text: e.message!);
                          } else {
                            setState(() {
                              progress = false;
                            });
                            ref.read(loadingProvider.state)
                                .state = false;
                            showSnackBar(context, text: "Something is wrong!");
                          }
                        });
                        if(response != null) {
                          // Navigator.pop(context);
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => CheckYourMail(
                              otp: response["data"]["OTP"])), (route) => false);
                        }
                      }
                    }
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
                  }, isSmall: false, isOrange: false,withLogo: false, icon: FontAwesomeIcons.apple,),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
final TextEditingController _email = TextEditingController();
