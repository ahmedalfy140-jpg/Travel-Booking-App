import 'package:travel_booking_app/features/destinations/domain/entities/attraction.dart';
import 'package:travel_booking_app/features/destinations/domain/entities/destination.dart';

abstract interface class DestinationRepositories {
  Future<List<AttractionEntity>> getAtrraction ({required DestinationEntity destination ,int limit =20});
}