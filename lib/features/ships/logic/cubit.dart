import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/features/ships/data/repositore/ship_repository.dart';
import 'package:flutter_mentorship_b1/features/ships/logic/states.dart';

class ShipCubit extends Cubit<ShipStates> {
  ShipCubit(this.shipRepository) : super(ShipStates());
  final ShipRepository shipRepository;

  void getAllShips() async {
    emit(state.cobyWith(shipStatus: ShipStatus.lodaeng));
    var ships = state.ships?.toList();
    (await shipRepository.getAllShips()).fold((failure) {
      emit(
        state.cobyWith(
            shipStatus: ShipStatus.error, errorMessage: failure.message),
      );
    }, (data) {
      emit(state.cobyWith(shipStatus: ShipStatus.success, ships: ships));
    });
  }
}
