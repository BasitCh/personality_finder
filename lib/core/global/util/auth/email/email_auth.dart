// Flutter imports:
// Package imports:
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:morphosis_template/core/global/util/device_id/device_id.dart';
import 'package:morphosis_template/core/global/util/notifications/push_notifications.dart';
import 'package:morphosis_template/features/login/domain/entities/auth_data.dart';
import 'package:morphosis_template/features/settings/domain/entities/logout_general.dart';
import 'package:uuid/uuid.dart';

// Project imports:
import '../../../../../di/injectable.dart';
import '../../../../../features/login/domain/entities/login_response.dart';
import '../../../../../features/login/domain/entities/profile.dart';
import '../../../../../features/login/domain/queries/auth_queries.dart';
import '../../../../../features/login/domain/repositories/auth_repo.dart';
import '../../../../../features/register/domain/entities/forget_password_response.dart';
import '../../../../../features/register/domain/entities/register_response.dart';
import '../../../../../features/register/domain/entities/reset_password_response.dart';
import '../../../../../features/settings/domain/entities/change_password_response.dart';
import '../../../../../features/settings/domain/entities/delete_account_response.dart';
import '../../../../../features/settings/domain/entities/profile_response.dart';
import '../../../../../features/settings/domain/entities/user_details_data.dart';
import '../../../error/network_exceptions.dart';
import '../../../graphql/gql_query_option.dart';
import '../../../graphql/gql_service_impl.dart';
import '../../app_constants.dart';
import '../auth_service/auth_service.dart';

class EmailAuth extends AuthService {
  final AuthRepo authRepo = AuthRepo();

  // TODO: Add API key for the plugin.
  // ignore: unused_field
  static const String _apiKey = '';

