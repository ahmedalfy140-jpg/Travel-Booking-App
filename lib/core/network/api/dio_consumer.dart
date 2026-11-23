
import 'package:dio/dio.dart';
import 'package:travel_booking_app/core/network/network_exeption.dart';

import 'api_consumer.dart';


class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio});

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  @override
  Future<dynamic> post(
    String path, {
    dynamic body,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: body,
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  @override
  Future<dynamic> put(
    String path, {
    dynamic body,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: body,
      );

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  @override
  Future<dynamic> delete(String path) async {
    try {
      final response = await dio.delete(path);

      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }
}
