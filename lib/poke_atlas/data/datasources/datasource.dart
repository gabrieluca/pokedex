import 'package:dartz/dartz.dart';

import '../../domain/errors/failure.dart';

abstract class Datasource {
  Future<Either<Failure, Map<String, dynamic>>> get(
    String url, {
    Map<String, dynamic>? queryParameters,
  });
}
