import 'package:json_annotation/json_annotation.dart';
import 'package:morphosis_template/features/register/domain/entities/forget_password_response.dart';

part 'logout_general.g.dart';

@JsonSerializable(explicitToJson: true)
class LogoutGeneral {
  ForgotPasswordGeneral? logoutGeneral;

  LogoutGeneral({this.logoutGeneral});

  factory LogoutGeneral.fromJson(Map<String, dynamic> json) =>
      _$LogoutGeneralFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutGeneralToJson(this);
}
