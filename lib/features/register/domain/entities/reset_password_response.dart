// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../../core/global/const.dart';
import 'forget_password_response.dart';

part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse extends Equatable {
  final ForgotPasswordGeneral resetPasswordGeneral;

  const ResetPasswordResponse({
    required this.resetPasswordGeneral,
  });

  factory ResetPasswordResponse.fromJson(Json json) =>
      _$ResetPasswordResponseFromJson(json);

  Json toJson() => _$ResetPasswordResponseToJson(this);

  @override
  List<Object> get props => [
        resetPasswordGeneral,
      ];
}
