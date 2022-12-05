import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morphosis_template/core/global/error/network_exceptions.dart';
import 'package:morphosis_template/core/repository/secure_storage/auth/auth_storage_impl.dart';
import 'package:morphosis_template/di/injectable.dart';
import 'package:morphosis_template/features/token_refresh/domain/entities/refresh_data.dart';
import 'package:morphosis_template/features/token_refresh/domain/respositories/token_refresh_repo.dart';

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  final TokenRefreshRepo tokenRefreshRepo;

  TokenBloc({required this.tokenRefreshRepo}) : super(TokenInitial()) {
    on<TokenRefreshGet>((event, emit) async {
      emit(TokenInitial());
      final data = await tokenRefreshRepo.refreshToken();

      data.fold((l) async {
        final _authStorage = getIt<AuthStoring>();

        await _authStorage.saveUserCredentials(
          accessToken: l.refreshTokenGeneral!.token,
        );

        emit(TokenSuccess(refreshTokenGeneral: l.refreshTokenGeneral!));
      },
          (r) =>
              emit(TokenFailure(error: NetworkExceptions.getErrorMessage(r))));
    });
  }
}
