// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geocoding/geocoding.dart';
//
// import '../../models/place.dart';
//
//
// final locationApiProvider = ChangeNotifierProvider((ref) => LocationApi());
//
// class LocationApi extends ChangeNotifier {
//   List<Place> places = [];
//   void handleSearch(String query) async {
//     places.clear();
//     if (query.length > 8) {
//       try {
//         List<Location> locations = await locationFromAddress(query);
//
//         for (var location in locations) {
//           List<Placemark> placeMarks = await placemarkFromCoordinates(
//               location.latitude, location.longitude);
//
//           for (var placemark in placeMarks) {
//             places.add(Place(
//                 name: placemark.name,
//                 street: placemark.street,
//                 country: placemark.country,
//                 locality: placemark.locality));
//           }
//         }
//         notifyListeners();
//       } on Exception {
//         places = [];
//         notifyListeners();
//       }
//     }
//   }
// }
