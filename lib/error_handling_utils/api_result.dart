class ApiResult<T> {
  final List<ApiError>? errors;
  final T? data;

  ApiResult({this.errors, this.data});

  ApiResult<T> copyWith({
    List<ApiError>? errors,
    T? data,
  }) {
    return ApiResult<T>(
      errors: errors ?? this.errors,
      data: data ?? this.data,
    );
  }
}

class ApiError {
  final String message;

  ApiError(this.message);
}
