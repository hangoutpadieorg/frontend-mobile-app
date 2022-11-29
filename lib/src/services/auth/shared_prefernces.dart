// TODO Implement this library.

import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  /// set token
  Future<void> setToken(String value) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.setString("token", value);
  }

  /// retrieve token
  Future<String?> getToken() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    String? token = _preferences.getString("token");
    return token;
  }

  Future<void> deleteToken() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.remove("token");
  }
  Future<void> setRefreshToken(String value) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.setString("refresh_token", value);
  }
  Future<String?> getRefreshToken() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    String? token = _preferences.getString("refresh_token");
    return token;
  }

  Future<void> deleteRefreshToken() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.remove("refresh_token");
  }


  Future<void> setFCMToken(String value) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.setString("fcm_token", value);
  }

  Future<String?> getFCMToken() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    String? token = _preferences.getString("fcm_token");
    return token;
  }
}
