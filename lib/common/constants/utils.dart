import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:padie_mobile/common/constants/colors.dart';
import 'package:padie_mobile/common/constants/size_config.dart';
import '../../app_main.dart';


enum USERTYPE {restUser, googleUser, appleUser}
const String googleApiKey = "API_KEY";
void hasInternetConnection(){
  Connectivity().onConnectivityChanged.listen((event) {
    if (event == ConnectivityResult.none)
    {
      showDialogFlash();
    }
  });
}

Center kProgressIndicator = const Center(
  child: Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: CircularProgressIndicator(
      color: kOrange,
    ),
  ),
);

InputDecoration kInputDecoration = InputDecoration(
  isDense: true,
  //isCollapsed: true,
  labelStyle: TextStyle(
    fontSize: getFontSize(16),
    color: kGrey,
    fontWeight: FontWeight.w400,
  ),
  errorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xffF1A01F), width: 1.0),
  ),
  errorStyle: const TextStyle(color: Color(0xffF1A01F)),
  hintText: "Email Address",
  hintStyle: TextStyle(
    fontSize: getFontSize(16),
    color: Colors.black,
    fontWeight: FontWeight.w400,
  ),
  focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: kGrey, width: 2.0),
  ),
);


const support_mail = 'mailto:info@hangoutpadie.com?subject=News&body=New%20plugin';

final RegExp emailValidatorRegExp =
RegExp(r"^((.*?)@[a-zA-Z0-9]+\.[a-zA-Z]+)"); //[a-zA-Z0-9.]+
final RegExp urlPattern = RegExp(
    r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:â€Œâ€‹,.;]*)?)');
final RegExp atleastOneLowerCase = RegExp(r"^(?=.*[a-z])");
final RegExp atLeastOneUpperCase = RegExp(r"^(?=.*[A-Z])");
final RegExp atleastOneDigit = RegExp(r"^(?=.*?[0-9])");
final RegExp atleastOneSpecial = RegExp(r"^(?=.*?[!@#\$&*~])");


void showDialogFlash() {
  mainNavigatorKey.currentContext!.showFlashDialog(
    constraints: const BoxConstraints(maxWidth: 300),
      title: const Text('Internet Connection'),
      content: const Text('You are currently offline, turn on your mobile data or wifi to connect',
        style: TextStyle(fontSize: 14)),
    positiveActionBuilder: (context, controller, _,) {
      return TextButton(
        onPressed: ()=> controller.dismiss(), child: const Text('OK'));
    }
  );
}

const noConnection = '';
const somethingWentWrong = '';