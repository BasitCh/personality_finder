part of 'token_bloc.dart';

abstract class TokenEvent extends Equatable {
  const TokenEvent();

  @override
  List<Object> get props => [];
}

class TokenRefreshGet extends TokenEvent {
   const TokenRefreshGet();
}