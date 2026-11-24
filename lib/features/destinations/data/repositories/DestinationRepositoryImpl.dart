import 'package:travel_booking_app/features/destinations/data/datasources/destination_remote_data_source.dart';
import 'package:travel_booking_app/features/destinations/domain/entities/attraction.dart';
import 'package:travel_booking_app/features/destinations/domain/entities/destination.dart';
import 'package:travel_booking_app/features/destinations/domain/repositories/destination_repositories.dart';

class Destinationrepositoryimpl implements DestinationRepositories {
  final DestinationRemoteDataSource dataSource;

  Destinationrepositoryimpl({required this.dataSource});
  @override
  Future<List<AttractionEntity>> getAtrraction({
    required DestinationEntity destination,
    int limit = 20,
  }) async {
    return await dataSource.getAtrraction(
      latitude: destination.latitude,
      longitude: destination.longitude,
      radiusInMeters: destination.radiusInMeters,
    );
  }
}
