// Flutter imports:
// Package imports:
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../../core/global/error/network_exceptions.dart';
import '../../../../core/global/util/app_constants.dart';
import '../../../../core/global/util/auth/auth_service/auth_service.dart';
import '../../../../core/global/util/auth/email/email_auth.dart';
import '../../../../core/repository/secure_storage/auth/auth_storage_impl.dart';
import '../../../../di/injectable.dart';
import '../../../settings/domain/entities/profile_response.dart';
import '../../../settings/domain/entities/user_details_data.dart';
import '../entities/auth_data.dart';
import '../entities/profile.dart';

enum AuthType {
  google,
  apple,
  facebook,
  email,
  fake,
}

@LazySingleton()
class AuthRepo {
  final _authStorage = getIt<AuthStoring>();
  late AuthService authService;

  //login feature
  Future<Either<AuthData, NetworkExceptions>> signIn(
    AuthType authType, {
    String? email,
    String? password,
  }) async {
    authService = EmailAuth();
    try {
      final response =
          await authService.signIn(email: email, password: password);
      return await response.fold((data) async {
        // await _authStorage.clear();

        await _authStorage.saveUserCredentials(
          accessToken: data.accessToken,
        );

        return left(data);
      }, (error) {
        return right(NetworkExceptions.defaultError(error.toString()));
      });
    } catch (e) {
      rethrow;
    }
  }

  //register feature
  Future<Either<AuthData, NetworkExceptions>> signUp(AuthType authType,
      {required String email,
      required String password,
      required String companyCode,
      required String firstName,
      required String lastName,
      required int yearOfBirth,
      required Gender gender,
      String? image}) async {
    authService = EmailAuth();
    try {
      final response = await authService.signUp(
          email: email,
          password: password,
          companyCode: companyCode,
          firstName: firstName,
          lastName: lastName,
          yearOfBirth: yearOfBirth,
          image: image,
          gender: gender);

      return await response.fold((data) async {
        await _authStorage.saveUserCredentials(
            accessToken: data.accessToken, refreshToken: data.refreshToken);

        return left(data);
      }, (error) {
        return right(NetworkExceptions.defaultError(error.toString()));
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return right(NetworkExceptions.defaultError(e.toString()));
    }
  }

  Future<bool> isLoggedIn() async {
    return _authStorage.hasLoggedInUser();
  }

  Future<String> getAccessToken() async {
    return await _authStorage.getAccessToken() ??
        await authService.getAccessToken();
  }

  Future<String> getRefreshToken() async {
    return await _authStorage.getRefreshToken() ??
        await authService.getRefreshToken();
  }

  Future<Either<UserDetailsData, Exception>> getUserDetails() async {
    authService = EmailAuth();
    try {
      final response = await authService.getUserDetails();

      return await response.fold((data) async {
        return left(data);
      }, right);
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<ProfileResponse, Exception>> updateProfile(
      {required Profile profile}) async {
    authService = EmailAuth();
    try {
      final response = await authService.updateProfile(profile: profile);

      return await response.fold((data) async {
        return left(data);
      }, right);
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<ProfileResponse, Exception>> updateLocale(
      {required Locale locale}) async {
    authService = EmailAuth();
    try {
      final response = await authService.updateLocale(locale: locale);

      return await response.fold((data) async {
        return left(data);
      }, right);
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<bool, Exception>> logOut() async {
    authService = EmailAuth();
    try {
      final response = await authService.signOut();

      return await response.fold((data) async {
        await _authStorage.clear();
        return left(data);
      }, (error) {
        return right(Exception(error.toString()));
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<bool, NetworkExceptions>> forgetPassword(
    AuthType authType, {
    String? email,
  }) async {
    authService = EmailAuth();
    try {
      final response = await authService.forgetPassword(email: email!);

      return await response.fold((data) async {
        return left(true);
      }, (error) {
        return right(NetworkExceptions.defaultError(error.toString()));
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<bool, NetworkExceptions>> resetPassword(AuthType authType,
      {String? password, String? token}) async {
    authService = EmailAuth();
    try {
      final response =
          await authService.resetPassword(token: token!, password: password!);

      debugPrint(response.toString());

      return await response.fold((data) async {
        return left(true);
      }, (error) {
        return right(NetworkExceptions.defaultError(error.toString()));
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<bool, NetworkExceptions>> updatePassword(
      {required String oldPassword, required String newPassword}) async {
    authService = EmailAuth();
    try {
      final response = await authService.updatePassword(
          oldPassword: oldPassword, newPassword: newPassword);

      return await response.fold((data) async {
        return left(true);
      }, (error) {
        return right(NetworkExceptions.defaultError(error.toString()));
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<bool, NetworkExceptions>> deleteAccount() async {
    authService = EmailAuth();
    try {
      final response = await authService.deleteAccount();

      return await response.fold((data) async {
        return left(true);
      }, (error) {
        return right(NetworkExceptions.defaultError(error.toString()));
      });
    } catch (e) {
      rethrow;
    }
  }
}
