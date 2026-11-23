abstract interface class ApiConsumer {
  Future <dynamic> get( String path,{Map<String,dynamic>? queryParameters } );
   

Future<dynamic> post(String path ,{ dynamic body});
Future<dynamic>put(String path ,{dynamic body});
Future<dynamic>delete(String path );


}