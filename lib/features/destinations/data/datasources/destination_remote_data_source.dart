import 'package:travel_booking_app/core/network/api/api_consumer.dart';
import 'package:travel_booking_app/core/network/network_config.dart';
import 'package:travel_booking_app/features/destinations/data/models/attraction_model.dart';

class DestinationRemoteDataSource {
  final ApiConsumer apiConsumer;

  DestinationRemoteDataSource({required this.apiConsumer});
  Future<List<AttractionModel>>getAtrraction ({ required double latitude,
    required double longitude,
    required int radiusInMeters,
    int limit = 20,})async{
      if(NetworkConfig.geoapifyApiKey.isEmpty){
         throw Exception(
        'Geoapify API key is missing. '
        'Run the app with --dart-define=GEOAPIFY_API_KEY=YOUR_KEY',
      );
      }
        final response = await apiConsumer.get(
      'places',
      queryParameters: {
        'categories': 'tourism.attraction',
        'filter':
            'circle:$longitude,$latitude,$radiusInMeters',
        'limit': limit, 
        'apiKey': NetworkConfig.geoapifyApiKey,
      },
    );

    final features = response['features'];

    if (features is! List) {
      throw const FormatException(
        'Geoapify response does not contain features.',
      );
    }

    return features
        .whereType<Map<String, dynamic>>()
        .map(AttractionModel.fromGeoJsonFeature)
        .toList();
  
    }

}