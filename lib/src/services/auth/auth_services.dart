
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:padie_mobile/src/services/auth/shared_prefernces.dart';
import '../../../../common/constants/exceptions.dart';
import 'api_client.dart';
import 'api_urls.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  Client client = Client();
  return AuthService(client.init());
});

class AuthService {
  // AuthService(Dio init);

  final Dio? _client;
  // final DioClient _C;
  final Preferences? _prefs;

  static const kHeaders = {
    // "accept": "application/json",
    "Content-Type": "application/json; charset=UTF-8" //charset=utf-8
  };
  // final GoogleSignIn
  final GoogleSignIn? _google;
  AuthService([this._client, this._prefs, this._google]);
  Future register(
      {required String email,
        required String name,
        required String role,
        required String password,
        required String password2,
        // required String phoneNumber,
        // required String fcmToken,
        // required String photoUrl,
        // String? otpCode,
        }) async {
    Map<String, dynamic> registrationData = {
      "name": name,
      "email": email,
      "role": role,
      "password": password,
      "confirmPassword": password2,
      // "phone_number": phoneNumber,
      // "fcm_token": fcmToken,
      // "profileImage": photoUrl,
      // "otpCode": otpCode, The problem might have been otp returning null
    };
    try {
      var data = json.encode(registrationData);
      debugPrint("The encoded data: $data");
      final response = await _client!.post(
        ApiUrl.register,
        // queryParameters: registrationData,
        // 'https://reqres.in/api/users',
        options: Options(headers: {
        //   'accept': 'application/json',
          'Content-Type': 'application/json'
        }),
        data: data,
      );
      if(response.statusCode == 201 || response.statusCode == 200)
        {
          return response.data["message"];
        }
      else{
        debugPrint('response is false');
        return null;
      }
    } on DioError catch (dioError) {
      // throw '$dioError';
      throw CustomException.fromDioError(dioError);
    }
  }


  Future<int?> registerWithOauth({
    required String userId,
    required String email,
    // required String password,
    // required String phoneNumber,
    required String fullName,
    required String photoUrl,
    // required String fcmToken,
    required String role,
}) async{
    // _google?.signIn();
    // final _user = _google?.currentUser;
    final Map<String, dynamic> registrationData = {
      "userId": userId,
      "role": role,
      "email": email,
      // "password": password,
      // "phone_number": phoneNumber,
      "profileImage": photoUrl,
      "full_name": fullName,
      // "fcm_token": fcmToken,
      // "email": _user?.email,
      // "userId": _user?.id,
      // "phone_number": 'Edit profile to add phone number',
      // "full_name": _user?.displayName,
      // "fcm_token": fcmToken,
    };
    try {
      final response = await _client!.post(
        ApiUrl.register,
        data: json.encode(registrationData),
        options: Options(headers: kHeaders),
      );
      debugPrint(response.data.toString());
      return response.data["status"];
    } catch (e){
     throw '$e';
    }
  }

  Future<Either<String?, Map<String, dynamic>?>> loginWithOauth(String userId, String email) async {
    final Map<String, dynamic> loginData = {
      "id": userId,
      "email": email
    };
    _google?.signIn();
    try {
      final response = await _client!.post(
        ApiUrl.login,
        data: loginData,
        options: Options(headers: kHeaders),
      );
      return Right(response.data);
    } on DioError catch (dioError) {
      return Left(dioError.response!.data["detail"]);
    }
    ////then refresh token

  }


  Future logOutOauth() async => await _google?.disconnect();


  Future<void> refreshToken() async {
    final refreshToken = await _prefs!.getRefreshToken();
    final response =
        await Dio().post(ApiUrl.refreshToken, data: {'refresh': refreshToken});

    if (response.statusCode == 200) {
      _prefs!.setToken(response.data['access']);
    }
  }


  ////to check if the data already exist then login
  Future<Either<String?, Map<String, dynamic>?>> attemptLogIn(
      String email, String password) async {
    final Map<String, dynamic> loginData = {
      "email": email,
      "password": password
    };
    try {
      final response = await _client!.post(
        ApiUrl.login,
        data: loginData,
        options: Options(headers: kHeaders),
      );
      return Right(response.data);
    } on DioError catch (dioError) {
      return Left(dioError.response!.data["detail"]);
    }
  }




