import 'package:flutter/material.dart';
import 'package:travel_booking_app/core/di/injection_container.dart';
import 'package:travel_booking_app/features/destinations/presentaion/views/destinations_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Booking',
      theme: ThemeData(useMaterial3: true),
      home: DestinationsView()
        
      
     
      
      
    );
  }
}
