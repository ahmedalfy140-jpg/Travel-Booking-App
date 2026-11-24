
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:travel_booking_app/core/network/interceptors/api_interceptors.dart';
import 'package:travel_booking_app/features/destinations/data/repositories/destination_repositoryImpl.dart';
import 'package:travel_booking_app/features/destinations/domain/repositories/destination_repositories.dart';
import 'package:travel_booking_app/features/destinations/domain/usecase/get_attraction.dart';
import 'package:travel_booking_app/features/destinations/presentaion/manager/cubit/cubit/destination_cubit.dart';

import '../network/api/api_consumer.dart';
import '../network/api/dio_consumer.dart';

import '../network/network_config.dart';

import '../../features/destinations/data/datasources/destination_remote_data_source.dart';



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

  // Destinations Feature

  sl.registerLazySingleton<DestinationRemoteDataSource>(
    () => DestinationRemoteDataSource(
      apiConsumer: sl<ApiConsumer>(),
    ),
  );

  sl.registerLazySingleton<DestinationRepositories>(
    () => Destinationrepositoryimpl(
      dataSource: sl<DestinationRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<GetAttractionUseCase>(
    () => GetAttractionUseCase(
      sl<DestinationRepositories>(),
    ),
  );
  sl.registerFactory<DestinationCubit>(
  () => DestinationCubit(
    getAttractionsUseCase: sl<GetAttractionUseCase>(),
  ),
);

}
