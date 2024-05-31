import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/dragon_model.dart';
import '../data/repo/dragon_repo.dart';

part 'dragon_state.dart';

class DragonCubit extends Cubit<DragonState> {
  final DragonsRepo _dragonRepo;
  DragonCubit(this._dragonRepo) : super(DragonInitial());

  getDragons() async {
    emit(DragonLoading());
    final response = await _dragonRepo.fetchAllDragons();
    response.fold((failure) {
      emit(DragonError(error: failure.message));
    }, (dragons) {
      emit(DragonLoaded(dragons: dragons));
    });
  }
}
