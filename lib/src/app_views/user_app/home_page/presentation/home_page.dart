import 'package:flutter/material.dart';

import 'components/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = "/home_page";

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

