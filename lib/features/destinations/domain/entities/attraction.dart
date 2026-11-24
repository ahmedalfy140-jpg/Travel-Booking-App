
class AttractionEntity {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final List<String> categories;
  final double? distance;

  const AttractionEntity({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.categories,
    this.distance,
  });
}
