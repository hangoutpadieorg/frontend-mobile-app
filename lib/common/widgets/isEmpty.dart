import 'package:flutter/material.dart';
import 'buttons.dart';

class IsEmpty extends StatelessWidget {
  const IsEmpty({Key? key, this.err}) : super(key: key);
  final String? err;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Something went wrong',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 17,
            fontWeight: FontWeight.w700
          ),
        ),
        const SizedBox(height: 16,),
        Text(
          err.toString() ?? '',
          textAlign: TextAlign.justify,
          style: const TextStyle(
              color: Colors.grey,
              fontSize: 17,
              fontWeight: FontWeight.w700
          ),
        ),
        const SizedBox(height: 16,),

        MyButton(label: 'Retry', onTap: () { }, isSmall: false, withLogo: false, isOrange: true, icon: Icons.refresh),
      ],
    );
  }
}
