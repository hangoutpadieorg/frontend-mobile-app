// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:padie_mobile/app_main.dart';
// import 'package:padie_mobile/common/widgets/textfields.dart';
// import 'package:padie_mobile/splash_screen/splash_screen.dart';
// import 'package:padie_mobile/src/app_views/auth&onBoarding/auth_pages/login/components/forgot_password/forgot_password.dart';
// import 'package:padie_mobile/src/app_views/auth&onBoarding/auth_pages/sign_up/components/signup_view.dart';
// import 'package:padie_mobile/src/app_views/auth&onBoarding/onBoarding/components/onBoarding_view.dart';
//
//
// void main(){
//
//   Widget createWidget({Widget? child}){
//     return ScreenUtilInit(
//       splitScreenMode: true,
//       builder: (BuildContext context, Widget? child) {
//         return MaterialApp(
//           home: child,
//         );
//       },
//     );
//   }
//
//   testWidgets('Display asset image', (WidgetTester widgetTester) async{
//     await widgetTester.pumpWidget(createWidget(child: SignupView()));
//     // final TextEditingController _name = TextEditingController();
//     // final widget = MyTextField(title: 'Full Name', height: 16, controller: _name);
//     // final u = widgetTester.widget<MyTextField>(find.byType(MyTextField));
//     // await widgetTester.pumpWidget(S)
//     var assets = find.byType(AssetImage, skipOffstage: false);
//     // await widgetTester.pumpWidget(assets);
//     // expect(u.height, 16);
//     expect(assets, findsOneWidget);
//   });
// }