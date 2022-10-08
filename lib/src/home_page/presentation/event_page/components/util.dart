import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../common/constants/colors.dart';

class ScaffoldK extends StatelessWidget {
  const ScaffoldK({Key? key, required this.lists, required this.title}) : super(key: key);
  final Widget lists;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: listPagesAppBar(context, title),
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



PreferredSizeWidget listPagesAppBar(BuildContext context,String title) {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 80,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    // leading: Text('yes'),
    shadowColor: Colors.transparent,
    flexibleSpace: Center(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20,
            right: 20
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                child: Text(
                  'Location',
                  style: TextStyle(
                      fontSize: 16,
                      // fontFamily: "MISTRAL",
                      // fontWeight: FontWeight.w500,
                      color: kOrange
                  ),
                ),
              ),
            ),

            IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.magnifyingGlass))
          ],
        ),
      ),
    ),
  );
}
