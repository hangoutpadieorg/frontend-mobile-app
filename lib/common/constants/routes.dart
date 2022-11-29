import 'package:flutter/material.dart';
import 'package:padie_mobile/common/constants/strings.dart';
import 'package:padie_mobile/src/app_views/auth&onBoarding/onBoarding/onBoarding_screen.dart';
import 'package:padie_mobile/src/app_views/user_app/booking/component/presentation/booking_page.dart';
import 'package:padie_mobile/src/app_views/user_app/hangout_menu/drinks/presentation/drinks_page.dart';
import 'package:padie_mobile/src/app_views/user_app/hangout_menu/meals/presentation/meals_page.dart';
import 'package:padie_mobile/src/app_views/user_app/hangout_menu/menu/presentation/menu.dart';
import 'package:padie_mobile/src/app_views/user_app/hangout_menu/specials/presentation/specials_page.dart';
import 'package:padie_mobile/src/app_views/user_app/home_page/presentation/category_page/presentation/artGallery_list_page.dart';
import 'package:padie_mobile/src/app_views/user_app/home_page/presentation/category_page/presentation/beach_list_page.dart';
import 'package:padie_mobile/src/app_views/user_app/home_page/presentation/category_page/presentation/cafe_list_page.dart';
import 'package:padie_mobile/src/app_views/user_app/home_page/presentation/category_page/presentation/lounge_list_page.dart';
import 'package:padie_mobile/src/app_views/user_app/home_page/presentation/category_page/presentation/restaurant_list_page.dart';
import 'package:padie_mobile/src/app_views/user_app/home_page/presentation/home_page.dart';
import 'package:padie_mobile/src/app_views/user_app/nav_bar.dart';
import 'package:padie_mobile/src/app_views/user_app/profile/components/presentation/change_password.dart';
import 'package:padie_mobile/src/app_views/user_app/profile/components/presentation/edit_profile.dart';
import 'package:padie_mobile/src/app_views/user_app/profile/profile_page.dart';
// import 'package:padie_mobile/src/home_page/presentation/category_page/presentation/artGallery_list_page.dart';
// import 'package:padie_mobile/src/home_page/presentation/category_page/presentation/bar_list_page.dart';
// import 'package:padie_mobile/src/home_page/presentation/category_page/presentation/beach_list_page.dart';
// import 'package:padie_mobile/src/home_page/presentation/category_page/presentation/cafe_list_page.dart';
// import 'package:padie_mobile/src/home_page/presentation/category_page/presentation/lounge_list_page.dart';
// import 'package:padie_mobile/src/home_page/presentation/category_page/presentation/restaurant_list_page.dart';
// import 'package:padie_mobile/src/profile/components/presentation/change_password.dart';
// import 'package:padie_mobile/src/profile/components/presentation/edit_profile.dart';
// import 'package:padie_mobile/src/profile/profile_page.dart';
import '../../splash_screen/splash_screen.dart';
import '../../src/app_views/auth&onBoarding/auth_pages/login/components/forgot_password/forgot_password.dart';
import '../../src/app_views/auth&onBoarding/auth_pages/login/login.dart';
import '../../src/app_views/auth&onBoarding/auth_pages/sign_up/sign_up.dart';
import '../../src/app_views/user_app/booking/component/presentation/booking_view.dart';
import '../../src/app_views/user_app/home_page/presentation/category_page/presentation/bar_list_page.dart';



class MyRoutes {
  static Route<dynamic> generateRoutes(RouteSettings settings){
    return MaterialPageRoute(
      settings: settings,
        builder: (_) {
          switch (settings.name) {
            case initialPage:
              return const SplashScreen();
            case onBoarding:
              return const OnBoarding();
            case forgotPassword:
              return ForgotPassword();
            case login:
              return const Login();
            case signUp:
              return const SignUp();
            case navigation:
              return Nav();
            case homePage:
              return const HomePage();
            case profilePage:
              return const ProfilePage();
            case editProfile:
              return const EditProfile();
            case changePassword:
              return ChangePassword();
            case drinkList:
              return const DrinkList();
            case mealList:
              return const MealList();
            case specialList:
              return const SpecialList();
            case hangoutMenu:
              return const HangoutMenu();
            case artGallery:
              return const ArtGallery();
            case beaches:
              return const Beaches();
            case bars:
              return const Bars();
            case lounges:
              return  const Lounges();
            case cafes:
              return const Cafes();
            case restaurants:
              return const Restaurants();
            case bookingPage:
              return const BookingPage(eventId: '', eventName: '',);
            case myBooking:
              return const MyBooking();
            default:
              return const SplashScreen();
          }
        });
    }
    // return MaterialPageRoute(builder: (context) => const Scaffold(
    //   body: Text('No route defined'),
    // ));
  }




// final Map<String, WidgetBuilder> routes = {
//   SplashScreen.routeName: (context) => const SplashScreen(),
//   OnBoarding.routeName: (context) => const OnBoarding(),
//   ForgotPassword.routeName: (context) => ForgotPassword(),
//   Login.routeName: (context) => const Login(),
//   SignUp.routeName: (context) => const SignUp(),
//   HomePage.routeName: (context) => const HomePage(),
//   ProfilePage.routeName: (context) => const ProfilePage(),
//   EditProfile.routeName: (context) => const EditProfile(),
//   ChangePassword.routeName: (context) => ChangePassword(),
//   MealList.routeName: (context) => const MealList(),
//   DrinkList.routeName: (context) => const DrinkList(),
//   SpecialList.routeName: (context) => const SpecialList(),
//   HangoutMenu.routeName: (context) => const HangoutMenu(),
//   ArtGallery.routeName: (context) => const ArtGallery(),
//   Bars.routeName: (context) => const Bars(),
//   BookingPage.routeName: (context) => const BookingPage(),
//   Beaches.routeName: (context) => const Beaches(),
//   Cafes.routeName: (context) => const Cafes(),
//   Lounges.routeName: (context) => const Lounges(),
//   Nav.routeName: (context) =>  Nav(),
//   Restaurants.routeName: (context) => const Restaurants(),
//   // Locate.routeName: (context) => const Locate(),
//   // BoardRoom.routeName: (context) => const BoardRoom(address: address, openTime: openTime, entryFee: entryFee, details: details, heading: heading),
//   // UploadCAC.routeName: (context) => const UploadCAC(),
//   // AboutUsPage.routeName : (context) => const AboutUsPage(),
//   // ReUploadDocuments.routeName : (context) => const ReUploadDocuments(),
//   // AccountVerificationPendingScreen.routeName : (context) => const AccountVerificationPendingScreen(),
// };
