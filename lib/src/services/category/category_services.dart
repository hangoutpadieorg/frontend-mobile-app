import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/src/models/category/category_model.dart';
import 'package:padie_mobile/src/services/auth/api_client.dart';
import 'package:padie_mobile/src/services/auth/api_urls.dart';

import '../../../../../../common/constants/exceptions.dart';


// import 'api_urls.dart';

final categoryServiceProvider = Provider<CategoryService>((ref) {
  Client _client = Client();

  return CategoryService(_client.init());
});

class CategoryService {
  final Dio? _dio;
  CategoryService([this._dio]);

  Future<List<CategoryModel>> getCategories() async {
    try {
      Response response = await _dio!.get(
        ApiUrl.categoryList,
        // queryParameters: {"": id}
      );
      var categoryJson = response.data["payload"]["data"] as List;
      List<CategoryModel> categortlist =
      categoryJson.map((e) => CategoryModel.fromJson(e)).toList();
      return categortlist;
    } on DioError catch (e) {
      throw CustomException.fromDioError(e);
    }
  }
}
