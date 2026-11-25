
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travel_booking_app/features/destinations/data/datasources/destination_local_data_source.dart';
import 'package:travel_booking_app/features/destinations/domain/entities/destination.dart';

class DestinationsListCubit extends Cubit<List<DestinationEntity>> {
  final DestinationLocalDataSource destinationLocalDataSource;

  DestinationsListCubit({
    required this.destinationLocalDataSource,
  }) : super(destinationLocalDataSource.getDestinations());

  void loadDestinations() {
    emit(destinationLocalDataSource.getDestinations());
  }
}
