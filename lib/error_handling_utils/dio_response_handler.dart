import 'package:dio/dio.dart';

extension DioResponseHandler on Future<Response<Map<String, dynamic>>> {
  Future<Map<String, dynamic>> handleResponse() async {
    final response = await (this);
    final statusCode = response.statusCode ?? -1;
    if (statusCode != 200) {
      //TODO Error handling - API Exception
    }
    final data = response.data;
    if (data == null) throw NullThrownError(); //TODO Error handling - Null Data Exception
    return data;
  }
}
