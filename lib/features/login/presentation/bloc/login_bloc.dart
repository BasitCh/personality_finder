// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Project imports:
import '../../../../core/global/error/network_exceptions.dart';
import '../../domain/entities/auth_data.dart';
import '../../domain/repositories/auth_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo authRepo;
  LoginBloc({required this.authRepo}) : super(LoginInitial()) {
    //
    //check if user is already logged in
    on<CheckLoginStatus>((event, emit) async {
      emit(const LoginChecking());
      final isLoggedIn = await authRepo.isLoggedIn();
      emit(LoginChecked(isLoggedIn: isLoggedIn));
    });
    //
    //perform login action
    on<PerformLogIn>((event, emit) async {
      emit(const LoggingIn());
      final data = await authRepo.signIn(
        event.authType,
        email: event.email,
        password: event.password,
      );
      data.fold((l) {
        if (l.accessToken.isNotEmpty) {
          emit(LoginSuccess(authData: l));
        }
      }, (r) => emit(LoginFailure(NetworkExceptions.getErrorMessage(r))));
    });
    //
    //perform logout action
    on<LogOut>((event, emit) async {
      emit(const LoggingOut());
      await authRepo.logOut();
      emit(const LoginChecked(isLoggedIn: false));
    });
  }
}
