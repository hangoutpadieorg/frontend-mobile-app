// TODO Implement this library.


import 'dart:io';

import 'package:dio/adapter.dart';
import "package:dio/dio.dart";
import 'shared_prefernces.dart';

import 'api_urls.dart';

class Client {
  static final Dio _dio = Dio();
  // var url = 'https://hangoutpadie.onrender.com/hangoutPadie';
  Dio init() {
    _dio.options = BaseOptions(
      baseUrl: ApiUrl.baseURL,
      connectTimeout: ApiUrl.connectionTimeOut,
      receiveTimeout: ApiUrl.receiveTimeOut,
      receiveDataWhenStatusError: true,
      followRedirects: true,
      headers: {
        // "Accept": "application/json",
        "Content-Type": "application/json"
      }
    );
    _dio.interceptors.add(ApiInterceptors());
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return _dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token = await Preferences().getToken();
    if (token != null && token != '') {
      options.headers["Authorization"] = "Bearer $token";
    }
    return handler.next(options);
  }


Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
  final options = Options(
    method: requestOptions.method,
    headers: requestOptions.headers,
  );
  return Client._dio.request<dynamic>(requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options);
  }
}
