import 'dart:convert';
import 'dart:io';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:numbers/services/api_urls.dart';
// import 'package:numbers/services/shared_prefernces.dart';
// import 'package:numbers/utils/exceptions.dart';

// import 'api_client.dart';

// final authServiceProvider = Provider<AuthService>((ref) {
//   Client _client = Client();
//   return AuthService(_client.init());
// });

class AuthService {
  // final Dio? _client;
  // AuthService([this._client]);
  // Future<int> register(
  //     {required String email,
  //       required String password,
  //       required String password2,
  //       required String phoneNumber,
  //       required String fullName,
  //       required String fcmToken,
  //       String? referrer,
  //       String? otpCode}) async {
  //   final Map<String, dynamic> registrationData = {
  //     "email": email,
  //     "password": password,
  //     "password2": password2,
  //     "phone_number": phoneNumber,
  //     "full_name": fullName,
  //     "fcm_token": fcmToken,
  //     "referrer": referrer,
  //     "otp_code": otpCode!
  //   };
  //   try {
  //     final response = await _client!.post(
  //       ApiUrl.register,
  //       data: json.encode(registrationData),
  //     );
  //     debugPrint(response.data.toString());
  //     return response.data["status"];
  //   } on DioError catch (dioError) {
  //     throw CustomException.fromDioError(dioError);
  //   }
  // }

  // Future<void> refreshToken() async {
  //   final refreshToken = await _prefs.getRefreshToken();
  //   final response =
  //       await Dio().post(ApiUrl.refreshToken, data: {'refresh': refreshToken});

  //   if (response.statusCode == 200) {
  //     _prefs.setToken(response.data['access']);
  //   }
  // }

  // Future<Either<String?, Map<String, dynamic>?>> attemptLogIn(
  //     String email, String password) async {
  //   final Map<String, dynamic> loginData = {
  //     "email": email,
  //     "password": password
  //   };
  //   try {
  //     final response = await _client!.post(
  //       ApiUrl.login,
  //       data: loginData,
  //     );
  //
  //     return Right(response.data);
  //   } on DioError catch (dioError) {
  //     return Left(dioError.response!.data["detail"]);
  //   }
  // }
  //
  // Future<bool?> logout() async {
  //   final refreshToken = await Preferences().getRefreshToken();
  //   try {
  //     Response response = await _client!.post(
  //       ApiUrl.logout,
  //       data: {"refresh_token": refreshToken},
  //     );
  //     debugPrint(response.data.toString());
  //     return response.data['success'];
  //   } on DioError catch (dioError) {
  //     throw CustomException.fromDioError(dioError);
  //   }
  // }

  // Future<Map<String, dynamic>?> forgetPassword(String email) async {
  //   try {
  //     Response response =
  //     await _client!.post(ApiUrl.forgetPassword, data: {"email": email});
  //     return response.data["payload"];
  //   } on DioError catch (dioError) {
  //     throw CustomException.fromDioError(dioError);
  //   }
  // }

  // Future<bool?> recoverPassword(
  //     {String? otp, String? password, String? password2}) async {
  //   var body = {"code": otp, "password1": password, "password2": password2};
  //
  //   try {
  //     Response response =
  //     await _client!.post(ApiUrl.recoverPassword, data: body);
  //     debugPrint(response.data.toString());
  //     return response.data["success"];
  //   } on DioError catch (dioError) {
  //     throw CustomException.fromDioError(dioError);
  //   }
  // }
}
