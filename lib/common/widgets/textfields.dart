import 'package:flutter/material.dart';

import '../constants/colors.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, required this.title, required this.height, required this.controller, }) : super(key: key);
  final String title;
  final double height;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
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
    );
  }
}
