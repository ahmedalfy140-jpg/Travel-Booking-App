

class NetworkConfig {
  NetworkConfig._();
  static const String baseurl=  'https://api.geoapify.com/v2/';
  static const String geoapifyApiKey=String.fromEnvironment('46a3e69c38e04a0b96ad73f2b769e464');
  static const Duration connectTimeout =
  Duration(seconds: 30);
  static const Duration receiveTimeout = 
  Duration(seconds: 30);

  static const Duration sendTimeout =
      Duration(seconds: 30);

      static const Map<String,dynamic>defaultHeadrs={
        'accept':'application/json',
        'content-type':'application/json'
      };
}