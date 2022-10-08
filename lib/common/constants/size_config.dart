import 'package:flutter_screenutil/flutter_screenutil.dart';

//class SizeConfig {
//  SizeConfig([BuildContext context]) {
//     ScreenUtil.instance = ScreenUtil(width: 414, height: 896)..init(context);
//   }
//}

///gets the proportionate height in relation to the screen height
double getProportionateScreenHeight(double inputHeight) {
  double height = inputHeight.h;
  //double screenHeight = SizeConfig.screenHeight;
  return height;
}

double getProportionateScreenWidth(double inputWidth) {
  double width = inputWidth.w;
//  double screenWidth = SizeConfig.screenWidth;
  return width;
}

getFontSize(double inputSize) {
  double fontSize = inputSize.sp;
  return fontSize;
}
