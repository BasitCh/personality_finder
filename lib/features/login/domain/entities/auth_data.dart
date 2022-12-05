// Package imports:
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

// Project imports:
import '../../../../core/global/const.dart';

part 'auth_data.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class AuthData extends Equatable {
  String? displayName;
  String? idToken;
  String accessToken;
  String refreshToken;
  // TODO: Add remaining attributes

  AuthData({
    required this.accessToken,
    required this.refreshToken,
    this.displayName,
    this.idToken,
  });

  factory AuthData.fromJson(Json json) => _$AuthDataFromJson(json);

  Json? toJson() => _$AuthDataToJson(this);

  @override
  List<Object?> get props => [refreshToken, accessToken, idToken, displayName];
}
