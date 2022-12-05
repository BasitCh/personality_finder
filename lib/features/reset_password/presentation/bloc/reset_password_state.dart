part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {
  const ResetPasswordLoading();
}

class ResetPasswordSuccess extends ResetPasswordState {
  const ResetPasswordSuccess();
}

class ResetPasswordFailure extends ResetPasswordState {
  final String failure;

  const ResetPasswordFailure(this.failure);
}

class UpdatingPassword extends ResetPasswordState {}

class PasswordUpdated extends ResetPasswordState {}

class FailedUpdatingPassword extends ResetPasswordState {
  final String error;

  const FailedUpdatingPassword({required this.error});
}
