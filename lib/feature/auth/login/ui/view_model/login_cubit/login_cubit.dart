
import 'package:e_commerce_app/feature/auth/login/data/model/login_body_model.dart';
import 'package:e_commerce_app/feature/auth/login/data/model/login_response_model.dart';
import 'package:e_commerce_app/feature/auth/login/data/repo/lodin_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.repo) : super(LoginInitial());
   final LoginRepo repo;
  Future<void> login(LoginBodyModel request) async {
    emit(LoginLoading());
    final result = await repo.login(request);
    result.fold(
      (failure) => emit(LoginError(failure.errMessage)),
      (response) => emit(LoginSuccess(response)),
    );
  }
}
