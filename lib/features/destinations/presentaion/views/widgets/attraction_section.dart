import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_app/features/destinations/domain/entities/destination.dart';
import 'package:travel_booking_app/features/destinations/presentaion/manager/cubit/cubit/destination_cubit.dart';
import 'package:travel_booking_app/features/destinations/presentaion/manager/cubit/cubit/destination_state.dart';
import 'package:travel_booking_app/features/destinations/presentaion/views/widgets/attraction_widgets/attraction_card.dart';
import 'package:travel_booking_app/features/destinations/presentaion/views/widgets/attraction_widgets/attractions_empty_state.dart';
import 'package:travel_booking_app/features/destinations/presentaion/views/widgets/attraction_widgets/attractions_error_state.dart';
import 'package:travel_booking_app/features/destinations/presentaion/views/widgets/attraction_widgets/attractions_loading_state.dart';

class AttractionSection extends StatelessWidget {
  const AttractionSection({
    super.key,
    required this.destination,
  });

  final DestinationEntity destination;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DestinationCubit, DestinationState>(
      builder: (context, state) {
        return switch (state) {
          DestinationLoading() => const AttractionsLoadingState(),
          DestinationFailure(:final message) => AttractionsErrorState(
              message: message,
              onRetry: () => context
                  .read<DestinationCubit>()
                  .getAttractions(destination),
            ),
          DestinationSuccess(:final attractions) when attractions.isEmpty =>
            const AttractionsEmptyState(),
          DestinationSuccess(:final attractions) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: attractions
                  .map((attraction) => AttractionCard(attraction: attraction))
                  .toList(growable: false),
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
