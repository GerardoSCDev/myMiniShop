import 'package:dio/dio.dart';

import 'api_headers.dart';
import 'api_request.dart';
import 'http_method.dart';

typedef ResponseMapper<TResponse> = TResponse Function(dynamic json);

class ApiEndpoint<TResponse> {
  const ApiEndpoint({
    required this.path,
    required this.method,
    required this.mapper,
    this.request,
    this.headers,
    this.queryParameters,
  });

  final String path;
  final HttpMethod method;
  final ApiRequest? request;
  final ApiHeaders? headers;
  final Map<String, dynamic>? queryParameters;
  final ResponseMapper<TResponse> mapper;

  Options get options {
    return Options(
      method: method.value,
      headers: headers?.toMap(),
    );
  }

  Map<String, dynamic>? get body {
    return request?.toJson();
  }
}
