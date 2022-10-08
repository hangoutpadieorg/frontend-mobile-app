import 'package:flutter/material.dart';
import 'package:padie_mobile/common/widgets/buttons.dart';
import 'package:padie_mobile/common/widgets/textfields.dart';


class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _new = TextEditingController();
  final TextEditingController _repeat = TextEditingController();
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
        ),
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
            PasswordField(title: 'New Password', height: 16, controller: _new),
            const SizedBox(height: 40,),
            PasswordField(title: 'Repeat Password', height: 16, controller: _repeat),
            const SizedBox(height: 70,),

            BlackButton(label: 'UPDATE PASSWORD', onTap: (){}, isSmall: false,),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}



class PasswordField extends StatelessWidget {
  const PasswordField({Key? key, required this.title, required this.height, required this.controller, }) : super(key: key);
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
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: height,),
          Container(
            margin: const EdgeInsets.only(right: 30),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                  // enabledBorder: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(10),
                  //     borderSide: const BorderSide(
                  //       width: 3, color: Colors.black,
                  //     )
                  // )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

