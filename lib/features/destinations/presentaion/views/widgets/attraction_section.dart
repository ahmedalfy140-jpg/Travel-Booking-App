import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;
import 'package:travel_booking_app/features/destinations/domain/entities/destination.dart';
import 'package:travel_booking_app/features/destinations/presentaion/manager/cubit/cubit/destination_cubit.dart';
import 'package:travel_booking_app/features/destinations/presentaion/manager/cubit/cubit/destination_state.dart';

class AttractionSection extends StatelessWidget {
  const AttractionSection({super.key, required this.destination});

  final DestinationEntity destination;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DestinationCubit, DestinationState>(
      builder: (context, state) {
        if(state is  DestinationLoading){
          return Center(child: CircularProgressIndicator());
        }
        if(state is DestinationFailure){
          return Center(child: Column(
            children: [
              Text(state.message),
              TextButton(
                onPressed: () => context
                    .read<DestinationCubit>()
                    .getAttractions(destination),
                child: const Text('Try again'),
              )
            ],
          ));
        }
        if(state is DestinationSuccess){
          if(state.attractions.isEmpty){
            return Text( 'No attractions found for this destination.');
          }
          return  Column(
            children: state.attractions.map((attraction) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFE5EBDD),
                    child: Icon(
                      Icons.place,
                      color: Color(0xFF426B50),
                    ),
                  ),
                  title: Text(
                    attraction.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(attraction.address),
                ),
              );
            }).toList(),
          );
          
        }
        return const SizedBox.shrink();
       
      },
    );
  }
}
