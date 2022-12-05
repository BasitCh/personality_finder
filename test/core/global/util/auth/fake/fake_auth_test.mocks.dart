// Mocks generated by Mockito 5.3.0 from annotations
// in morphosis_template/test/core/global/util/auth/fake/fake_auth_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:morphosis_template/core/global/util/app_constants.dart' as _i9;
import 'package:morphosis_template/core/global/util/auth/fake/fake_auth.dart'
    as _i3;
import 'package:morphosis_template/features/login/domain/entities/auth_data.dart'
    as _i5;
import 'package:morphosis_template/features/login/domain/entities/profile.dart'
    as _i8;
import 'package:morphosis_template/features/settings/domain/entities/profile_response.dart'
    as _i7;
import 'package:morphosis_template/features/settings/domain/entities/user_details_data.dart'
    as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [FakeAuth].
///
/// See the documentation for Mockito's code generation for more information.
class MockFakeAuth extends _i1.Mock implements _i3.FakeAuth {
  MockFakeAuth() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.AuthData, Exception>> signIn(
          {String? email, String? password}) =>
      (super.noSuchMethod(
              Invocation.method(#signIn, [], {#email: email, #password: password}),
              returnValue: _i4.Future<_i2.Either<_i5.AuthData, Exception>>.value(
                  _FakeEither_0<_i5.AuthData, Exception>(
                      this,
                      Invocation.method(
                          #signIn, [], {#email: email, #password: password}))))
          as _i4.Future<_i2.Either<_i5.AuthData, Exception>>);
  @override
  _i4.Future<_i2.Either<bool, Exception>> signOut() =>
      (super.noSuchMethod(Invocation.method(#signOut, []),
              returnValue: _i4.Future<_i2.Either<bool, Exception>>.value(
                  _FakeEither_0<bool, Exception>(
                      this, Invocation.method(#signOut, []))))
          as _i4.Future<_i2.Either<bool, Exception>>);
  @override
  _i4.Future<bool> isSignedIn() =>
      (super.noSuchMethod(Invocation.method(#isSignedIn, []),
          returnValue: _i4.Future<bool>.value(false)) as _i4.Future<bool>);
  @override
  _i4.Future<String> getIdToken() =>
      (super.noSuchMethod(Invocation.method(#getIdToken, []),
          returnValue: _i4.Future<String>.value('')) as _i4.Future<String>);
  @override
  _i4.Future<String> getAccessToken() =>
      (super.noSuchMethod(Invocation.method(#getAccessToken, []),
          returnValue: _i4.Future<String>.value('')) as _i4.Future<String>);
  @override
  _i4.Future<String> getRefreshToken() =>
      (super.noSuchMethod(Invocation.method(#getRefreshToken, []),
          returnValue: _i4.Future<String>.value('')) as _i4.Future<String>);
  @override
  _i4.Future<_i2.Either<_i6.UserDetailsData, Exception>> getUserDetails() =>
      (super.noSuchMethod(Invocation.method(#getUserDetails, []),
              returnValue:
                  _i4.Future<_i2.Either<_i6.UserDetailsData, Exception>>.value(
                      _FakeEither_0<_i6.UserDetailsData, Exception>(
                          this, Invocation.method(#getUserDetails, []))))
          as _i4.Future<_i2.Either<_i6.UserDetailsData, Exception>>);
  @override
  _i4.Future<_i2.Either<bool, Exception>> forgetPassword({String? email}) =>
      (super.noSuchMethod(
              Invocation.method(#forgetPassword, [], {#email: email}),
              returnValue: _i4.Future<_i2.Either<bool, Exception>>.value(
                  _FakeEither_0<bool, Exception>(this,
                      Invocation.method(#forgetPassword, [], {#email: email}))))
          as _i4.Future<_i2.Either<bool, Exception>>);
  @override
  _i4.Future<_i2.Either<bool, Exception>> resetPassword(
          {String? password, String? token}) =>
      (super.noSuchMethod(Invocation.method(#resetPassword, [], {#password: password, #token: token}),
          returnValue: _i4.Future<_i2.Either<bool, Exception>>.value(
              _FakeEither_0<bool, Exception>(
                  this,
                  Invocation.method(#resetPassword, [], {
                    #password: password,
                    #token: token
                  })))) as _i4.Future<_i2.Either<bool, Exception>>);
  @override
  _i4.Future<_i2.Either<_i7.ProfileResponse, Exception>> updateProfile(
          {_i8.Profile? profile}) =>
      (super.noSuchMethod(Invocation.method(#updateProfile, [], {#profile: profile}),
              returnValue:
                  _i4.Future<_i2.Either<_i7.ProfileResponse, Exception>>.value(
                      _FakeEither_0<_i7.ProfileResponse, Exception>(
                          this,
                          Invocation.method(
                              #updateProfile, [], {#profile: profile}))))
          as _i4.Future<_i2.Either<_i7.ProfileResponse, Exception>>);
  @override
  _i4.Future<_i2.Either<bool, Exception>> updatePassword(
          {String? oldPassword, String? newPassword}) =>
      (super.noSuchMethod(Invocation.method(#updatePassword, [], {#oldPassword: oldPassword, #newPassword: newPassword}),
          returnValue: _i4.Future<_i2.Either<bool, Exception>>.value(
              _FakeEither_0<bool, Exception>(
                  this,
                  Invocation.method(#updatePassword, [], {
                    #oldPassword: oldPassword,
                    #newPassword: newPassword
                  })))) as _i4.Future<_i2.Either<bool, Exception>>);
  @override
  _i4.Future<_i2.Either<bool, Exception>> deleteAccount() =>
      (super.noSuchMethod(Invocation.method(#deleteAccount, []),
              returnValue: _i4.Future<_i2.Either<bool, Exception>>.value(
                  _FakeEither_0<bool, Exception>(
                      this, Invocation.method(#deleteAccount, []))))
          as _i4.Future<_i2.Either<bool, Exception>>);
  @override
  _i4.Future<_i2.Either<_i5.AuthData, Exception>> signUp(
          {String? email,
          String? password,
          String? companyCode,
          String? firstName,
          String? lastName,
          int? yearOfBirth,
          _i9.Gender? gender,
          String? image}) =>
      (super.noSuchMethod(
          Invocation.method(#signUp, [], {
            #email: email,
            #password: password,
            #companyCode: companyCode,
            #firstName: firstName,
            #lastName: lastName,
            #yearOfBirth: yearOfBirth,
            #gender: gender,
            #image: image
          }),
          returnValue: _i4.Future<_i2.Either<_i5.AuthData, Exception>>.value(
              _FakeEither_0<_i5.AuthData, Exception>(
                  this,
                  Invocation.method(#signUp, [], {
                    #email: email,
                    #password: password,
                    #companyCode: companyCode,
                    #firstName: firstName,
                    #lastName: lastName,
                    #yearOfBirth: yearOfBirth,
                    #gender: gender,
                    #image: image
                  })))) as _i4.Future<_i2.Either<_i5.AuthData, Exception>>);
  @override
  _i4.Future<_i2.Either<_i7.ProfileResponse, Exception>> updateLocale(
          {_i9.Locale? locale}) =>
      (super.noSuchMethod(Invocation.method(#updateLocale, [], {#locale: locale}),
              returnValue:
                  _i4.Future<_i2.Either<_i7.ProfileResponse, Exception>>.value(
                      _FakeEither_0<_i7.ProfileResponse, Exception>(
                          this,
                          Invocation.method(
                              #updateLocale, [], {#locale: locale}))))
          as _i4.Future<_i2.Either<_i7.ProfileResponse, Exception>>);
}
