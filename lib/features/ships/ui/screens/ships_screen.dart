import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/core/helpers/extensions.dart';
import 'package:flutter_mentorship_b1/features/ships/logic/cubit.dart';
import 'package:flutter_mentorship_b1/features/ships/logic/states.dart';

class ShipsScreen extends StatefulWidget {
  const ShipsScreen({super.key});

  @override
  State<ShipsScreen> createState() => _ShipsScreenState();
}

class _ShipsScreenState extends State<ShipsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ShipCubit, ShipStates>(
          builder: (context, state) {
            if (state.shipStatus.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.shipStatus.isError) {
              return Center(
                child: Text(state.errorMessage ?? '@@@@@@@@'),
              );
            }
            if (state.shipStatus.isSuccess) {
              return  Center(
                child: Text(state.ships![0].shipName.toString()),
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}
