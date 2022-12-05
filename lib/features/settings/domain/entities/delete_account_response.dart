// Package imports:
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../register/domain/entities/forget_password_response.dart';

part 'delete_account_response.g.dart';

@JsonSerializable()
class DeleteAccountResponse {
  ForgotPasswordGeneral? deleteMyAccount;

  DeleteAccountResponse({this.deleteMyAccount});

  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteAccountResponseToJson(this);
}
