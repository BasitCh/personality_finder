// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../register/domain/entities/forget_password_response.dart';

part 'change_password_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ChangePasswordResponse {
  ForgotPasswordGeneral? changePasswordGeneral;

  ChangePasswordResponse({this.changePasswordGeneral});

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordResponseToJson(this);
}
