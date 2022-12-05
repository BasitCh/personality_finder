part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

class SettingsInitial extends SettingsState {}

class LoadingProfile extends SettingsState {}

// class ProfileLoadedState extends SettingsState {
//   final GetUserDetails userDetails;
//
//   const ProfileLoadedState({required this.userDetails});
// }

class ErrorLoadingProfile extends SettingsState {
  final String error;

  const ErrorLoadingProfile({required this.error});
}

class QuizTaken extends SettingsState {}

class QuizForceRetake extends SettingsState {}

class GotToHome extends SettingsState {
  final GetUserDetails userDetails;

  const GotToHome({required this.userDetails});
}