  @override
  Future<Either<AuthData, Exception>> signIn({
    String? email,
    String? password,
  }) async {
    // TODO: Implement sign in using plugin and keys.

    // final _options = CustomQueryOption.queryOption(
    //   AuthQueries.loginQuery(email!, password!),
    // );

    final firebaseToken = await PushNotifications().getToken();
    final platform = Platform.isIOS ? 'ios' : 'android';
    final uuid = await const Device().getId();

    final _options = MutationOptions(
      document: gql(AuthQueries.loginQuery(
          email!, password!, platform, firebaseToken, uuid)),
      variables: const <String, dynamic>{},
    );

    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.mutate(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = LoginResponse.fromJson(response.data!);

        final data = AuthData(
            accessToken: json.loginGeneral.token,
            refreshToken: json.loginGeneral.token);

        return left(data);
      } else if (response.hasException) {
        final error =
            response.exception!.linkException as HttpLinkServerException;

        final errorMessage = error.parsedResponse!.response['error'] as String;

        return right(Exception(errorMessage));
      } else {
        return right(Exception('Seomething went wrong.'));
      }
    } on HttpLinkServerException catch (e) {
      return right(e);
    } on ServerException catch (e) {
      return right(e);
    } on LinkException catch (e) {
      return right(e);
    } on OperationException catch (e) {
      return right(Exception(e));
    } on Exception catch (e) {
      return right(Exception(e));
    } on NetworkExceptions catch (e) {
      final error = NetworkExceptions.getErrorMessage(e);
      return right(Exception(error));
      // ignore: avoid_catching_errors
    }
  }

  @override
  Future<Either<bool, Exception>> signOut() async {
    final _options = CustomQueryOption.queryOption(
      AuthQueries.signOut(),
    );

    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.query(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = LogoutGeneral.fromJson(response.data!);

        if (json.logoutGeneral!.status) {
          return left(json.logoutGeneral!.status);
        } else {
          return left(true);
        }
      } else if (response.hasException) {
        return left(true);
      } else {
        return left(true);
      }
    } on LinkException catch (_) {
      return left(true);
    } on OperationException catch (_) {
      return left(true);
    } on Exception catch (_) {
      return left(true);
    } on NetworkExceptions catch (_) {
      return left(true);
      // ignore: avoid_catching_errors
    }
  }

  @override
  Future<bool> isSignedIn() async {
    // TODO: Check if user is signed in using plugin.
    return false;
  }

  @override
  Future<Either<UserDetailsData, Exception>> getUserDetails() async {
    final _options = CustomQueryOption.queryOption(
      AuthQueries.getUserDetailsQuery(),
    );

    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.query(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = UserDetailsData.fromJson(response.data!);

        return left(json);
      } else if (response.hasException) {
        final error =
            response.exception!.linkException as HttpLinkServerException;

        final errorMessage = error.parsedResponse!.response['error'] as String;

        return right(Exception(errorMessage));
      } else {
        return right(Exception('Seomething went wrong.'));
      }
    } on LinkException catch (e) {
      return right(e);
    } on OperationException catch (e) {
      return right(Exception(e));
    } on Exception catch (e) {
      return right(Exception(e));
    } on NetworkExceptions catch (e) {
      final error = NetworkExceptions.getErrorMessage(e);
      return right(Exception(error));
      // ignore: avoid_catching_errors
    }
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
  Future<Either<AuthData, Exception>> signUp(
      {String? email,
      String? password,
      String? companyCode,
      String? firstName,
      String? lastName,
      int? yearOfBirth,
      Gender? gender,
      String? firebaseToken,
      String? image}) async {
    // TODO: implement signUp

    final firebaseToken = await PushNotifications().getToken();
    final platform = Platform.isIOS ? 'ios' : 'android';
    final uuid = const Uuid().v4();

    final _options = MutationOptions(
        document: gql(
      AuthQueries.registerQuery(
          email: email!,
          password: password!,
          companyCode: companyCode!,
          firstName: firstName!,
          lastName: lastName!,
          yearOfBirth: yearOfBirth!,
          gender: gender!,
          platform: platform,
          image: image != null ? image : null,
          // ignore: unnecessary_null_comparison
          uuid: uuid != null ? uuid : null,
          registrationID: firebaseToken != null && firebaseToken.isNotEmpty
              ? firebaseToken
              : null),
    ));

    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.mutate(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = RegisterResponse.fromJson(response.data!);

        final data = AuthData(
            accessToken: json.registerGeneral.token,
            refreshToken: json.registerGeneral.token);

        return left(data);
      } else if (response.hasException) {
        final error =
            response.exception!.linkException as HttpLinkServerException;

        final errorMessage = error.parsedResponse!.response['error'] as String;

        return right(Exception(errorMessage));
      } else {
        return right(Exception('Seomething went wrong.'));
      }
    } on LinkException catch (e) {
      return right(e);
    } on OperationException catch (e) {
      return right(Exception(e));
    } on Exception catch (e) {
      return right(Exception(e));
    } on NetworkExceptions catch (e) {
      final error = NetworkExceptions.getErrorMessage(e);
      return right(Exception(error));
      // ignore: avoid_catching_errors
    }
  }

  @override
  Future<Either<bool, Exception>> forgetPassword(
      {required String email}) async {
    // TODO: implement forgetPassword

    final _options = CustomQueryOption.queryOption(
      AuthQueries.forgetPasswordQuery(
        email: email,
      ),
    );

    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.query(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = ForgetPasswordResponse.fromJson(response.data!);

        debugPrint(json.toString());

        if (json.forgotPasswordGeneral.status) {
          return left(true);
        } else {
          return right(Exception('Something wemt wrong.'));
        }
      } else if (response.hasException) {
        final error =
            response.exception!.linkException as HttpLinkServerException;

        final errorMessage = error.parsedResponse!.response['error'] as String;

        return right(Exception(errorMessage));
      } else {
        return right(Exception('Seomething went wrong.'));
      }
    } on LinkException catch (e) {
      return right(e);
    } on OperationException catch (e) {
      return right(Exception(e));
    } on Exception catch (e) {
      return right(Exception(e));
    } on NetworkExceptions catch (e) {
      final error = NetworkExceptions.getErrorMessage(e);
      return right(Exception(error));
      // ignore: avoid_catching_errors
    }
  }

  @override
  Future<Either<bool, Exception>> resetPassword(
      {required String password, required String token}) async {
    // TODO: implement changePassword

    final _options = CustomQueryOption.queryOption(
      AuthQueries.resetPasswordQuery(
        password: password,
        token: token,
      ),
    );

    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.query(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = ResetPasswordResponse.fromJson(response.data!);

        debugPrint(json.toString());

        return left(true);
      } else if (response.hasException) {
        final error =
            response.exception!.linkException as HttpLinkServerException;

        final errorMessage = error.parsedResponse!.response['error'] as String;

        return right(Exception(errorMessage));
      } else {
        return right(Exception('Seomething went wrong.'));
      }
    } on LinkException catch (e) {
      return right(e);
    } on OperationException catch (e) {
      return right(Exception(e));
    } on Exception catch (e) {
      return right(Exception(e));
    } on NetworkExceptions catch (e) {
      final error = NetworkExceptions.getErrorMessage(e);
      return right(Exception(error));
      // ignore: avoid_catching_errors
    }
  }

  @override
  Future<Either<ProfileResponse, Exception>> updateProfile(
      {required Profile profile}) async {
    //
    final _options = MutationOptions(
      document: gql(AuthQueries.updateProfileQuery(profile: profile)),
      variables: const <String, dynamic>{},
    );

    //
    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.mutate(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = ProfileResponse.fromJson(response.data!);

        return left(json);
      } else if (response.hasException) {
        final error =
            response.exception!.linkException as HttpLinkServerException;
        final errorMessage = error.parsedResponse!.response['error'] as String;

        return right(Exception(errorMessage));
      } else {
        return right(Exception('Seomething went wrong.'));
      }
    } on LinkException catch (e) {
      return right(e);
    } on OperationException catch (e) {
      return right(Exception(e));
    } on Exception catch (e) {
      return right(Exception(e));
    } on NetworkExceptions catch (e) {
      final error = NetworkExceptions.getErrorMessage(e);
      return right(Exception(error));
      // ignore: avoid_catching_errors
    }
  }

  @override
  Future<Either<bool, Exception>> updatePassword(
      {required String oldPassword, required String newPassword}) async {
    final _options = CustomQueryOption.queryOption(
      AuthQueries.updatePasswordQuery(
          oldPassword: oldPassword, newPassword: newPassword),
    );

    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.query(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = ChangePasswordResponse.fromJson(response.data!);
        if (json.changePasswordGeneral!.status) {
          return left(json.changePasswordGeneral!.status);
        } else {
          return right(Exception(response.exception!.graphqlErrors[0].message));
        }
      } else if (response.hasException) {
        final error =
            response.exception!.linkException as HttpLinkServerException;

        final errorMessage = error.parsedResponse!.response['error'] as String;

        return right(Exception(errorMessage));
      } else {
        return right(Exception('Seomething went wrong.'));
      }
    } on LinkException catch (e) {
      return right(e);
    } on OperationException catch (e) {
      return right(Exception(e));
    } on Exception catch (e) {
      return right(Exception(e));
    } on NetworkExceptions catch (e) {
      final error = NetworkExceptions.getErrorMessage(e);
      return right(Exception(error));
      // ignore: avoid_catching_errors
    }
  }

  @override
  Future<Either<bool, Exception>> deleteAccount() async {
    final _options = CustomQueryOption.queryOption(
      AuthQueries.deleteAccount(),
    );

    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.query(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = DeleteAccountResponse.fromJson(response.data!);
        if (json.deleteMyAccount!.status) {
          return left(json.deleteMyAccount!.status);
        } else {
          return right(Exception(response.exception!.graphqlErrors[0].message));
        }
      } else if (response.hasException) {
        final error =
            response.exception!.linkException as HttpLinkServerException;

        final errorMessage = error.parsedResponse!.response['error'] as String;

        return right(Exception(errorMessage));
      } else {
        return right(Exception('Seomething went wrong.'));
      }
    } on LinkException catch (e) {
      return right(e);
    } on OperationException catch (e) {
      return right(Exception(e));
    } on Exception catch (e) {
      return right(Exception(e));
    } on NetworkExceptions catch (e) {
      final error = NetworkExceptions.getErrorMessage(e);
      return right(Exception(error));
      // ignore: avoid_catching_errors
    }
  }

  @override
  Future<Either<ProfileResponse, Exception>> updateLocale(
      {required Locale locale}) async {
    //
    // final _options = CustomQueryOption.queryOption(
    //   AuthQueries.updateLocaleQuery(locale: locale),
    // );

    final _options = MutationOptions(
      document: gql(AuthQueries.updateLocaleQuery(locale: locale)),
      variables: const <String, dynamic>{},
    );

    //
    try {
      final response =
          await getIt<GraphQLServiceImpl>().graphQLClient!.mutate(_options);

      // ignore: unnecessary_null_comparison
      if (response.data != null) {
        final json = ProfileResponse.fromJson(response.data!);

        return left(json);
      } else if (response.hasException) {
        final error =
            response.exception!.linkException as HttpLinkServerException;
        final errorMessage = error.parsedResponse!.response['error'] as String;

        return right(Exception(errorMessage));
      } else {
        return right(Exception('Something went wrong.'));
      }
    } on LinkException catch (e) {
      return right(e);
    } on OperationException catch (e) {
      return right(Exception(e));
    } on Exception catch (e) {
      return right(Exception(e));
    } on NetworkExceptions catch (e) {
      final error = NetworkExceptions.getErrorMessage(e);
      return right(Exception(error));
      // ignore: avoid_catching_errors
    }
  }
}
