// code from: https://github.com/matthew-carroll/flutter_ui_challenge_feature_discovery
// TODO: Use https://github.com/matthew-carroll/fluttery/blob/master/lib/src/layout_overlays.dart
// SHA1: 72:18:A2:EE:3D:24:1B:5F:E4:A0:1A:EF:F8:2B:88:D2:56:6E:B2:F2


class User {
  User({
    required String email,
    required String password,
    required String password2,
    required String phoneNumber,
    required String name,
    required String fcmToken,
    required String photoUrl,
    required String role,
    String? otpCode,
});
}












// Platform  Firebase App Id
// web       1:198673287653:web:689aec533cd2f3fa1c070c
// android   1:198673287653:android:36d9577bce28818d1c070c
// ios       1:198673287653:ios:6c5c35d397f48a3b1c070c




// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:flutter/material.dart';
// import 'package:my_portfolio_web/folders/data/strings_data.dart';
// import 'package:my_portfolio_web/folders/utils/constants.dart';
// import 'package:my_portfolio_web/folders/utils/responsive.dart';
// import 'package:my_portfolio_web/folders/utils/screen_size.dart';
//
// import 'home.dart';
//
// class About extends StatelessWidget {
//   const About({Key? key}) : super(key: key);
//
//   static String routeName = "/about";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: appBar(context),
//       endDrawer: Drawer(
//         backgroundColor: kGrey,
//         child: const customDrawer(),
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage(
//                   bg
//               ),
//             )
//         ),
//         child: Responsive(
//           mobile: const SingleChildScrollView(
//               physics:  ScrollPhysics(),
//               child:  Mobile()),
//           desktop: Padding(
//             padding: EdgeInsets.only(
//                 right: getProportionateScreenWidth(195),
//                 left: getProportionateScreenWidth(195),
//                 top: getProportionateScreenHeight(34),
//                 bottom: getProportionateScreenHeight(20)
//             ),
//             child: SafeArea(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   first(context, getProportionateScreenWidth(440)),
//                   second(context, getProportionateScreenWidth(465)),
//                   third(context, getProportionateScreenWidth(465), 900),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// class Mobile extends StatelessWidget {
//   const Mobile({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final w = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.only(
//           right: 50,
//           left: 50,
//           top: 50,
//           bottom: 50
//       ),
//       child: SafeArea(
//         child: Column(
//           children: [
//             first(context, w * 0.8),
//             const SizedBox(height: 0,),
//             second(context, w * 0.8),
//             const SizedBox(height: 10,),
//             third(context, w * 0.8, getProportionateScreenHeight(900)),
//             // SizedBox(height: 30,),
//             // ThirdRow(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
// Widget first(BuildContext context, double w) {
//   return SizedBox(
//     width: w,
//     height: 900,
//     child: SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children:  [
//           const AutoSizeText(
//             'About',
//             maxLines: 1,
//             style: TextStyle(
//                 fontSize: 50,
//                 color: Colors.blue,
//                 fontFamily: "Museo Sans Rounded",
//                 fontWeight: FontWeight.w700
//             ),
//           ),
//
//           SizedBox(height: getProportionateScreenHeight(30),),
//
//           AutoSizeText(
//             about,
//             style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 27,
//                 fontFamily: "Ubuntu",
//                 fontWeight: FontWeight.w500
//             ),
//           ),
//
//           SizedBox(height: getProportionateScreenHeight(30),),
//           Container(
//             height: w,
//             width: w,
//             decoration: BoxDecoration(
//               image: const DecorationImage(image: AssetImage(
//                   "assets/images/about.jpg"
//               ),
//                   fit: BoxFit.cover
//               ),
//               color: kGrey,
//             ),
//           )],
//       ),
//     ),
//   );
// }
//
//
//
//
// Widget second(BuildContext context, double w) {
//   // double? w;
//   return SizedBox(
//     width: w,
//     height: 900,
//     child: AutoSizeText(
//       about_second_row,
//       maxLines: 38,
//       softWrap: true,
//       textAlign: TextAlign.justify,
//       style: const TextStyle(
//         fontSize: 30,
//         color: Colors.white,
//         fontFamily: "Ubuntu",
//         fontWeight: FontWeight.w500,
//       ),
//     ),
//   );
// }
//
//
//
// Widget third(BuildContext context, double w,double h) {
//   return Container(
//     alignment: Alignment.bottomCenter,
//     height: h,
//     width: w,
//     color: kGrey,
//     child: Padding(
//       padding: EdgeInsets.only(
//         left: getProportionateScreenWidth(30),
//         right: getProportionateScreenWidth(30),
//       ),
//       child: ListView(
//         children: [
//           const SizedBox(height: 40,),
//           Text(
//             "WHY you should Hire Me!",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 color: kWhiteText,
//                 decoration: TextDecoration.underline,
//                 fontSize: 20,
//                 fontFamily: "Museo Sans Rounded"
//             ),
//           ),
//
//           const SizedBox(height: 20,),
//
//           Text(
//             "I have experience in the skills listed below:",
//             style: TextStyle(
//                 fontWeight: FontWeight.w500,
//                 color: kWhiteText,
//                 // decoration: TextDecoration.underline,
//                 fontSize: 20,
//                 fontFamily: "Ubuntu"
//             ),
//           ),
//           BulletList(strings: const[
//             "Dart",
//             "Flutter",
//             "Html & CSS",
//             "Python",
//             "Figma",
//           ],),
//         ],
//       ),
//     ),
//   );
// }
//
//
// class BulletList extends StatelessWidget {
//   final List<String> strings;
//
//   // ignore: prefer_const_constructors_in_immutables
//   BulletList({super.key, required this.strings});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.centerLeft,
//       padding: const EdgeInsets.fromLTRB(16, 15, 16, 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: strings.map((str) {
//           return ListTile(
//             title: Text(
//               str,
//               textAlign: TextAlign.left,
//               softWrap: true,
//               style: TextStyle(
//                   fontSize: 25,
//                   color: kWhiteText,
//                   height: 1.55,
//                   fontFamily: "Ubuntu",
//                   fontWeight: FontWeight.w500
//               ),
//             ),
//             leading:  Text(
//               '\u2022',
//               style: TextStyle(
//                 fontSize: 25,
//                 height: 1.55,
//                 fontFamily: "Museo Sans Rounded",
//                 fontWeight: FontWeight.w700,
//                 color: kWhiteText,
//               ),
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }