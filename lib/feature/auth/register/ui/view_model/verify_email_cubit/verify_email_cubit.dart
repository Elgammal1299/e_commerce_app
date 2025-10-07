import 'package:e_commerce_app/feature/auth/register/data/model/verify_otp_body.dart';
import 'package:e_commerce_app/feature/auth/register/data/repo/verify_email_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit(this.registerRepo) : super(VerifyEmailInitial());
  final VerifyEmailRepo registerRepo;
  Future<void> verifyEmail(VerifyOtpBody body) async {
    emit(VerifyEmailLoading());

    final result = await registerRepo.verifyEmail(body);

    result.fold(
      (failure) {
        emit(VerifyEmailError(failure.errMessage));
      },
      (response) {
        emit(VerifyEmailSuccess(response));
      },
    );
  }
}
