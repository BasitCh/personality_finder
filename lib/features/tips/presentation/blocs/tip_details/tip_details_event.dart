part of 'tip_details_bloc.dart';

@immutable
abstract class TipDetailsEvent {}

class FetchTipById extends TipDetailsEvent {
  final String tipId;

  FetchTipById({required this.tipId});
}
