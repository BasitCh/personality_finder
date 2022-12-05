// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import '../../../../core/global/error/network_exceptions.dart';
import '../../../login/domain/repositories/auth_repo.dart';

part 'reset_password_event.dart';

part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepo authRepo;

  ResetPasswordBloc({required this.authRepo}) : super(ResetPasswordInitial()) {
    //
    on<ForgetPassword>((event, emit) async {
      emit(ResetPasswordInitial());
      final data =
          await authRepo.forgetPassword(event.authType, email: event.email);

      emit(const ResetPasswordLoading());

      data.fold((l) {
        emit(const ResetPasswordSuccess());
      },
          (r) =>
              emit(ResetPasswordFailure(NetworkExceptions.getErrorMessage(r))));
    });
    //
    //perform login action

    //
    on<ResetPassword>((event, emit) async {
      emit(ResetPasswordInitial());
      final data = await authRepo.resetPassword(event.authType,
          password: event.password, token: event.token);

      emit(const ResetPasswordLoading());

      data.fold((l) {
        emit(const ResetPasswordSuccess());
      },
          (r) =>
              emit(ResetPasswordFailure(NetworkExceptions.getErrorMessage(r))));
    });
    //

    //
    on<UpdatePassword>((event, emit) async {
      emit(UpdatingPassword());
      final data = await authRepo.updatePassword(
          oldPassword: event.oldPassword, newPassword: event.newPassword);

      data.fold((l) {
        emit(PasswordUpdated());
      },
          (r) => emit(FailedUpdatingPassword(
              error: NetworkExceptions.getErrorMessage(r))));
    });
    //
  }
}
