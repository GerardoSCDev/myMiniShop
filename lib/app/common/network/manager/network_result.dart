sealed class NetworkResult<T> {
  const NetworkResult();
}

class NetworkSuccess<T> extends NetworkResult<T> {
  const NetworkSuccess(this.data);

  final T data;
}

class NetworkFailure<T> extends NetworkResult<T> {
  const NetworkFailure({
    required this.message,
    this.statusCode,
    this.error,
  });

  final String message;
  final int? statusCode;
  final Object? error;
}
