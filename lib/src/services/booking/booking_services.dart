import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/src/models/booking/book_model.dart';
import 'package:padie_mobile/src/services/auth/api_client.dart';
import 'package:padie_mobile/src/services/auth/api_urls.dart';

import '../../../../../common/constants/exceptions.dart';


final bookingServiceProvider = Provider<BookingService>((ref) {
  Client _client = Client();

  return BookingService(_client.init());
});

class BookingService {
  final Dio? _dio;
  BookingService([this._dio]);

  //// method to create and upload booking list
  Future<BookingModels> createBooking({
    required BookingModels booking,
  }) async {
    final Map<String, dynamic> bookingData = {
      // "eventId": booking.eventId,
      "name": booking.customerName,
      // "email": booking.email,
      "number_of_seats": booking.numberOfSeats,
      "phone_number": booking.phoneNumber,
      "event_name": booking.eventName,
      "date": booking.date,
      "category": booking.category,
    };
    try {
      Response response = await _dio!.post(
        ApiUrl.bookingList,
        data: bookingData,
      );
       // final booking = BookingModels.convertOrderToMap(response.data[""][""]);
      BookingModels booking = BookingModels.fromJson(response.data["payload"]["data"]);
      return booking;
    } on DioError catch (e) {
      throw CustomException.fromDioError(e);
    }
  }

  //// method to fetch booking lists from the server
  Future<List<BookingModels>> getBookings() async {
    try {
      Response response = await _dio!.get(
        ApiUrl.bookingList,
      );
      var bookingJson = response.data["payload"]["data"] as List;
      List<BookingModels> bookinglist =
      bookingJson.map((e) => BookingModels.fromJson(e)).toList();
      //// return booking lists from the server
      return bookinglist;
    } on DioError catch (e) {
      throw CustomException.fromDioError(e);
    }
  }
}
