// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../../../../features/login/domain/entities/auth_data.dart';
import '../../../../../features/login/domain/entities/profile.dart';
import '../../../../../features/settings/domain/entities/profile_response.dart';
import '../../../../../features/settings/domain/entities/user_details_data.dart';
import '../../app_constants.dart';

abstract class AuthService {
  Future<Either<AuthData, Exception>> signIn({
    String? email,
    String? password,
  });

  Future<Either<AuthData, Exception>> signUp(
      {required String email,
      required String password,
      required String companyCode,
      required String firstName,
      required String lastName,
      required int yearOfBirth,
      required Gender gender,
      String? image});

  Future<Either<bool, Exception>> signOut();

  Future<bool> isSignedIn();

  Future<Either<UserDetailsData, Exception>> getUserDetails();

  Future<String> getIdToken();

  Future<String> getAccessToken();

  Future<String> getRefreshToken();

  Future<Either<bool, Exception>> forgetPassword({required String email});

  Future<Either<bool, Exception>> resetPassword(
      {required String password, required String token});

  Future<Either<bool, Exception>> updatePassword(
      {required String oldPassword, required String newPassword});

  Future<Either<ProfileResponse, Exception>> updateProfile(
      {required Profile profile});

  Future<Either<ProfileResponse, Exception>> updateLocale(
      {required Locale locale});

  Future<Either<bool, Exception>> deleteAccount();
}
