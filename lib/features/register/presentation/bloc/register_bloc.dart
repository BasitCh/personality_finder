// Dart imports:

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import '../../../../core/global/error/network_exceptions.dart';
import '../../../../core/global/util/app_constants.dart';
import '../../../login/domain/entities/auth_data.dart';
import '../../../login/domain/repositories/auth_repo.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepo authRepo;

  RegisterBloc({required this.authRepo}) : super(RegisterInitial()) {
    //
    //check if user is already logged in
    on<UploadDocumentRegister>((event, emit) async {
      emit(const RegisterLoading());
    });

    on<PerformRegister>((event, emit) async {
      emit(const RegisterLoading());
      final data = await authRepo.signUp(event.authType,
          email: event.email!,
          password: event.password!,
          companyCode: event.companyCode,
          firstName: event.firstName,
          lastName: event.lastName,
          yearOfBirth: event.yearOfBirth,
          gender: event.gender,
          image: event.image);

      data.fold((l) {
        if (l.accessToken.isNotEmpty) {
          emit(RegisterSuccess(authData: l));
        }
      }, (r) {
        emit(RegisterFailure(NetworkExceptions.getErrorMessage(r)));
      });
    });
  }
}
