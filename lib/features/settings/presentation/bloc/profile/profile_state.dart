part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class UpdatingProfile extends ProfileState {}

class ProfileUpdated extends ProfileState {
  final Profile profile;

  const ProfileUpdated({required this.profile});
}

class ErrorUpdatingProfile extends ProfileState {
  final String error;

  const ErrorUpdatingProfile({required this.error});
}

class DeletingAccount extends ProfileState {}

class AccountDeleted extends ProfileState {}

class FailedDeletingAccount extends ProfileState {
  final String error;

  const FailedDeletingAccount({required this.error});
}

class UpdatingLocale extends ProfileState {}

class LocaleUpdated extends ProfileState {
  final String locale;

  const LocaleUpdated({required this.locale});
}

class FailedUpdatingLocale extends ProfileState {
  final String error;

  const FailedUpdatingLocale({required this.error});
}
