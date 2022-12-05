part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginChecking extends LoginState {
  const LoginChecking();
}

class LoginChecked extends LoginState {
  final bool isLoggedIn;
  const LoginChecked({required this.isLoggedIn});
}

class LoggingIn extends LoginState {
  const LoggingIn();
}

class LoggingOut extends LoginState {
  const LoggingOut();
}

class LoginSuccess extends LoginState {
  final AuthData authData;

  const LoginSuccess({required this.authData});
}

class LoginFailure extends LoginState {
  final String failure;

  const LoginFailure(this.failure);
}
