import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:padie_mobile/common/widgets/buttons.dart';

import '../../../../../../common/constants/utils.dart';



class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);
  // static String routeName = "/change_password";

  final TextEditingController _new = TextEditingController();

  final TextEditingController _repeat = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      // drawer: const DrawerK(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          left: 30,
          right: 30
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Change Password',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700
                ),
              ),
              // const Spacer(),
              const SizedBox(height: 55,),
              InputField(title: 'New Password', height: 16, controller: _new, validator: (value){
                if (value!.isEmpty) {
                  return "Empty Field.";
                } else if (!atleastOneLowerCase.hasMatch(value)) {
                  return "Must contain atleast 1 lowercase letter";
                } else if (!atLeastOneUpperCase.hasMatch(value)) {
                  return "Must contain atleast 1 uppercase letter";
                } else if (!atleastOneDigit.hasMatch(value)) {
                  return "Must contain atleast 1 digit";
                } else if (!atleastOneSpecial.hasMatch(value)) {
                  return "Must contain atleast 1 special character";
                } else if (value.length < 6) {
                  return "Password too short!";
                }
                return null;
              }),
              const SizedBox(height: 40,),
              InputField(title: 'Repeat Password', height: 16, controller: _repeat, validator: (val){
                if (val!.isEmpty) return 'Empty';
                if (val != _new.text) {
                  return 'Passwords do not match';
                }
                return null;
                return null;}),
              const SizedBox(height: 70,),


              BlackButton(label: 'UPDATE PASSWORD', onTap: (){
                if(_formKey.currentState!.validate()){
                  print('Validated');
                }
              }, isSmall: false,),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({Key? key, required this.title, required this.height, required this.controller, this.validator, this.inputFormatter, }) : super(key: key);
  final String title;
  final double height;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 106,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: height,),
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: controller,
                validator: validator,
                inputFormatters: inputFormatter,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

