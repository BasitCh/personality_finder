part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}
class CheckLoginStatus extends LoginEvent{
  const CheckLoginStatus(); 
}
class PerformLogIn extends LoginEvent {
  final AuthType authType;
  final String? email;
  final String? password;
  const PerformLogIn({required this.authType, this.email, this.password});

  @override
  List<Object> get props => [];
}

class LogOut extends LoginEvent {
  const LogOut();

  @override
  List<Object> get props => [];
}