

import 'package:dio/dio.dart';

import 'api_urls.dart';

class DioClient {

  final Dio _dio;
  DioClient(this._dio) {
    _dio
    ..options.baseUrl = ApiUrl.baseURL
      ..options.connectTimeout = ApiUrl.connectionTimeOut
      ..options.receiveTimeout = ApiUrl.receiveTimeOut
     ..options.responseType = ResponseType.json
     ..interceptors.add(LogInterceptor(
       request: true,
       requestHeader: true,
       requestBody: true,
       responseHeader: true,
       responseBody: true,
     ));
  }

  Future<Response> post(
      String uri,{
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async{
    try{
      final Response response = await _dio.post(uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}