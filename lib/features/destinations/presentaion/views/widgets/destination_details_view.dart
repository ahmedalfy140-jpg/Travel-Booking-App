import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_app/core/di/injection_container.dart';
import 'package:travel_booking_app/features/destinations/domain/entities/destination.dart';
import 'package:travel_booking_app/features/destinations/presentaion/manager/cubit/cubit/destination_cubit.dart';
import 'package:travel_booking_app/features/destinations/presentaion/views/widgets/attraction_section.dart';

class DestinationDetailsView extends StatelessWidget {
  const DestinationDetailsView({super.key, required this.destinationEntity});
  final DestinationEntity destinationEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<DestinationCubit>()..getAttractions(destinationEntity),
      child: Scaffold(
        backgroundColor: Color(0xFFF8F6F0),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Hero(
                          tag: destinationEntity.id,
                          child: Image.network(
                            destinationEntity.imageUrl,
                            height: 350,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.black),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 24,
                          left: 20,
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                destinationEntity.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                destinationEntity.country,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ) ),
                          
                      ],
                    ),
                    Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              const Text(
                            'About destination',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            destinationEntity.description,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black54,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 28),
                          const Text(
                            'Popular Attractions',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          AttractionSection(destination: destinationEntity),
                            ],),
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
