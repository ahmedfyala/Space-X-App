import 'package:bloc/bloc.dart';
import 'package:flutter_mentorship_b1/features/rockets/data/repo/all_rockets_repo.dart';
import 'package:meta/meta.dart';

import '../data/modes/rocket_model.dart';

part 'all_rockets_state.dart';

class AllRocketsCubit extends Cubit<AllRocketsState> {
  AllRocketsCubit({required this.allRocketsRepo}) : super(AllRocketsInitial());
  final AllRocketsRepo allRocketsRepo;

  void fetchAllRockets() async {
    emit(GetAllRocketsLoading());
    var response = await allRocketsRepo.fetchAllRockets();
    response.fold((failure) {
      emit(GetAllRocketsError(failure.failure.message));
    }, (rockets) {
      emit(GetAllRocketsSuccess(rockets));
    });
  }
}
