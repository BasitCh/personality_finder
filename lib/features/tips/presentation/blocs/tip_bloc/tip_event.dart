part of 'tip_bloc.dart';

abstract class TipEvent extends Equatable {
  const TipEvent();

  @override
  List<Object?> get props => [];
}

class InitialEvent extends TipEvent {}

class GetTips extends TipEvent {}
