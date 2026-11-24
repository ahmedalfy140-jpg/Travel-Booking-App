
import 'package:equatable/equatable.dart';
import 'package:travel_booking_app/features/destinations/domain/entities/attraction.dart';


abstract class DestinationState extends Equatable {
  const DestinationState();

  @override
  List<Object?> get props => [];
}

class DestinationInitial extends DestinationState {
  const DestinationInitial();
}

class DestinationLoading extends DestinationState {
  const DestinationLoading();
}

class DestinationSuccess extends DestinationState {
  final List<AttractionEntity> attractions;

  const DestinationSuccess(this.attractions);

  @override
  List<Object?> get props => [attractions];
}

class DestinationFailure extends DestinationState {
  final String message;

  const DestinationFailure(this.message);

  @override
  List<Object?> get props => [message];
}
