
class DestinationEntity {
  final String id;
  final String name;
  final String country;
  final String description;
  final String imageUrl;
  final double latitude;
  final double longitude;
  final int radiusInMeters;

  const DestinationEntity({
    required this.id,
    required this.name,
    required this.country,
    required this.description,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    this.radiusInMeters = 10000,
  });
}
