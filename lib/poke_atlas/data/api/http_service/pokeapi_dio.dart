import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

const _kBaseUrl = 'https://pokeapi.co/api/v2/';
const _kContentType = 'application/json;charset=utf-8';

class PokeApiDio extends DioForNative {
  PokeApiDio() {
    options = BaseOptions(
      baseUrl: _kBaseUrl,
      contentType: _kContentType,
    );
  }
}
