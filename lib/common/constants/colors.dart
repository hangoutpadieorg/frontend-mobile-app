// import 'dart:ui';
import 'package:flutter/material.dart';

import 'size_config.dart';

const kOrange =  Color(0xFFFA4219);
const kGrey2 =  Color(0xFFEFEDEA);
const kGrey =  Color(0xFFFFFDF5);
const Color kPrimaryColor = Color(0xff0F1E42);



void showSnackBar(
    BuildContext context, {
      required String text,
    }) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: 2,
    backgroundColor: Colors.white10,
    duration: const Duration(seconds: 3),
    margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30.0),
        vertical: getProportionateScreenWidth(20.0)),
    behavior: SnackBarBehavior.floating,
    content: Text(
      text,
      style: TextStyle(
          color: Colors.white,
          fontSize: getFontSize(16),
          fontWeight: FontWeight.w500),
    ),
  ));
}
