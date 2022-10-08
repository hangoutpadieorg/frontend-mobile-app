import 'package:flutter/material.dart';

import '../../../common/widgets/appbar.dart';
import '../../../common/widgets/buttons.dart';


class MyBooking extends StatelessWidget {
  const MyBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'MY BOOKING',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700
              ),
            ),

            const SizedBox(height: 15,),

            const Text(
              'You have not booked any reservation',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Spacer(),
            MyButton(label: 'BOOK NOW', withLogo: false, onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Book())
              );}, isSmall: true, isOrange: true),
            const Spacer(),

          ],
        ),
      ),
    );
  }
}


class Book extends StatelessWidget {
  const Book({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'MY BOOKING',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500
              ),
            ),

            const SizedBox(height: 15,),

            const Text(
              'You have not booked any reservation',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Spacer(),
            MyButton(withLogo: false,label: 'BOOK NOW', onTap: (){}, isSmall: true, isOrange: true),
            const Spacer(),

          ],
        ),
      ),
    );
  }
}
