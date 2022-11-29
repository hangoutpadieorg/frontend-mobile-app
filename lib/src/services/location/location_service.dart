//
//
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:padie_mobile/src/services/auth/api_client.dart';
// import 'package:padie_mobile/src/services/auth/shared_prefernces.dart';
//
//
//
// final locationServiceProvider = Provider<LocationService>((ref) {
//   Client _client = Client();
//
//   return LocationService(_client.init());
// });
//
// class LocationService{
//   final Dio? _client;
//   final Preferences? _prefs;
//   LocationService([this._client, this._prefs]);
//
//   Future<Response> getAddressFromGeoCode(LatLng latLng) async{
//     return await _client!.get('path');
//   }
// }