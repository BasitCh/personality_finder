part of 'tip_bloc.dart';

abstract class TipState extends Equatable {
  const TipState();

  @override
  List<Object> get props => [];
}

class TipInitial extends TipState {}

class LoadingTips extends TipState {}

class TipsLoaded extends TipState {
  final List<Tip> tips;
  final bool hasReachedMax;

  const TipsLoaded({required this.tips, this.hasReachedMax = false});

  TipsLoaded copyWith({
    List<Tip>? tips,
    bool? hasReachedMax,
  }) {
    return TipsLoaded(
      tips: tips ?? this.tips,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [tips, hasReachedMax];
}

class FailedLoadingTips extends TipState {
  final String error;

  const FailedLoadingTips({required this.error});
}
