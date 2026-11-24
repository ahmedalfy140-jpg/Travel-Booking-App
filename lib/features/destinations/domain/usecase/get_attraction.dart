import 'package:travel_booking_app/features/destinations/domain/entities/attraction.dart';
import 'package:travel_booking_app/features/destinations/domain/entities/destination.dart';
import 'package:travel_booking_app/features/destinations/domain/repositories/destination_repositories.dart';

class GetAttractionUseCase {
  final DestinationRepositories repository;

  GetAttractionUseCase(this.repository);

  Future<List<AttractionEntity>> call({required DestinationEntity destination , int limit=20}){
    return repository.getAtrraction(destination:destination ,limit: limit);
  }
}