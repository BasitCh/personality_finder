// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import '../../../../login/domain/repositories/auth_repo.dart';
import '../../../domain/entities/get_user_details.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AuthRepo authRepo;

  SettingsBloc({required this.authRepo}) : super(SettingsInitial()) {
    //fetch user profile
    on<FetchUserProfile>((event, emit) async {
      emit(LoadingProfile());
      final data = await authRepo.getUserDetails();
      data.fold((l) {
        if (l.getMyUserDetails != null && l.getMyUserDetails!.profile != null) {
          final state = l.getMyUserDetails;

          if (!state!.profile!.takenQuiz) {
            emit(QuizTaken());
          } else if (state.profile?.quizForceRetake == true) {
            emit(QuizForceRetake());
          } else {
            emit(GotToHome(userDetails: l.getMyUserDetails!));
          }
        }
      }, (r) => emit(ErrorLoadingProfile(error: r.toString())));
    });
  }
}
