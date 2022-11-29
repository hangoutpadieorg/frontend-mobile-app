
// import '../place.dart';

class CategoryModel {
  final String? id;
  final String label;
  final String imageUrl;
  final String address;
  final String details;
  final String openTime;
  final String latitude;
  final String longitude;
  final List<CategoryFee>? entryFee;
  // final Place? place;
  final List<DetailImages>? detailImages;
  final String location;
  final String categoryId;
  final String category;
  CategoryModel({
    this.id,
    required this.label,
    required this.imageUrl,
    required this.address,
    required this.details,
    required this.openTime,
    required this.entryFee,
    required this.latitude,
    required this.longitude,
    required this.detailImages,
    required this.location,
    required this.categoryId,
    required this.category,
    // this.place,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    // final cat = json['fees'] as List<CategoryFee>;
    {
      final label = map['name'] as String;
      // ignore: unnecessary_null_comparison
      if(label == null) {
        throw UnsupportedError("Invalid data: $map -> 'name' is missing");
      }
      final imageUrl = map['imageUrl'] as String;
      // ignore: unnecessary_null_comparison
      if(imageUrl == null) {
        throw UnsupportedError("Invalid data: $map -> 'imageUrl' is missing");
      }
      final address = map['address'] as String;
      // ignore: unnecessary_null_comparison
      if(address == null) {
        throw UnsupportedError("Invalid data: $map -> 'address' is missing");
      }

      final details = map['details'] as String;
      // ignore: unnecessary_null_comparison
      if(details == null) {
        throw UnsupportedError("Invalid data: $map -> 'details' is missing");
      }

      final latitude = map['latitude'] as String;
      // ignore: unnecessary_null_comparison
      if(latitude == null) {
        throw UnsupportedError("Invalid data: $map -> 'details' is missing");
      }

      final longitude = map['longitude'] as String;
      // ignore: unnecessary_null_comparison
      if(longitude == null) {
        throw UnsupportedError("Invalid data: $map -> 'details' is missing");
      }


      final openTime = map['openTime'] as String;
      // ignore: unnecessary_null_comparison
      if(openTime == null) {
        throw UnsupportedError("Invalid data: $map -> 'openTime' is missing");
      }

      final detailImages = map['detail_images'] as List<dynamic>?;
      // if(detailImages != null){
      //   detailImages =[];
      //   detailImages.forEach((element) {
      //     detailImages?.add(DetailImages.fromJson(element));
      //   });
      // }
      final images = detailImages != null ? detailImages.map((reviewData) => DetailImages.fromJson(reviewData)).toList()
          : <DetailImages>[];

      // final place = map['places'] as Map<String, dynamic>?;
      // final places = place != null ?  Place.fromJson(place)
      //     : Place;

      final location = map['location'] as String;
      // ignore: unnecessary_null_comparison
      if(location == null) {
        throw UnsupportedError("Invalid data: $map -> 'location' is missing");
      }

      final category = map['category'] as String;
      // ignore: unnecessary_null_comparison
      if(category == null) {
        throw UnsupportedError("Invalid data: $map -> 'category' is missing");
      }

      final categoryId = map['categoryId'] as String;
      // ignore: unnecessary_null_comparison
      if(categoryId == null) {
        throw UnsupportedError("Invalid data: $map -> 'categoryId' is missing");
      }


      final catFee = map['fees'] as List<dynamic>?;
      final fee = catFee != null ? catFee.map((reviewData) => CategoryFee.fromJson(reviewData)).toList()
          : <CategoryFee>[];
      return CategoryModel(label: label, imageUrl: imageUrl, address: address,
          details: details, openTime: openTime, entryFee: fee,
          detailImages: images, location: location,
          latitude: latitude, longitude: longitude, // place: places,
          categoryId: categoryId, category: category);

    }
  }

  Map<String, dynamic> toJson(){
    final json = <String, dynamic>{};
    json['id'] = id;
    json['categoryId'] = categoryId;
    json['label'] = label;
    json['imageUrl'] = imageUrl;
    json['address'] = address;
    json['details'] = details;
    json['openTime'] = openTime;
    json['location'] = location;
    json['category'] = category;
    json['latitude'] = latitude;
    json['longitude'] = longitude;
    if(entryFee != null) {
      json['fees'] = entryFee?.map((e) => e.toJson());
    }
    if(detailImages != null) {
      json['detail_images'] = detailImages?.map((e) => e.toJson());
    }
    // if(place != null) {
    //   json['places'] = place?.map((e) => e.toJson());
    // }
    // json['id'] = id;

    return json;
  }
}

class DetailImages{
  final int? id;
  final String? images;
  final int? categoryId;

  DetailImages({
    this.id,
    this.images,
    this.categoryId,
  });

  factory DetailImages.fromJson(Map<String, dynamic> json) {
    return DetailImages(
      id: json['id'] as int,
      images: json['images'] as String,
      categoryId: json['categoryId'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'images': images,
    };
  }

  static Map convertOrderToMap(DetailImages images) {
    Map imageModel = images.toJson();
    return imageModel;
  }
}

class CategoryFee{
  final int? id;
  final int? categoryId;
  final String? categoryName;
  final String? price;

  CategoryFee({
    this.id,
    this.categoryName,
    this.price,
    this.categoryId
  });

  factory CategoryFee.fromJson(Map<String, dynamic> json) {
    return CategoryFee(
      id: json['id'],
      categoryName: json['categoryName'],
      categoryId: json['categoryId'],
      price: json['fee'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryName': categoryName,
      'price': price,
    };
  }

  static Map convertOrderToMap(CategoryFee fee) {
    Map feeModel = fee.toJson();
    return feeModel;
  }
}