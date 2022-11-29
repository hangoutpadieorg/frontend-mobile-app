import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:padie_mobile/common/constants/utils.dart';
import 'package:padie_mobile/common/widgets/buttons.dart';
// import 'package:url_launcher/url_launcher.dart';

import '../../../../../../../common/constants/colors.dart';
import '../../../../../../../common/constants/size_config.dart';
import 'change_password.dart';

class CheckYourMail extends StatelessWidget {
  static String routeName = "/check_mail";
  CheckYourMail({Key? key, this.otp}) : super(key: key);
  final String? otp;

  final TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: double.infinity,
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(36.0)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/messages.png"),
                  // Text(
                  //   "Check your mail",
                  //   style: TextStyle(
                  //       color: kPrimaryColor,
                  //       fontSize: getFontSize(24),
                  //       fontWeight: FontWeight.w600,
                  //       fontFamily: 'Ubuntu'),
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: getProportionateScreenHeight(20.0)),
                    child: Text(
                      "We have sent a recovery code to your mail",
                      style: TextStyle(
                          fontSize: getFontSize(20),
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                        top: getProportionateScreenHeight(15.0),
                        bottom: getProportionateScreenHeight(20.0)),
                    child: Text(
                      "Enter recovery code:",
                      style: TextStyle(
                        fontSize: getFontSize(18),
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70.0),
                    child: TextFormField(
                      inputFormatters: [
                        UpperCaseTextFormatter(),
                      ],
                      controller: otpController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        isDense: true,
                        //isCollapsed: true,
                        labelStyle: TextStyle(
                          fontSize: getFontSize(16),
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        errorBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF1A01F), width: 1.0),
                        ),
                        errorStyle: const TextStyle(color: Color(0xffF1A01F)),
                        hintText: "Recovery code",
                        hintStyle: TextStyle(
                          fontSize: getFontSize(16),
                          color: Colors.white,
                          // color: kSecondaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: getProportionateScreenHeight(30.0),
                  ),
                  MyButton(
                      withLogo: false,
                      // label: 'SIGN UP',
                      isSmall: false,
                      isOrange: false,
                      label: "Submit",
                      onTap: () {
                        if (otp == otpController.text.trim()) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ChangePassword(otp: otp),
                            ),
                          );
                        } else {
                          showSnackBar(context,
                              text: "Invalid Recovery Code");
                        }
                      }),
                  // Spacer(),
                  // SizedBox(
                  //   height: getProportionateScreenHeight(10.0),
                  // ),
                  // Column(
                  //   children: [
                  //     const Text(
                  //         "if problem persists, contact support for help",
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //     InkWell(
                  //         onTap: () async {
                  //           final url = Uri.encodeFull(
                  //               support_mail);
                  //           if (await canLaunch(url)) {
                  //             await launch(url);
                  //           } else {
                  //             throw 'Cannot not launch $url';
                  //           }
                  //         },
                  //         child: const Text("support@hangoutpadie.com",
                  //             style: TextStyle(color: Colors.blue)))
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

//  Positioned(
//                         right: getProportionateScreenWidth(32),
//                         top: 10.0,
//                         child: Image.asset(
//                           "assets/images/smile_face.png",
//                         ),
//                       ),