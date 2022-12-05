part of 'tip_details_bloc.dart';

@immutable
abstract class TipDetailsState {}

class TipDetailsInitial extends TipDetailsState {}

class LoadingTipDetails extends TipDetailsState {}

class TipDetailsLoaded extends TipDetailsState {
  final Tip tip;

  TipDetailsLoaded({required this.tip});
}

class FailedLoadingTipDetails extends TipDetailsState {
  final String error;

  FailedLoadingTipDetails({required this.error});
}
