part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class UpdateProfile extends ProfileEvent {
  final Profile profile;

  const UpdateProfile({required this.profile});
}

class DeleteAccount extends ProfileEvent {}

class UpdateLocale extends ProfileEvent {
  final Locale locale;

  const UpdateLocale({required this.locale});
}
