
import '../../domain/entities/attraction.dart';

class AttractionModel extends AttractionEntity {
  const AttractionModel({
    required super.id,
    required super.name,
    required super.address,
    required super.latitude,
    required super.longitude,
    required super.categories,
    super.distance,
  });

  factory AttractionModel.fromGeoJsonFeature(
    Map<String, dynamic> json,
  ) {
    final properties = _asStringMap(json['properties']);
    final datasource = _asStringMap(properties['datasource']);
    final raw = _asStringMap(datasource['raw']);

    final latitude = _toDouble(properties['lat']);
    final longitude = _toDouble(properties['lon']);

    final rawCategories = properties['categories'];

    final categories = rawCategories is List
        ? rawCategories.map((e) => e.toString()).toList()
        : <String>[];

    return AttractionModel(
      id: properties['place_id']?.toString() ??
          '${latitude}_$longitude',
      name: _firstNonEmpty([
        properties['name'],
        json['name'],
        raw['name'],
        properties['address_line1'],
      ]) ?? 'Unknown place',
      address: properties['formatted']?.toString() ??
          properties['address_line1']?.toString() ??
          'Address unavailable',
      latitude: latitude,
      longitude: longitude,
      categories: categories,
      distance: properties['distance'] == null
          ? null
          : _toDouble(properties['distance']),
    );
  }

  static double _toDouble(dynamic value) {
    if (value is num) return value.toDouble();
    return double.tryParse(value?.toString() ?? '') ?? 0.0;
  }

  static Map<String, dynamic> _asStringMap(dynamic value) {
    if (value is Map<String, dynamic>) return value;
    if (value is Map) return Map<String, dynamic>.from(value);
    return const {};
  }

  static String? _firstNonEmpty(Iterable<dynamic> values) {
    for (final value in values) {
      final text = value?.toString().trim();
      if (text != null && text.isNotEmpty) return text;
    }
    return null;
  }
}
