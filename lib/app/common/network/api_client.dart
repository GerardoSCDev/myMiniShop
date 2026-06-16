import 'package:dio/dio.dart';

import 'api_endpoint.dart';
import 'network_result.dart';

class ApiClient {
  ApiClient({
    required String baseUrl,
    Dio? dio,
    Duration connectTimeout = const Duration(seconds: 20),
    Duration receiveTimeout = const Duration(seconds: 20),
  }) : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: baseUrl,
                connectTimeout: connectTimeout,
                receiveTimeout: receiveTimeout,
              ),
            );

  final Dio _dio;

  Future<NetworkResult<TResponse>> request<TResponse>(
    ApiEndpoint<TResponse> endpoint,
  ) async {
    try {
      final response = await _dio.request<dynamic>(
        endpoint.path,
        data: endpoint.body,
        queryParameters: endpoint.queryParameters,
        options: endpoint.options,
      );

      return NetworkSuccess<TResponse>(
        endpoint.mapper(response.data),
      );
    } on DioException catch (error) {
      return NetworkFailure<TResponse>(
        message: error.message ?? 'Network error',
        statusCode: error.response?.statusCode,
        error: error,
      );
    } catch (error) {
      return NetworkFailure<TResponse>(
        message: 'Unexpected error',
        error: error,
      );
    }
  }
}
