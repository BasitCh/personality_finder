// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../../core/global/const.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse extends Equatable {
  final RegisterGeneral registerGeneral;

  const RegisterResponse({
    required this.registerGeneral,
  });

  factory RegisterResponse.fromJson(Json json) =>
      _$RegisterResponseFromJson(json);

  Json toJson() => _$RegisterResponseToJson(this);

  @override
  List<Object> get props => [
        registerGeneral,
      ];
}

@JsonSerializable()
class RegisterGeneral extends Equatable {
  final String token;
  final int expiresIn;

  const RegisterGeneral({
    required this.token,
    required this.expiresIn,
  });

  factory RegisterGeneral.fromJson(Json json) =>
      _$RegisterGeneralFromJson(json);

  Json? toJson() => _$RegisterGeneralToJson(this);

  @override
  List<Object?> get props => [
        token,
        expiresIn,
      ];

  @override
  String toString() => 'RegisterGeneral(token: $token, expiresIn: $expiresIn)';
}