  /// logout and refresh the token
  Future<bool?> logout() async {
    final refreshToken = await Preferences().getRefreshToken();
    try {
      Response response = await _client!.post(
        ApiUrl.logout,
        data: {"refresh_token": refreshToken},
      );
      logOutOauth();
      debugPrint(response.data.toString());
      return response.data['success'];
    } on DioError catch (dioError) {
      throw CustomException.fromDioError(dioError);
    }
  }


  ///forget password
  Future<Map<String, dynamic>?> forgetPassword(String email) async {
    try {
      Response response =
      await _client!.post(ApiUrl.forgetPassword, data: {"email": email});
      return response.data["payload"];
    } on DioError catch (dioError) {
      throw CustomException.fromDioError(dioError);
    }
  }

  Future signUpWithApple({
    required String email,
    required String password,
    required String phoneNumber,
    required String fullName,
    required String fcmToken,
}) async{

  }

  Future<bool?> resetPassword(
      {String? otp, String? password, String? password2}) async {
    var body = {"OTP": otp, "password": password, "confirmPassword": password2};

    try {
      Response response =

      await _client!.post(ApiUrl.resetPassword, data: body);
      debugPrint(response.data.toString());
      return response.data["success"];
    } on DioError catch (dioError) {
      throw CustomException.fromDioError(dioError);
    }
  }


  Future<bool?> confirmOTP(String? otp) async {
    var body = {
      'OTP': otp,
    };
    try {
      Response response = await _client!.post(ApiUrl.activateAccount, data: body);
      debugPrint(response.data.toString());
      return response.data["message"];
    } on DioError catch (dioError) {
      throw CustomException.fromDioError(dioError);
    }
  }

  Future<bool?> resendOTP(String email) async {
    try {
      Response response =
      await _client!.post(ApiUrl.resendOtp+email);
      return response.data["success"];
    } on DioError catch (dioError) {
      throw CustomException.fromDioError(dioError);
    }
  }


}



// class APISignIn extends AuthService{
//   final GoogleSignIn goo = GoogleSignIn();
//
//   GoogleSignInAccount? _googleUser;
//
//   GoogleSignInAccount get user => _googleUser!;
//
//
//   Future<ProfileModel?> signInWithGoogle() async {
//     ProfileModel? user;
//     final googleUser = await goo.signIn();
//     if (googleUser == null) return null;
//
//     _googleUser = googleUser;
//
//     final googleAuthentication = await googleUser.authentication;
//
//     // final credential = GoogleAuthProvider.credential(
//     //   idToken: googleAuthentication.idToken,
//     //   accessToken: googleAuthentication.accessToken,
//     // );
//
//     // await FirebaseAuth.instance.signInWithCredential(credential);
//     //   final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//     //   try {
//     //     user = userCredential.user;
//     //     createUserFromGoogleSignIn(user);
//     //   } on FirebaseAuthException catch (e) {
//     //     if (e.code == 'account-exists-with-different-credential'){
//     //
//     //     }else if (e.code == 'invalid-credential'){
//     //
//     //     }
//     //   }catch (e) {
//     //     rethrow;////repeat login procedures
//     //   }
//     //   return user;
//     // }
//     //
//
//
//     ///create user profile from google login
//     void createUserFromGoogleSignIn(ProfileModel? user) {
//       var diff = DateTime.now().difference(user!.creationTime!);
//
//       ///Check if user is new or old
//       ///If user is new then add new user to firebase rDatabase
//       if (diff < const Duration(seconds: 15)) {
//         ProfileModel model = ProfileModel(
//             id: user.id,
//             profileImage: user.profileImage,
//             profileName: user.profileName,
//             email: user.email,
//             phoneNumber: user.phoneNumber,
//             address: 'Edit Profile to update address'
//         );
//         // return model;
//       }
//     }
//
//     void createUser(ProfileModel user, {bool newUser = false}) {
//       // if(newUser){
//       //   user.profileName =
//       // }
//     }
//
//
//     Future logOutFromGoogle() async {
//       googleSignIn.signOut();
//     }
//   }
// }