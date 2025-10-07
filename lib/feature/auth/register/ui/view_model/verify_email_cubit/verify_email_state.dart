part of 'verify_email_cubit.dart';

sealed class VerifyEmailState {}

final class VerifyEmailInitial extends VerifyEmailState {}

class VerifyEmailLoading extends VerifyEmailState {}

class VerifyEmailSuccess extends VerifyEmailState {
  final String response;
  VerifyEmailSuccess(this.response);
}

class VerifyEmailError extends VerifyEmailState {
  final String message;
  VerifyEmailError(this.message);
}
