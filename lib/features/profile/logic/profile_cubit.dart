import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/features/authentication/data/repo/auth_repo.dart';

import '../../../core/helpers/shared_preferences_helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  late String? name;
  late String? email;
  getUserData() async {
    emit(ProfileLoading());
    try {
      name = await SharedPreferencesHelper.getData('name');
      email = await SharedPreferencesHelper.getData('email');
      emit(ProfileSuccess());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
