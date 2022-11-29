import 'package:flutter/material.dart';

import 'component/presentation/booking_view.dart';

class BookPage extends StatelessWidget {
  const BookPage({Key? key}) : super(key: key);
  static String routeName = "/book_page";

  @override
  Widget build(BuildContext context) {
    return const MyBooking();
  }
}
