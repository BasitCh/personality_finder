part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {
  const RegisterLoading();
}

class CreatingUser extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final AuthData authData;

  const RegisterSuccess({required this.authData});
}

class RegisterFailure extends RegisterState {
  final String failure;

  const RegisterFailure(this.failure);
}

class RegisterUploadDocumentLoading extends RegisterState {
  const RegisterUploadDocumentLoading();
}

class RegisterUploadDocumentFailure extends RegisterState {
  const RegisterUploadDocumentFailure();
}

class RegisterUploadDocumentSuccess extends RegisterState {
  final String imageUrl;

  const RegisterUploadDocumentSuccess({required this.imageUrl});
}
