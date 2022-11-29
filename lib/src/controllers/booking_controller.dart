// import 'package:collection/collection.dart' show IterableExtension;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/src/models/booking/book_model.dart';
import '../../../../common/constants/exceptions.dart';

import '../services/booking/booking_services.dart';

final bookingListProvider =
StateNotifierProvider<BookingController, AsyncValue<List<BookingModels>>>(
        (ref) => BookingController(ref));

//final filterProvider = StateProvider((ref) => Filter.issued);


/////changes needs to be made to filter the categories accordingly

class BookingController extends StateNotifier<AsyncValue<List<BookingModels>>>{
  final Ref? _ref;
  BookingController([this._ref]) : super(const AsyncValue.data([])) {
    getBookings();
    // createBooking(bookings: bookings);
  }

  Future<void> getBookings() async {
    try {
      final bookings = await _ref?.read(bookingServiceProvider).getBookings();
      state = AsyncValue.data(bookings!);
    } on CustomException catch (e, _) {
      state = AsyncValue.error([e], _);
    }
  }

  Future<BookingModels?> createBooking(
      {required BookingModels bookings}) async {
    try {
      BookingModels? createdBookings =
      await _ref?.read(bookingServiceProvider).createBooking(booking: bookings);

      return createdBookings;
    } on CustomException catch (e) {
      throw e.message!;
    }
  }
}
