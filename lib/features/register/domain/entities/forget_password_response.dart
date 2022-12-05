// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../../core/global/const.dart';

part 'forget_password_response.g.dart';

@JsonSerializable()
class ForgetPasswordResponse extends Equatable {
  final ForgotPasswordGeneral forgotPasswordGeneral;

  const ForgetPasswordResponse({
    required this.forgotPasswordGeneral,
  });

  factory ForgetPasswordResponse.fromJson(Json json) =>
      _$ForgetPasswordResponseFromJson(json);

  Json toJson() => _$ForgetPasswordResponseToJson(this);

  @override
  List<Object> get props => [
        forgotPasswordGeneral,
      ];
}

@JsonSerializable()
class ForgotPasswordGeneral extends Equatable {
  final bool status;

  const ForgotPasswordGeneral({
    required this.status,
  });

  factory ForgotPasswordGeneral.fromJson(Json json) =>
      _$ForgotPasswordGeneralFromJson(json);

  Json? toJson() => _$ForgotPasswordGeneralToJson(this);

  @override
  List<Object?> get props => [
        status,
      ];

  @override
  String toString() => 'ForgotPasswordGeneral(token: $status)';
}
