part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class UploadDocumentRegister extends RegisterEvent {
  const UploadDocumentRegister();
}

class PerformRegister extends RegisterEvent {
  final AuthType authType;
  final String? email;
  final String? password;
  final String companyCode;
  final String firstName;
  final String lastName;
  final int yearOfBirth;
  final Gender gender;
  final String? image;

  const PerformRegister(
      {required this.authType,
      required this.email,
      required this.password,
      required this.companyCode,
      required this.firstName,
      required this.lastName,
      required this.yearOfBirth,
      required this.gender,
      this.image});

  @override
  List<Object> get props => [];
}
