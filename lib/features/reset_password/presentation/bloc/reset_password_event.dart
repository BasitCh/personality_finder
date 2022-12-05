part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();
}

class ForgetPassword extends ResetPasswordEvent {
  final AuthType authType;
  final String? email;

  const ForgetPassword({required this.email, required this.authType});

  @override
  List<Object> get props => [];
}

class ResetPassword extends ResetPasswordEvent {
  final AuthType authType;
  final String password;
  final String token;

  const ResetPassword(
      {required this.authType, required this.password, required this.token});

  @override
  List<Object> get props => [];
}

class UpdatePassword extends ResetPasswordEvent {
  final String oldPassword;
  final String newPassword;

  const UpdatePassword({required this.oldPassword, required this.newPassword});

  @override
  List<Object?> get props => [oldPassword, newPassword];
}
