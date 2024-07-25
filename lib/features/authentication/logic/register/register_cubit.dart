import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/repo/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _userRepository;

  RegisterCubit(this._userRepository) : super(RegisterInitial());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool rememberMe = false;

  void changeRememberMe() {
    rememberMe = !rememberMe;
    emit(ChangeRememberMe());
  }

  Future<void> register() async {
    if (formKey.currentState!.validate() && rememberMe) {
      emit(RegisterLoading());
      var response = await _userRepository.register(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
      );
      response.fold(
        (failure) {
          emit(RegisterFailure(failure.message));
        },
        (user) {
          emit(RegisterSuccess());
        },
      );
    } else if (!rememberMe) {
      emit(RegisterFailure('Please check remember me'));
    }
  }
}
