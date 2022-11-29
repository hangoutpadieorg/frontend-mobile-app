class Place {
  final int? id;
  final int? categoryId;
  final double? latitude;
  final double? longitude;
  Place({
    this.id,
    this.categoryId,
    this.latitude,
     this.longitude,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'] as int,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      // locality: json['locality'] as String,
      // country: json['country'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'latitude': latitude,
      'longitude': longitude,
      // 'locality': locality,
      // 'country': country,
    };
  }
}
