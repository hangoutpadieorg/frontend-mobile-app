import 'dart:async';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/constants/exceptions.dart';
import '../services/auth/auth_services.dart';


final authControllerProvider = StateNotifierProvider<AuthController, dynamic>(
      (ref) => AuthController(read: ref),/////
);

class AuthController extends StateNotifier {
  final Ref read;
  AuthController({
    required this.read
  }) : super(null);

  FutureOr<Either<String, dynamic>> register({
    required String email,
    required String password,
    required String password2,
    // required String phoneNumber,
    required String name,
    // required String fcmToken,
    required String role,
    // required String photoUrl,
    // String? otpCode,
  }) async {
    try {
      dynamic status = await read.read(authServiceProvider).register(
          email: email,
          role: role,
          password: password,
          password2: password2,
          // phoneNumber: phoneNumber,
          name: name,
          // photoUrl: photoUrl,
          // otpCode: otpCode,
          // fcmToken: fcmToken
      );
      return Right(status);
    } on CustomException catch (e) {
      return Left(e.message!);
    }

  }

  FutureOr<Either<String, int?>> registerWithOauth({
    required String id,
    required String email,
    // required String password,
    // required String phoneNumber,
    required String fullName,
    // required String fcmToken,
    required String photoUrl,
    required String role
  }) async {
    try {
      int? status = await read.read(authServiceProvider).registerWithOauth(
        email: email,
        role: role,
        // password: password,
        // phoneNumber: phoneNumber,
        fullName: fullName,
        photoUrl: photoUrl,
        // fcmToken: fcmToken,
        userId: id,
      );
      return Right(status);
    } on CustomException catch (e) {
      return Left(e.message!);
    }

  }


  FutureOr<bool?> resendOTP(String email) async {
    try {
      bool? status = await read.read(authServiceProvider).resendOTP(email);
      return status;
    } on CustomException {
      return false;
    }
  }

  FutureOr<bool?> confirmOTP(String? otp) async {
    try {
      bool? status = await read.read(authServiceProvider).confirmOTP(otp);
      return status;
    } on CustomException {
      return false;
    }
  }

  FutureOr<Either<String?, Map<String, dynamic>?>> login(
      String name, String password) async {
    try {
      final response = await read.read(authServiceProvider).attemptLogIn(
        name,
        password,
      );
      return response;
    } on CustomException catch (e) {
      return Left(e.message);
    }
  }

  FutureOr<Either<String?, Map<String, dynamic>?>> loginWithOauth(
      String id, String email) async {
    try {
      final response = await read.read(authServiceProvider).loginWithOauth(
        id,
        email,
      );
      return response;
    } on CustomException catch (e) {
      return Left(e.message);
    }
  }


  Future<Map<String, dynamic>?> forgetPassword(String email) async {
    try {
      final Map<String, dynamic>? response =
      await read.read(authServiceProvider).forgetPassword(email);
      return response;
    } on CustomException catch (e) {
      throw e.message!;
    }
  }



  Future<bool?> resetPassword(
      {String? otp, String? password, String? password2}) async {
    try {
      final passwordChanged = await read.read(authServiceProvider)
          .resetPassword(otp: otp, password: password, password2: password2);
      return passwordChanged;
    } on CustomException {
      return false;
    }
  }

  Future<bool?> logout() async {
    try {
      final bool? loggedOut = await read.read(authServiceProvider).logout();
      return loggedOut;
    } on CustomException {
      return false;
    }
  }
}

final filesProvider =
StateNotifierProvider<Files, List<File?>>((ref) => Files());

class Files extends StateNotifier<List<File?>> {
  Files() : super([]);

  addFile(File? file, int id) {
    if (id == 1) {
      state = [file, ...state].toList();
    } else {
      state = [...state, file].toList();
    }
  }
}
