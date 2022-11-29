import 'package:flutter/material.dart';

import 'components/signup_view.dart';


class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  static String routeName = "/sign_up";

  @override
  Widget build(BuildContext context) {
    return SignupView();
  }
}
