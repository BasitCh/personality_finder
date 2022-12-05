import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:morphosis_template/core/global/error/network_exceptions.dart';
import 'package:morphosis_template/core/global/util/token/refresh/token_refresh.dart';
import 'package:morphosis_template/core/global/util/token/token_service/token_service.dart';
import 'package:morphosis_template/features/token_refresh/domain/entities/refresh_data.dart';

@LazySingleton()
class TokenRefreshRepo {
  late TokenService tokenService;
  Future<Either<RefreshData, NetworkExceptions>> refreshToken() async {
    try {
      tokenService = TokenRefresh();
      try {
        final response = await tokenService.tokenRefresh();

        return await response.fold((data) async {
          return left(data);
        }, (error) {
          return right(NetworkExceptions.defaultError(error.toString()));
        });
      } catch (e) {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }
}
