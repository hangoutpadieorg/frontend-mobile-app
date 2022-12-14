// ignore_for_file: avoid_leading_underscore
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/src/models/profile/profile_model.dart';
import 'package:padie_mobile/src/services/auth/api_client.dart';
import 'package:padie_mobile/src/services/auth/api_urls.dart';
// import 'package:numbers/models/bank.dart';
// import 'package:numbers/models/profile.dart';
// import 'package:numbers/utils/exceptions.dart';
import '../../../../../common/constants/exceptions.dart';

// import 'api_urls.dart';

final profileServiceProvider = Provider<ProfileServices>((ref) {
  Client _client = Client();
  return ProfileServices(_client.init());
});

class ProfileServices {
  final Dio? _dio;
  ProfileServices([this._dio]);
  Future<ProfileModel> getProfile() async {
    try {
      final Response response = await _dio!.get(
        ApiUrl.profile,
      );
      // options: Options(headers: {
      //   'Authorization': "Bearer $token",
      // }),
      // queryParameters: {'Content-Type': 'application/json'});
      //  print(response.data);
      ProfileModel profile = ProfileModel.fromJson(response.data['payload']['data']);
      return profile;
    } on DioError catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  Future<bool?> uploadImage(File file) async {
    String fileName = file.path.split('/').last;
    var formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
    });
    try {
      Response response = await _dio!.post(
        ApiUrl.avatarUpload,
        data: formData,
      );

      return response.data['success'];
    } on DioError catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  Future<bool?> updateProfile({Map<String, dynamic>? json}) async {
    try {
      Response response = await _dio!.put(
        ApiUrl.profile,
        data: json,
      );

      return response.data["success"];
    } on DioError catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  Future<bool?> updatePersonalProfile({Map<String, dynamic>? json}) async {
    try {
      Response response = await _dio!.put(
        ApiUrl.updatePersonalProfile,
        data: json,
      );

      return response.data["success"];
    } on DioError catch (e) {
      throw CustomException.fromDioError(e);
    }
  }
}
