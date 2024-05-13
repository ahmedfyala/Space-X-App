import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/features/crew/data/models/crew_model.dart';
import 'package:flutter_mentorship_b1/features/crew/data/repo/crew_repo.dart';

part 'crew_state.dart';

class CrewCubit extends Cubit<CrewState> {
  final CrewRepository crewRepo;

  CrewCubit(this.crewRepo) : super(CrewInitial());

  void getCrew() async {
    emit(CrewLoading());
    var response = await crewRepo.getCrew();
    response.fold(
      (failure) {
        emit(CrewError(error: failure.message));
      },
      (crew) {
        emit(CrewLoaded(crew: crew));
      },
    );
  }
}
