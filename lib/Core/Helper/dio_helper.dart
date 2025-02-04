import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:offto/Core/Const/app_urls.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    debugPrint('dio helper run');
    dio = Dio(BaseOptions(
      validateStatus: (_) => true,
      baseUrl: AppUrls.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    bool isJsonContentType = true,
    Map<String, dynamic>? headers,
    required String url,
    var data,
    Map<String, dynamic>? query,
    String? token,
    String? lang,
  }) async {
    dio!.options.headers = headers ??
        {
          'Content-Type': 'application/json',
          'Accept-Language': lang,
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        };
    return dio!.post(
      url,
      data: data,
      options: Options(
        contentType: Headers.jsonContentType,
        followRedirects: false,
      ),
    );
  }
}
