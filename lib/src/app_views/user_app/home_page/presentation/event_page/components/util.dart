import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:padie_mobile/common/constants/colors.dart';




class ScaffoldK extends StatelessWidget {
  const ScaffoldK({Key? key, required this.lists, required this.title,  this.location}) : super(key: key);
  final Widget lists;
  final String title;
  final String? location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                child: Text(
                  location,
                  style: const TextStyle(
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
