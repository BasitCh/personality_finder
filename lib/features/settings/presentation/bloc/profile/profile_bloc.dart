// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:morphosis_template/core/global/util/app_constants.dart';

// Project imports:
import '../../../../login/domain/entities/profile.dart';
import '../../../../login/domain/repositories/auth_repo.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthRepo authRepo;

  ProfileBloc({required this.authRepo}) : super(ProfileInitial()) {
    //update user profile
    on<UpdateProfile>((event, emit) async {
      emit(UpdatingProfile());

      final data = await authRepo.updateProfile(profile: event.profile);
      data.fold((l) {
        if (l.updateProfile != null) {
          emit(ProfileUpdated(profile: l.updateProfile!));
        }
      }, (r) => emit(ErrorUpdatingProfile(error: r.toString())));
    });

    // delete user account
    on<DeleteAccount>((event, emit) async {
      emit(DeletingAccount());

      final data = await authRepo.deleteAccount();
      data.fold((l) {
        if (l) {
          emit(AccountDeleted());
        }
      }, (r) => emit(FailedDeletingAccount(error: r.toString())));
    });

    on<UpdateLocale>((event, emit) async {
      emit(UpdatingLocale());

      final data = await authRepo.updateLocale(locale: event.locale);
      data.fold((l) {
        if (l.updateProfile != null) {
          emit(LocaleUpdated(locale: l.updateProfile!.locale!));
        }
      }, (r) => emit(FailedUpdatingLocale(error: r.toString())));
    });
  }
}
