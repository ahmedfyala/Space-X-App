import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/features/ships/logic/states.dart';

import '../data/repository/ship_repository.dart';

class ShipCubit extends Cubit<ShipStates> {
  ShipCubit(this.shipRepository) : super(ShipStates());
  final ShipRepository shipRepository;

  void getAllShips() async {
    emit(state.cobyWith(shipStatus: ShipStatus.lodaeng));

    (await shipRepository.getAllShips()).fold((
      failure,
    ) {
      emit(
        state.cobyWith(
            shipStatus: ShipStatus.error, errorMessage: failure.message),
      );
    }, (data) {
      state.ships = data;
      emit(state.cobyWith(shipStatus: ShipStatus.success, ships: data));
    });
  }
}
