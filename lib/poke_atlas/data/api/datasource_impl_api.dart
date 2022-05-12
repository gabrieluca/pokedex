import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/errors/failure.dart';
import 'http_service/http_service.dart';
import '../datasources/datasource.dart';

class DatasourceImplApi extends Datasource {
  final HttpService httpService;

  DatasourceImplApi(this.httpService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response =
          await httpService.get(url, queryParameters: queryParameters);

      return Right(response.data);
    } on DioError catch (e) {
      return Left(
        ResponseFailure('${e.response?.statusCode}'),
      );
    } catch (error) {
      return Left(
        UnexpectedFailure(),
      );
    }
  }
}
