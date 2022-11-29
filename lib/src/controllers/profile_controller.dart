import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/src/models/profile/profile_model.dart';
import 'package:padie_mobile/src/services/profile/profile_services.dart';

import '../../../../common/constants/exceptions.dart';


final profileControllerProvider =
StateNotifierProvider<ProfileController, AsyncValue<ProfileModel>>((ref) {
  return ProfileController(
    ref // ref.read,
  );
});


class ProfileController extends StateNotifier<AsyncValue<ProfileModel>> {
  final Ref _read;

  ProfileController(this._read) : super(const AsyncValue.loading()) {
    //if (_token != null) {
    getProfile();
    // }
  }
  ProfileServices get profileServices => _read.read(profileServiceProvider);
  Future<void> getProfile() async {
    try {
      final profile = await profileServices.getProfile();
      state = AsyncValue.data(profile);
    } on CustomException catch (e, _) {
      state = AsyncValue.error(e,_);
    }
  }

  Future<bool?> uploadImage(File file) async {
    try {
      final uploaded = await profileServices.uploadImage(file);
      return uploaded;
    } on CustomException {
      return false;
    }
  }

  Future<bool?> updateProfile({Map<String, dynamic>? json}) async {
    try {
      final uploaded = await profileServices.updateProfile(json: json);
      return uploaded;
    } on CustomException {
      return false;
    }
  }

  Future<bool?> updatePersonalProfile({Map<String, dynamic>? json}) async {
    try {
      final uploaded = await profileServices.updatePersonalProfile(json: json);
      return uploaded;
    } on CustomException {
      return false;
    }
  }
}
