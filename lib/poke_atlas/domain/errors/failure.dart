abstract class Failure implements Exception {
  late final String? message;

  @override
  String toString() {
    if (message != null) {
      '$runtimeType: $message';
    }
    return '$runtimeType';
  }
}

class ResponseFailure extends Failure {
  ResponseFailure([String? message]) {
    this.message = message;
  }
}

class NetworkFailure extends Failure {
  NetworkFailure([String? message]) {
    this.message = message;
  }
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure([String? message]) {
    this.message = message;
  }
}
