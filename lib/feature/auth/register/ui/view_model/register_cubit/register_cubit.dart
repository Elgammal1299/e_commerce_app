import 'package:e_commerce_app/feature/auth/register/data/model/register_body_model.dart';
import 'package:e_commerce_app/feature/auth/register/data/model/register_response_model.dart';
import 'package:e_commerce_app/feature/auth/register/data/repo/register_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerRepo) : super(RegisterInitial());
  final RegisterRepo registerRepo;
  Future<void> register(RegisterBodyModel body) async {
    emit(RegisterLoading());

    final result = await registerRepo.register(body);

    result.fold(
      (failure) {
        emit(RegisterError(failure.errMessage));
      },
      (response) {
        emit(RegisterSuccess(response, body.firstName));
      },
    );
  }
}
