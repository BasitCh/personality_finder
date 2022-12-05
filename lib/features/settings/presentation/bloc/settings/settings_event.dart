part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class FetchUserProfile extends SettingsEvent {
}

class ProfileTakeQuiz extends SettingsEvent {}

class FetchUserProfileQuizForceTaken extends SettingsEvent {}
