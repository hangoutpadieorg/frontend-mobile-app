import 'package:flutter/material.dart';

import '../../../common/constants/colors.dart';


class ScaffoldM extends StatelessWidget {
  const ScaffoldM({Key? key, required this.lists, required this.title,  this.location}) : super(key: key);
  final Widget lists;
  final String title;
  final String? location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: null,
      appBar: listPagesAppBar(context, title, location!),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              right: 32,
              left: 40
            // top: 40,
          ),
          child: lists,
        ),
      ),
    );
  }
}



PreferredSizeWidget listPagesAppBar(BuildContext context,String title, String location) {
  return AppBar(
    automaticallyImplyLeading: true,
    toolbarHeight: 80,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.black),
    shadowColor: Colors.transparent,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    // leading: Text('yes'),
    flexibleSpace: const Center(
      child: Padding(
        padding: EdgeInsets.only(
            left: 20,
            right: 20
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text('',style: TextStyle(
            color: kOrange,
            fontSize: 18,
          ),),
        ),
      ),
    ),
  );
}
