
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_app/features/destinations/domain/entities/destination.dart';
import 'package:travel_booking_app/features/destinations/domain/usecase/get_attraction.dart';

import 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  final GetAttractionUseCase getAttractionsUseCase;

  DestinationCubit({
    required this.getAttractionsUseCase,
  }) : super(const DestinationInitial());

  Future<void> getAttractions(DestinationEntity destination ) async {
    emit(const DestinationLoading());

    try {
      final attractions = await getAttractionsUseCase(
        destination: destination,
      );

      emit(DestinationSuccess(attractions));
    } catch (e) {
      emit(DestinationFailure(e.toString()));
    }
  }
}
