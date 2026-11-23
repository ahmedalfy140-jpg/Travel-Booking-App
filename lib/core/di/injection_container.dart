
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:travel_booking_app/core/network/interceptors/api_interceptors.dart';

import '../network/api/api_consumer.dart';
import '../network/api/dio_consumer.dart';

import '../network/network_config.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Dio configuration
  sl.registerLazySingleton<Dio>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: NetworkConfig.baseurl,
        connectTimeout: NetworkConfig.connectTimeout,
        receiveTimeout: NetworkConfig.receiveTimeout,
        sendTimeout: NetworkConfig.sendTimeout,
        headers: NetworkConfig.defaultHeadrs,
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(ApiInterceptors());

    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: false,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 100,
        ),
      );
    }

    return dio;
  });

  // API Consumer
  sl.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: sl<Dio>()),
  );
}
