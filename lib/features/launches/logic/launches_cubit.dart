import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/features/launches/data/repo/launches_repo.dart';

import '../data/models/launches_model.dart';

part 'launches_state.dart';

class LaunchesCubit extends Cubit<LaunchesState> {
  final LaunchesRepo launchesRepo;
  LaunchesCubit(this.launchesRepo) : super(LaunchesInitial());

  getLaunches() async {
    emit(LaunchesLoading());

    final response = await launchesRepo.getLaunches();
    response.fold((failure) {
      emit(LaunchesError(failure.message));
    }, (launches) {
      emit(LaunchesLoaded(launches));
    });
  }
}
