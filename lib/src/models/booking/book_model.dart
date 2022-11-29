class BookingModels {
  final int? id;
  final String? eventId;
  final String customerName;
  final String eventName;
  final String phoneNumber;
  final String numberOfSeats;
  final String category;
  final DateTime date;

  BookingModels({
    required this.customerName,
    required this.eventName,
    required this.phoneNumber,
    // required this.email,
    required this.numberOfSeats,
    required this.category,
    required this.date,
    this.id,
    this.eventId,

  });


  factory BookingModels.fromJson(Map<String, dynamic> json) {
    return BookingModels(
      customerName: json["name"],
      eventName: json["event_name"],
      phoneNumber: json["phone_number"],
      date: DateTime.parse(json['date']),
      // email: json["email"],
      numberOfSeats: json["number_of_seats"],
      category: json["category"],
      eventId: json["eventId"],
      id: json["bookingId"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'eventId': eventId,
      'name': customerName,
      'event_name': eventName,
      // 'email': email,
      'phoneNumber': phoneNumber,
      'number_of_seats': numberOfSeats,
      'category': category,
    };
  }

  static Map convertOrderToMap(BookingModels booking) {
    Map bookingModel = booking.toJson();
    return bookingModel;
  }
}

