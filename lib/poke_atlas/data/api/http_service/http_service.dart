import 'package:dio/dio.dart';

abstract class HttpService {
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  });
}
