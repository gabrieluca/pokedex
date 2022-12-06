import 'dart:io';

import 'package:dio/dio.dart';

class DioInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await Future.value('accessToken');
    options.headers[HttpHeaders.authorizationHeader] = 'Bearer $accessToken}';
    handler.next(options);
  }

  //TODO Study Interceptors

  // @override
  // void onResponse(
  //   Response response,
  //   ResponseInterceptorHandler handler,
  // ) {

  // }
}
