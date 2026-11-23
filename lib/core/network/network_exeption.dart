
import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;
  final int? statusCode;

  const NetworkException({
    required this.message,
    this.statusCode,
  });

  factory NetworkException.fromDioException(
    DioException exception,
  ) {
    final response = exception.response;

    if (response != null) {
      final data = response.data;

      final message = data is Map
          ? data['message']?.toString()
          : null;

      return NetworkException(
        message: message ?? _statusMessage(response.statusCode),
        statusCode: response.statusCode,
      );
    }

    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException(
          message: 'Connection timeout. Please try again.',
        );

      case DioExceptionType.connectionError:
        return const NetworkException(
          message: 'No internet connection.',
        );

      case DioExceptionType.cancel:
        return const NetworkException(
          message: 'Request was cancelled.',
        );

      case DioExceptionType.badCertificate:
        return const NetworkException(
          message: 'Secure connection failed.',
        );

      default:
        return const NetworkException(
          message: 'Unexpected network error.',
        );
    }
  }

  static String _statusMessage(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request.';
      case 401:
        return 'Unauthorized.';
      case 403:
        return 'Access forbidden.';
      case 404:
        return 'Resource not found.';
      case 500:
        return 'Internal server error.';
      default:
        return 'Something went wrong.';
    }
  }

  @override
  String toString() => message;
}
