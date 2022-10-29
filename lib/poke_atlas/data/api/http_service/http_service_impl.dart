import 'package:dio/dio.dart';

import 'http_service.dart';
import 'pokeapi_dio.dart';

class HttpServiceImpl extends HttpService {
  late final Dio _dio;

  HttpServiceImpl([Dio? _newDio]) {
    _dio = _newDio ?? PokeApiDio();
  }

  @override
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return _dio.get(url, queryParameters: queryParameters);
  }
}
