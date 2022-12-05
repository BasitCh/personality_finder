part of 'token_bloc.dart';

abstract class TokenState extends Equatable {
  const TokenState();

  @override
  List<Object> get props => [];
}

class TokenInitial extends TokenState {}

class TokenSuccess extends TokenState {
  final RefreshTokenGeneral refreshTokenGeneral;

  const TokenSuccess({required this.refreshTokenGeneral});
}

// ignore: must_be_immutable
class TokenFailure extends TokenState {
  String error;
  TokenFailure({
    required this.error,
  });
}
