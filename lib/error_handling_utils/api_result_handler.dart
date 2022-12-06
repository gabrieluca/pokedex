// ignore_for_file: unused_element

import 'package:dio/dio.dart';

import 'api_result.dart';

Future<ApiResult<T>> _safeResult<T>(
  Future<Response<Map<String, dynamic>>> request,
  T Function(Response<Map<String, dynamic>> response) map,
) async {
  try {
    final response = await request;
    if ((response.statusCode ?? 500) > 400) {
      //TODO Error handling and Log - Api Exception
      return ApiResult(
        errors: [
          ApiError(response.statusMessage?.toString() ?? '${response.statusCode}'),
        ],
      );
    }
    final mapped = map(response);
    return ApiResult(data: mapped);
  } catch (e) {
    //TODO Error handling and Log - Unexpected Exception

    return ApiResult(errors: [ApiError('Oops,! Something went wrong')]);
  }
}
