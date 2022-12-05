// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../../core/global/const.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends Equatable {
  final LoginGeneral loginGeneral;

  const LoginResponse({
    required this.loginGeneral,
  });

  factory LoginResponse.fromJson(Json json) => _$LoginResponseFromJson(json);

  Json toJson() => _$LoginResponseToJson(this);

  @override
  List<Object> get props => [
        loginGeneral,
      ];
}

@JsonSerializable()
class LoginGeneral extends Equatable {
  final String token;
  final int expiresIn;

  const LoginGeneral({
    required this.token,
    required this.expiresIn,
  });

  factory LoginGeneral.fromJson(Json json) => _$LoginGeneralFromJson(json);

  Json? toJson() => _$LoginGeneralToJson(this);

  @override
  List<Object?> get props => [
        token,
        expiresIn,
      ];

  @override
  String toString() => 'LoginGeneral(token: $token, expiresIn: $expiresIn)';
}
