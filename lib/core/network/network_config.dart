
class NetworkConfig {
  NetworkConfig._();

  static const String baseUrl = 'https://api.geoapify.com/v2/';

  static const String geoapifyApiKey =
      String.fromEnvironment('GEOAPIFY_API_KEY');

  static const Duration connectTimeout =
      Duration(seconds: 30);

  static const Duration receiveTimeout =
      Duration(seconds: 30);

  static const Duration sendTimeout =
      Duration(seconds: 30);

  static const Map<String, dynamic> defaultHeaders = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
}
