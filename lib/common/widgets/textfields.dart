import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, required this.title, required this.height, required this.controller, this.validator, this.inputFormatter, }) : super(key: key);
  final String title;
  final double height;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  color: kGrey,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: height,),
            Container(
              // height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                validator: validator,
                inputFormatters: inputFormatter,
                controller: controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      width: 3, color: Color.fromRGBO(0, 0, 0, 0.5),
                    )
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
