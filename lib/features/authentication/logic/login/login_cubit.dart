import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository userRepository;

  LoginCubit(this.userRepository) : super(LoginInitial());

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      var response = await userRepository.login(
        email: emailController.text,
        password: passwordController.text,
      );
      response.fold(
        (failure) {
          log(failure.message);
          emit(LoginFailure(failure.message));
        },
        (user) {
          log(user.toString());
          emit(LoginSuccess());
        },
      );
    }
  }
}
