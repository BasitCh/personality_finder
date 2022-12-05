// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import '../../../../../features/login/domain/entities/auth_data.dart';
import '../../../../../features/login/domain/entities/profile.dart';
import '../../../../../features/settings/domain/entities/profile_response.dart';
import '../../../../../features/settings/domain/entities/user_details_data.dart';
import '../../app_constants.dart';
import '../auth_service/auth_service.dart';

class FacebookAuth extends AuthService {
  // TODO: Add API key for Facebook Sign in.
  // ignore: unused_field
  static const String _apiKey = '';

  @override
  Future<Either<AuthData, Exception>> signIn({
    String? email,
    String? password,
  }) async {
    // TODO: Implement sign in using plugin and keys.

    // return User
    return left(AuthData(accessToken: '', refreshToken: ''));
  }

  @override
  Future<Either<bool, Exception>> signOut() async {
    // TODO: Implement sign out.

    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() async {
    // TODO: Check if user is signed in using plugin.

    return false;
  }

  @override
  Future<String> getIdToken() {
    // TODO: Return ID Token.
    return Future.value('');
  }

  @override
  Future<String> getAccessToken() {
    // TODO: Return Access Token.
    return Future.value('');
  }

  @override
  Future<String> getRefreshToken() {
    // TODO: Return Refresh Token.
    return Future.value('');
  }

  @override
  Future<Either<UserDetailsData, Exception>> getUserDetails() {
    // TODO: implement getUserDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, Exception>> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, Exception>> resetPassword(
      {required String password, required String token}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<ProfileResponse, Exception>> updateProfile(
      {required Profile profile}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, Exception>> updatePassword(
      {required String oldPassword, required String newPassword}) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<bool, Exception>> deleteAccount() {
    // TODO: implement deleteAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthData, Exception>> signUp(
      {required String email,
      required String password,
      required String companyCode,
      required String firstName,
      required String lastName,
      required int yearOfBirth,
      required Gender gender,
      String? image}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<Either<ProfileResponse, Exception>> updateLocale({required Locale locale}) {
    // TODO: implement updateLocale
    throw UnimplementedError();
  }
}
