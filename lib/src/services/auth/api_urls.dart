// TODO Implement this library.

class ApiUrl {
  // static const String localBaseUrl = "http://localhost:5000/api/";
  //     "http://35.153.170.66/api/v1"; /////"http://54.215.137.63/api/v1"

  static const int receiveTimeOut = 15000;
  static const int connectionTimeOut = 15000;
  // static const String token = "https://hangoutpadie.onrender.com/api";
  static const String baseURL = "https://hangoutpadie.onrender.com/api";
  static const String login = "$baseURL/signIn";
  static const String register = "$baseURL/signUp";
  static const String logout = "$baseURL/signOut";
  static const String otp = "$baseURL/activateAccount";
  static const String resendOtp = "$baseURL/activateAccount"; /// not working for now
  static const String refreshToken = "${logout}refresh";
  static const String forgetPassword = "$baseURL/forgotPassword";
  static const String resetPassword = "$baseURL/resetPassword";
  static const String changePassword = "$baseURL/changePassword/";
  static const String avatarUpload = "$baseURL/auth/avatar/";
  static const String activateAccount = "$baseURL/activateAccount";
  static const String profile = "$baseURL/accounts/";
  static const String updatePersonalProfile = "${profile}profile";
  static const String uploadDocuments = "$baseURL/accounts/documents";
  static const String categoryList = "$baseURL/";
  static const String cafeList = "$baseURL/";
  static const String loungeList = "$baseURL/";
  static const String restaurantList = "$baseURL/";
  static const String beachesList = "$baseURL/";
  static const String clubsList = "$baseURL/";
  static const String artGalleriesList = "$baseURL/";
  static const String bookingList = "$baseURL/";
}
