
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_app/features/destinations/domain/entities/destination.dart';
import 'package:travel_booking_app/features/destinations/presentaion/manager/cubit/cubit/destinations_list_cubit.dart';


import 'destination_card.dart';

class DestinationsViewBody extends StatelessWidget {
  const DestinationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text(
              'Explore the world',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Discover beautiful places around you',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 24),

            Expanded(
              child: BlocBuilder<DestinationsListCubit, List<DestinationEntity>>(
                builder: (context, destinations) {
                  return ListView.separated(
                    itemCount: destinations.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      return DestinationCard(
                        destination: destinations[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
