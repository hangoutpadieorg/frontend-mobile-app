//
//
//
//
//
// import 'package:dio/dio.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../services/location/location_service.dart';
//
// class LocationController extends StateNotifier{
//   LocationService? locationService;
//   Ref? ref;
//   LocationController([this.locationService, this.ref]) : super(const []);
//
//   Future<String> getAddressFromGeocode(LatLng latLng) async{
//     String address = "";
//     Response? response = await ref?.read(locationServiceProvider).getAddressFromGeoCode(latLng);
//     // debugPrint(response.statusMessage.isOk);
//     address = response!.data[''];
//    return address;
//   }
// }