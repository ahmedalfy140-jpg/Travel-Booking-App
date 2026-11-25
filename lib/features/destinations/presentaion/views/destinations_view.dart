import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_booking_app/core/di/injection_container.dart';
import 'package:travel_booking_app/features/destinations/presentaion/manager/cubit/cubit/destination_cubit.dart';
import 'package:travel_booking_app/features/destinations/presentaion/manager/cubit/cubit/destinations_list_cubit.dart';
import 'package:travel_booking_app/features/destinations/presentaion/views/widgets/destinations_view_body.dart';

class DestinationsView extends StatelessWidget {
  const DestinationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DestinationsListCubit>(
      create: (_) => sl<DestinationsListCubit>(),
      child: const Scaffold(
        body: DestinationsViewBody(),
      ),
    );
  }
}