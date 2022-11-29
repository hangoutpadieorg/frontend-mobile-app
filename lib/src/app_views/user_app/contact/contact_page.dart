import 'package:flutter/material.dart';

import 'components/presentation/contact_view.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);
  static String routeName = "/contact_page";

  @override
  Widget build(BuildContext context) {
    return const ContactView();
  }
}
